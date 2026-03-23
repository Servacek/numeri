#!/usr/bin/env python3
"""
isr_vars.py — ISR Variable Analyzer
======================================
Parses a disassembled AVR firmware (objdump -d output) and reports
every global/static variable that is read or written from any ISR
(__vector_N) body, grouped by C++ namespace with full readable names.

Approach
--------
  1. Scan for ISR entry-point labels  (^hex <__vector_N>:)
     and track which lines belong to each ISR body.
  2. Inside each ISR body, collect every  lds / sts / ldd / std
     instruction's inline symbol comment  (; 0xADDR <SYMBOL+offset>).
  3. Strip the +offset suffix to get the base symbol name.
  4. Bulk-demangle all collected mangled names via c++filt.
  5. Parse demangled names into (namespace, variable_name) pairs.
  6. Pretty-print: grouped by namespace, color-coded, with
     per-variable read/write annotation and originating ISR vector.

Usage
-----
  python3 isr_vars.py  firmware.asm
"""

import re
import sys
import subprocess
from pathlib import Path
from collections import defaultdict

# ─── ANSI colours ─────────────────────────────────────────────────────────────
RST   = "\033[0m"
BOLD  = "\033[1m"
DIM   = "\033[2m"
ITAL  = "\033[3m"
UL    = "\033[4m"

RED   = "\033[91m";  GRN  = "\033[92m";  YLW  = "\033[93m"
BLU   = "\033[94m";  MAG  = "\033[95m";  CYN  = "\033[96m"
WHT   = "\033[97m";  BLK  = "\033[30m"
GRY   = "\033[37m"

BG_DARK  = "\033[48;5;232m"
BG_NAVY  = "\033[48;5;17m"
BG_RED   = "\033[48;5;160m"
BG_GRN   = "\033[48;5;22m"
BG_GOLD  = "\033[48;5;130m"
BG_TEAL  = "\033[48;5;23m"

def S(*codes):   return "".join(codes)
def C(t, *c):    return S(*c) + str(t) + RST

# Namespace colours cycling
_NS_PALETTE = [CYN, GRN, MAG, YLW, BLU, RED, S(BOLD, WHT)]
def ns_fg(ns: str) -> str:
    return _NS_PALETTE[sum(ord(c) for c in ns) % len(_NS_PALETTE)] if ns else WHT

# ─── Patterns ─────────────────────────────────────────────────────────────────
LABEL_RE  = re.compile(r'^[0-9a-fA-F]+\s+<([^>]+)>:$')
MEMOP_RE  = re.compile(r'\b(lds|sts|ldd|std)\b')
SYMCMT_RE = re.compile(r';\s*0x[0-9a-fA-F]+\s+<([^>]+)>')

# ─── Demangling ───────────────────────────────────────────────────────────────

def bulk_demangle(symbols: list[str]) -> dict[str, str]:
    """
    Demangle a list of mangled C++ names in one c++filt call.
    Returns a dict  mangled → demangled.
    Already-readable names (no mangling) are returned unchanged.
    """
    if not symbols:
        return {}
    try:
        result = subprocess.run(
            ["c++filt"],
            input="\n".join(symbols),
            capture_output=True, text=True, timeout=10
        )
        outputs = result.stdout.splitlines()
    except Exception:
        outputs = symbols  # fallback: identity

    return {sym: out for sym, out in zip(symbols, outputs)}


def clean_demangled(demangled: str) -> str:
    """
    Strip template arguments from a fully demangled name.
    e.g.  Foo::Bar<X, Y>::baz  →  Foo::Bar::baz
    """
    # Iteratively strip innermost <...> groups
    prev = None
    s = demangled
    while s != prev:
        prev = s
        s = re.sub(r'<[^<>]*>', '', s)
    # Collapse any remaining dangling :: caused by stripping
    s = re.sub(r'::::', '::', s)
    s = s.strip(':')
    return s


def parse_name(demangled: str) -> tuple[str, str]:
    """
    Split a fully-qualified demangled name into (namespace, variable_name).
    Templates are stripped first.
      'Display::Crossfading::seg_duty'    → ('Display::Crossfading', 'seg_duty')
      'timer_counter'                     → ('', 'timer_counter')
      '_ms_ticks'                         → ('', '_ms_ticks')  → displayed as 'ms_ticks'
    """
    cleaned = clean_demangled(demangled)
    parts   = cleaned.split('::')
    if len(parts) == 1:
        name = parts[0].lstrip('_')
        return ('', name)
    ns   = '::'.join(parts[:-1])
    name = parts[-1].lstrip('_')
    return (ns, name)


# ─── Assembly parsing ─────────────────────────────────────────────────────────

class VarAccess:
    __slots__ = ('mangled', 'demangled', 'namespace', 'varname',
                 'reads', 'writes', 'vectors')

    def __init__(self, mangled: str, demangled: str):
        self.mangled    = mangled
        self.demangled  = demangled
        ns, vn          = parse_name(demangled)
        self.namespace  = ns
        self.varname    = vn
        self.reads: int  = 0
        self.writes: int = 0
        self.vectors: set[str] = set()

    @property
    def display_ns(self):
        return self.namespace or '<global>'

    @property
    def access_tag(self) -> str:
        if self.reads and self.writes:
            return 'R/W'
        if self.reads:
            return 'R  '
        return '  W'


def parse_asm(path: Path) -> dict[str, VarAccess]:
    """
    Walk the disassembly file.  For every ISR body (__vector_N),
    record each symbol accessed via a memory instruction.
    Returns  mangled_sym → VarAccess.
    """
    lines = path.read_text(errors='ignore').splitlines()

    # Build list of (start_line, end_line, vector_name) for each ISR
    label_positions: list[tuple[int, str]] = []
    for i, line in enumerate(lines):
        m = LABEL_RE.match(line)
        if m:
            label_positions.append((i, m.group(1)))

    isr_ranges: list[tuple[int, int, str]] = []
    for idx, (lineno, name) in enumerate(label_positions):
        if not name.startswith('__vector_'):
            continue
        # ISR body ends at the next label
        end = label_positions[idx + 1][0] if idx + 1 < len(label_positions) else len(lines)
        isr_ranges.append((lineno, end, name))

    # Collect accesses
    raw: dict[str, VarAccess] = {}  # mangled base → VarAccess (pending demangle)
    # First pass: collect raw mangled symbols + access kind per ISR
    sym_reads:  dict[str, int] = defaultdict(int)
    sym_writes: dict[str, int] = defaultdict(int)
    sym_vecs:   dict[str, set] = defaultdict(set)

    for start, end, vector in isr_ranges:
        for line in lines[start:end]:
            mo = MEMOP_RE.search(line)
            if not mo:
                continue
            mc = SYMCMT_RE.search(line)
            if not mc:
                continue
            sym_raw = mc.group(1)
            # Strip +0xOFFSET suffix → get base symbol
            sym = sym_raw.split('+', 1)[0]
            # Skip linker/runtime artefacts
            if sym.startswith('__') or sym.startswith('_TEXT_') or sym.startswith('_ZL0'):
                continue
            opcode = mo.group(1)
            is_write = opcode in ('sts', 'std')
            if is_write:
                sym_writes[sym] += 1
            else:
                sym_reads[sym] += 1
            sym_vecs[sym].add(vector)

    all_syms = sorted(set(sym_reads) | set(sym_writes))
    if not all_syms:
        return {}

    demangled_map = bulk_demangle(all_syms)

    for sym in all_syms:
        dem = demangled_map.get(sym, sym)
        va = VarAccess(sym, dem)
        va.reads  = sym_reads[sym]
        va.writes = sym_writes[sym]
        va.vectors = sym_vecs[sym]
        raw[sym] = va

    return raw


# ─── Rendering ────────────────────────────────────────────────────────────────

W = 74   # terminal width (conservative)

VECTOR_NAMES = {
    '__vector_1':  'INT0      (PD2 – external)',
    '__vector_2':  'INT1      (PD3 – external)',
    '__vector_7':  'TIMER2_COMPA  (1 kHz system tick)',
    '__vector_24': 'TWI       (I²C hardware)',
}

def _vector_label(v: str) -> str:
    return VECTOR_NAMES.get(v, v)


def _rw_badge(va: VarAccess) -> str:
    if va.reads and va.writes:
        return C('R', BLU, BOLD) + C('/', DIM) + C('W', YLW, BOLD)
    if va.reads:
        return C(' R ', BLU, BOLD)
    return C(' W ', YLW, BOLD)


def _vec_badges(va: VarAccess) -> str:
    short = {
        '__vector_1':  C('INT0', MAG, DIM),
        '__vector_2':  C('INT1', MAG, DIM),
        '__vector_7':  C('TMR2', GRN, DIM),
        '__vector_24': C('TWI ', CYN, DIM),
    }
    return '  '.join(short.get(v, C(v, DIM)) for v in sorted(va.vectors))


def render(accesses: dict[str, VarAccess]) -> None:
    # Group by namespace
    by_ns: dict[str, list[VarAccess]] = defaultdict(list)
    for va in accesses.values():
        by_ns[va.display_ns].append(va)

    # Header
    print()
    bar = C('━' * W, DIM)
    print(bar)
    title = '  ISR VARIABLE REPORT  '
    pad   = W - len(title)
    print(C(f"{'':>{pad // 2}}{title}", BOLD + BG_NAVY + WHT))
    print(bar)

    total_vars    = len(accesses)
    total_vectors = set()
    for va in accesses.values():
        total_vectors |= va.vectors

    print()
    print(f"  {C('Vectors active:', DIM)}  " +
          '  '.join(C(_vector_label(v), GRN, BOLD) for v in sorted(total_vectors)))
    print()
    print(bar)
    print()

    for ns in sorted(by_ns.keys()):
        fg  = ns_fg(ns)
        va_list = sorted(by_ns[ns], key=lambda v: v.varname.lower())

        # Namespace header box
        ns_label = f'  {ns}  '
        bw       = len(ns_label)
        print(f"  {C('┌' + '─' * (bw) + '┐', fg + DIM)}")
        print(f"  {C('│', fg + DIM)}{C(ns_label, BOLD + fg)}{C('│', fg + DIM)}")
        print(f"  {C('└' + '─' * (bw) + '┘', fg + DIM)}")
        print()

        for va in va_list:
            rw    = _rw_badge(va)
            vecs  = _vec_badges(va)
            name  = C(va.varname, BOLD + WHT)
            dot   = C('●', fg)
            cnt_r = C(f'↓{va.reads}', BLU, DIM)  if va.reads  else ''
            cnt_w = C(f'↑{va.writes}', YLW, DIM) if va.writes else ''
            counts = f'{cnt_r} {cnt_w}'.strip()

            print(f"    {dot}  {name:<38}  {rw}  [{vecs}]  {counts}")

        print()

    print(bar)
    print(f"  {C(total_vars, BOLD + GRN)} variables touched from ISR context"
          f"  ·  "
          f"{C(len(total_vectors), BOLD + CYN)} active vector(s)")
    print(bar)
    print()


# ─── Entry point ──────────────────────────────────────────────────────────────

def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <firmware.asm>", file=sys.stderr)
        sys.exit(2)

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"File not found: {path}", file=sys.stderr)
        sys.exit(1)

    accesses = parse_asm(path)
    if not accesses:
        print("No ISR variable accesses found.", file=sys.stderr)
        sys.exit(0)

    render(accesses)


if __name__ == '__main__':
    main()
