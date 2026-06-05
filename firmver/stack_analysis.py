#!/usr/bin/env python3
"""
Stack-usage analysis for ATmega328P firmware.

Postup:
  1. Skompiluje env `stack_analysis` (LTO vypnute, -fstack-usage zapnute).
  2. Naparsuje per-funkciu .su subory (frame size).
  3. Naparsuje call-graph z `avr-objdump -d -C` (demangled).
  4. DFS-om pre __vector_7, setup() a main najde najhlbsi retazec
     (sucet frame velkosti) a vypise ho.

Pouzitie:
    python stack_analysis.py            # plne meranie + report
    python stack_analysis.py --no-build # preskoci build, pouzije existujuce artefakty

Vystupy:
    .pio/build/stack_analysis/*.su       (gcc-generovane per-TU)
    .pio/build/stack_analysis/firmware.elf
"""
import argparse
import collections
import os
import re
import subprocess
import sys
from pathlib import Path

ENV = "stack_analysis"
BUILD_DIR = Path(".pio") / "build" / ENV
TOTAL_RAM = 2048  # ATmega328P

# ANSI farby (na Windowse zapneme cez WinAPI nizsie).
class C:
    BOLD   = "\033[1m"
    DIM    = "\033[2m"
    GREEN  = "\033[32m"
    YELLOW = "\033[33m"
    RED    = "\033[31m"
    CYAN   = "\033[36m"
    RESET  = "\033[0m"

# Typedef-y ktore objdump rozvinie na kanonicke mena, .su ich nechava.
TYPEDEFS = [
    (r"\buint8_t\b",   "unsigned char"),
    (r"\bint8_t\b",    "signed char"),
    (r"\buint16_t\b",  "unsigned int"),
    (r"\bint16_t\b",   "int"),
    (r"\buint32_t\b",  "long unsigned int"),
    (r"\bint32_t\b",   "long int"),
    (r"\buintptr_t\b", "unsigned int"),
    (r"\bsize_t\b",    "unsigned int"),
]


def find_tool(*candidates):
    """Najde prvy existujuci nastroj v zozname kandidatov."""
    home = Path.home()
    bases = [
        home / ".platformio" / "penv" / "Scripts",
        home / ".platformio" / "penv" / "bin",
        home / ".platformio" / "packages" / "toolchain-atmelavr" / "bin",
    ]
    for name in candidates:
        for base in bases:
            for ext in ("", ".exe"):
                p = base / (name + ext)
                if p.exists():
                    return str(p)
    return None


def run_build():
    pio = find_tool("pio", "platformio")
    if not pio:
        print("CHYBA: nepodarilo sa najst pio.exe v ~/.platformio/penv/", file=sys.stderr)
        sys.exit(1)
    print(f"[1/4] Cistim a kompilujem env `{ENV}` (LTO off, -fstack-usage on)...")
    subprocess.run([pio, "run", "-e", ENV, "--target", "clean"],
                   check=True, stdout=subprocess.DEVNULL)
    r = subprocess.run([pio, "run", "-e", ENV], capture_output=True, text=True)
    if r.returncode != 0:
        print(r.stdout)
        print(r.stderr, file=sys.stderr)
        sys.exit(r.returncode)
    print("      OK")


def norm(name):
    """Kanonicka forma symbolu pre porovnanie .su vs objdump."""
    name = re.sub(r"\s*\[with [^\]]*\]", "", name)
    # Sploschti `<...>` na `<>` (s podporou vnoreni).
    out, depth = [], 0
    for c in name:
        if c == "<":
            if depth == 0:
                out.append("<>")
            depth += 1
        elif c == ">":
            depth -= 1
        elif depth == 0:
            out.append(c)
    name = "".join(out)
    for pat, rep in TYPEDEFS:
        name = re.sub(pat, rep, name)
    name = re.sub(r"\s*\[clone [^\]]*\]", "", name)
    name = re.sub(r"\bconst\b\s*", "", name)
    name = re.sub(r"\bvolatile\b\s*", "", name)
    # `long int` / `long unsigned int` (su preferuje long forms; objdump preferuje short).
    # Zjednotime na short formu, ktoru pouziva objdump.
    name = re.sub(r"\blong\s+unsigned\s+int\b", "unsigned long", name)
    name = re.sub(r"\blong\s+int\b", "long", name)
    name = re.sub(r"\bshort\s+unsigned\s+int\b", "unsigned short", name)
    name = re.sub(r"\bshort\s+int\b", "short", name)
    # Odstran medzery okolo interpunkcie.
    name = re.sub(r"\s*([\(\),&\*])\s*", r"\1", name)
    name = re.sub(r"\s+", " ", name).strip()
    return name


# Regex pre `.su` riadok: "any:path:LINE:COL:signature\tFRAME\tTYPE".
# Greedy `.+` na ceste pokryje aj absolutne Windows cesty (`C:\...`),
# pretoze sledujuce :LINE:COL: su CISLA — neambiguitne.
_SU_LINE_RE = re.compile(r"^(.+):(\d+):(\d+):(.+)$")


def parse_su_files():
    """Vrati (frames, dynamic_funcs):
       frames - mapa normalizovany-podpis -> frame size (int)
       dynamic_funcs - set funkcii s 'dynamic' alebo 'dynamic,bounded' typom
                       (alloca / VLA -> frame nie je staticky znamy).
    """
    frames = {}
    dynamic_funcs = set()
    su_files = list(BUILD_DIR.rglob("*.su"))
    if not su_files:
        print(f"CHYBA: ziadne .su subory v {BUILD_DIR}", file=sys.stderr)
        sys.exit(1)
    for path in su_files:
        for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
            parts = line.split("\t")
            if len(parts) < 2:
                continue
            sig = parts[0]
            try:
                fb = int(parts[1])
            except ValueError:
                continue
            sutype = parts[2] if len(parts) > 2 else ""
            m = _SU_LINE_RE.match(sig)
            if not m:
                continue
            name = m.group(4)
            # Odrez navratovy typ: chod spat od prveho '(' po medzeru pri depth==0.
            p = name.find("(")
            if p >= 0:
                d, cut = 0, -1
                for i in range(p - 1, -1, -1):
                    c = name[i]
                    if c == ">":
                        d += 1
                    elif c == "<":
                        d -= 1
                    elif c == " " and d == 0:
                        cut = i
                        break
                if cut >= 0:
                    name = name[cut + 1:]
            nname = norm(name)
            if nname not in frames or fb > frames[nname]:
                frames[nname] = fb
            if "dynamic" in sutype:
                dynamic_funcs.add(nname)
    return frames, dynamic_funcs


def get_static_ram(elf_path):
    """Vrati staticku RAM (data + bss + noinit) z avr-size -A."""
    size = find_tool("avr-size")
    if not size:
        return None
    r = subprocess.run([size, "-A", str(elf_path)],
                       capture_output=True, text=True, check=True)
    total = 0
    for line in r.stdout.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] in (".data", ".bss", ".noinit"):
            try:
                total += int(parts[1])
            except ValueError:
                pass
    return total or None


# Direct calls (push return adresu): call, rcall
# Tail calls (bez push, ale ekvivalentne ako edge v call grafe): jmp, rjmp
# Iba ak ciel je INA funkcia nez sucasna (inak je to lokalny vetva v ramci funkcie).
# Indirect (cez Z reg.): icall, eicall, ijmp — staticky neviditelny ciel.
_FUNC_DEF_RE = re.compile(r"^[0-9a-f]+ <(.+)>:$")
_DIRECT_INSN_RE = re.compile(r"^[ ]+[0-9a-f]+:.*\t(call|rcall|jmp|rjmp)\t")
_INDIRECT_INSN_RE = re.compile(r"\t(icall|eicall|ijmp)\b")


def parse_call_graph(elf_path):
    """Vrati (calls, indirect_sites, all_funcs):
       calls          - dict: caller -> set(callees) (direct + tail-call)
       indirect_sites - dict: caller -> count of icall/eicall/ijmp
       all_funcs      - set vsetkych funkcii v .elf (mena vid <SYM>:).
    """
    objdump = find_tool("avr-objdump")
    if not objdump:
        print("CHYBA: avr-objdump nenajdeny", file=sys.stderr)
        sys.exit(1)
    r = subprocess.run([objdump, "-d", "-C", str(elf_path)],
                       capture_output=True, text=True, check=True)
    calls = collections.defaultdict(set)
    indirect_sites = collections.Counter()
    all_funcs = set()
    cur = None
    cur_raw = None  # nenormalizovany nazov pre porovnanie s `<cur+0xN>` lokalnych skokov
    for line in r.stdout.splitlines():
        m = _FUNC_DEF_RE.match(line)
        if m:
            cur_raw = m.group(1)
            cur = norm(cur_raw)
            all_funcs.add(cur)
            continue
        if not cur:
            continue
        # Indirect call/jump — staticky nezistitelny ciel.
        if _INDIRECT_INSN_RE.search(line):
            indirect_sites[cur] += 1
            continue
        if not _DIRECT_INSN_RE.match(line):
            continue
        # Format: "...\t<insn>\tdest\t; 0xADDR <SYM>"
        pos = line.find("; 0x")
        if pos < 0:
            continue
        rest = line[pos:]
        lt = rest.find("<")
        if lt < 0:
            continue
        sym = rest[lt + 1:].rstrip()
        if sym.endswith(">"):
            sym = sym[:-1]
        # Skoky v ramci sucasnej funkcie su `<func+0xN>` — to su lokalne vetvy.
        # Vyhod ich (nie su to edges v call grafe).
        if sym.startswith(cur_raw + "+") or sym == cur_raw:
            continue
        sym = re.sub(r"\+0x[0-9a-f]+$", "", sym)
        calls[cur].add(norm(sym))
    return dict(calls), dict(indirect_sites), all_funcs


def frame_lookup(fn, frames):
    """Vyhladaj frame s toleranciou na () suffix."""
    if fn in frames:
        return frames[fn]
    if fn + "()" in frames:
        return frames[fn + "()"]
    if fn.endswith("()") and fn[:-2] in frames:
        return frames[fn[:-2]]
    return None


# Vysledok DFS: tuple (total, path, unbounded_path).
# total          - int sucet frame, alebo None ak unbounded
# path           - zoznam "fn(frame)" v poradi volania (max chain)
# unbounded_path - ak nie None, recurzia bola detegovana s touto cestou
def deepest_chain(root, frames, calls, missing_set=None):
    sys.setrecursionlimit(5000)
    def go(fn, path_list):
        if fn in path_list:
            # Najdena recurzia — vrat oznacenie nepouzitelneho vysledku.
            cycle = path_list[path_list.index(fn):] + [fn]
            return None, [], cycle
        f = frame_lookup(fn, frames)
        if f is None and missing_set is not None and calls.get(fn):
            missing_set.add(fn)
        fnum = f if f is not None else 0
        best_total = 0
        best_path = []
        unbounded = None
        new_path = path_list + [fn]
        for c in sorted(calls.get(fn, ())):
            s, p, ub = go(c, new_path)
            if ub is not None and unbounded is None:
                unbounded = ub
            if s is None:
                continue
            if s > best_total:
                best_total, best_path = s, p
        tag = f"({fnum}{'?' if f is None else ''})"
        return fnum + best_total, [fn + tag] + best_path, unbounded

    return go(root, [])


def list_isr_vectors(all_funcs):
    """Vrati zoradeny zoznam vsetkych __vector_N najdenych v binarce."""
    rx = re.compile(r"^__vector_(\d+)(\(\))?$")
    out = []
    for fn in all_funcs:
        m = rx.match(fn)
        if m:
            out.append((int(m.group(1)), fn))
    out.sort()
    return [fn for _, fn in out]


def print_chain(title, root, frames, calls, ret_addr_bytes=2, hw_push=0,
                missing_set=None):
    total, path, unbounded = deepest_chain(root, frames, calls, missing_set)
    print(f"\n=== {title} ===")
    if unbounded is not None:
        print(f"{C.RED}{C.BOLD}NEOHRANICENA — detegovana rekurzia:{C.RESET}")
        print("  " + " -> ".join(unbounded))
        print(f"{C.RED}Staticka analyza nemoze dat hornu hranicu.{C.RESET}")
        return None
    n_edges = max(0, len(path) - 1)
    # KONZERVATIVNE: ratame 2B per edge aj pri tail-call (jmp/rjmp), aj ked ten
    # v skutocnosti nepusha return adresu. Mierne nadhodnotenie = bezpecnejsi odhad.
    overhead = hw_push + n_edges * ret_addr_bytes
    print(f"Frame sum: {total} B")
    print(f"+ {n_edges} call-edges x {ret_addr_bytes} B (konzervativne, vratane tail-call) "
          f"= {n_edges * ret_addr_bytes} B")
    if hw_push:
        print(f"+ HW push PC (interrupt entry) = {hw_push} B")
    print(f"= worst-case stack: {total + overhead} B")
    for p in path[:30]:
        print(f"  -> {p}")
    if len(path) > 30:
        print(f"  ... +{len(path) - 30} dalsich")
    return total + overhead


def bar(used, total, width=40):
    """ASCII bar: '[####....] 60%'. Pouziva # a '.'."""
    if total <= 0:
        return "[" + "?" * width + "]"
    filled = int(round(used * width / total))
    filled = max(0, min(width, filled))
    return "[" + "#" * filled + "." * (width - filled) + "]"


def color_for_headroom_pct(pct):
    """Zelena > 25%, zlta 10-25%, cervena < 10%."""
    if pct >= 25.0:
        return C.GREEN, "[OK] BEZPECNE"
    if pct >= 10.0:
        return C.YELLOW, "[POZOR] TESNE"
    return C.RED, "[KRITICKE] OVERFLOW RISK"


def print_conclusion(static_ram, worst_case):
    print(f"\n{C.BOLD}{C.CYAN}{'=' * 60}{C.RESET}")
    print(f"{C.BOLD}                    ZAVER - RAM ROZPOCET{C.RESET}")
    print(f"{C.BOLD}{C.CYAN}{'=' * 60}{C.RESET}")

    if static_ram is None:
        print(f"{C.YELLOW}avr-size nedostupne, neviem vypocitat realny budget.{C.RESET}")
        return

    stack_budget = TOTAL_RAM - static_ram
    headroom     = stack_budget - worst_case
    static_pct   = static_ram / TOTAL_RAM * 100
    stack_used_pct_of_total = worst_case / TOTAL_RAM * 100
    peak_total   = static_ram + worst_case
    peak_pct     = peak_total / TOTAL_RAM * 100
    headroom_pct = headroom / stack_budget * 100 if stack_budget > 0 else 0

    col, status = color_for_headroom_pct(headroom_pct)

    print(f"Celkova RAM (ATmega328P):\t\t{TOTAL_RAM:5d} B")
    print(f"Staticka pamat (data+bss+noinit): "
          f"\t\t{static_ram:4d} B ({static_pct:5.1f} %)")
    print(f"  -> dostupne pre stack:\t\t{stack_budget:5d} B "
          f"({100-static_pct:5.1f} %)")
    print()
    print(f"Odhadovany peak stack:       {worst_case:5d} B "
          f"({stack_used_pct_of_total:5.1f} % z celku, "
          f"{worst_case/stack_budget*100:5.1f} % z budgetu)")
    print(f"{col}Volna rezerva pri peaku:     {headroom:5d} B "
          f"({headroom_pct:5.1f} % budgetu){C.RESET}")
    print()

    # Vizualny bar — kde sa nachadza SP pri peaku.
    print(f"RAM mapa (lave okraje su nizke adresy, prave su vyssie):")
    print(f"  {C.YELLOW}staticka{C.RESET}  {col}stack pri peaku{C.RESET}  {C.DIM}rezerva{C.RESET}")
    seg_static = int(round(static_ram / TOTAL_RAM * 50))
    seg_stack  = int(round(worst_case / TOTAL_RAM * 50))
    seg_free   = 50 - seg_static - seg_stack
    seg_free   = max(0, seg_free)
    print("  " + C.DIM + "#" * seg_static + C.RESET
          + col + "#" * seg_stack + C.RESET
          + C.DIM + "." * seg_free + C.RESET
          + f"  ({peak_pct:.1f} % celkovo pouzite)")
    print()

    print(f"  Stack budget: {bar(worst_case, stack_budget)} "
          f"{col}{worst_case}/{stack_budget} B{C.RESET}")
    print()
    print(f"  Status: {col}{C.BOLD}{status}{C.RESET}")
    if headroom_pct < 25:
        print(f"  {C.DIM}(prah RAM_SAFETY_THRESHOLD je 64 B; teraz rezerva = {headroom} B){C.RESET}")
    print(f"{C.BOLD}{C.CYAN}{'=' * 60}{C.RESET}")


def enable_ansi_on_windows():
    """Enabluje ANSI escape sekvencie na Windows 10+ konzole."""
    if sys.platform != "win32":
        return
    try:
        import ctypes
        kernel32 = ctypes.windll.kernel32
        ENABLE_VT = 0x0004
        h = kernel32.GetStdHandle(-11)  # STD_OUTPUT_HANDLE
        mode = ctypes.c_uint32()
        if kernel32.GetConsoleMode(h, ctypes.byref(mode)):
            kernel32.SetConsoleMode(h, mode.value | ENABLE_VT)
    except Exception:
        pass


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--no-build", action="store_true",
                    help="Preskoc kompilaciu, pouzij existujuce artefakty")
    ap.add_argument("--top", type=int, default=20,
                    help="Pocet najvacsich frame-ov v rebricku (default 20)")
    ap.add_argument("--no-color", action="store_true",
                    help="Vypni ANSI farby (pre stary terminal alebo log subor)")
    ap.add_argument("--entry", action="append", default=[],
                    help="Pridaj entry-point pre analyzu (moze byt opakovany). "
                         "Default: setup(), main + vsetky __vector_N.")
    ap.add_argument("--show-missing", type=int, default=15,
                    help="Pocet nesparovanych callee mien v diagnostike (default 15)")
    args = ap.parse_args()

    if args.no_color:
        for k in list(vars(C)):
            if not k.startswith("_") and isinstance(getattr(C, k), str):
                setattr(C, k, "")
    else:
        enable_ansi_on_windows()

    if not args.no_build:
        run_build()
    else:
        print("[1/4] Preskakujem kompilaciu (--no-build)")

    print("[2/4] Parsujem .su subory...")
    frames, dynamic_funcs = parse_su_files()
    print(f"      {len(frames)} unikatnych funkcii"
          + (f", {len(dynamic_funcs)} s dynamic frame" if dynamic_funcs else ""))

    elf = BUILD_DIR / "firmware.elf"
    if not elf.exists():
        print(f"CHYBA: {elf} nenajdene - spusti bez --no-build", file=sys.stderr)
        sys.exit(1)

    print("[3/4] Generujem call-graph z firmware.elf...")
    calls, indirect_sites, all_funcs = parse_call_graph(elf)
    n_edges = sum(len(v) for v in calls.values())
    n_indirect = sum(indirect_sites.values())
    print(f"      {n_edges} direct + tail-call edges; "
          f"{n_indirect} indirect call/jmp sites (icall/eicall/ijmp)")

    print("[4/4] DFS pre najhlbsie retazce...")
    print(f"\n=== TOP {args.top} najvacsich frame-ov ===")
    for name, fb in sorted(frames.items(), key=lambda x: -x[1])[:args.top]:
        print(f"  {fb:4d}  {name}")

    missing = set()

    # ISR vektory: najdi vsetky __vector_N a zober najhlbsi.
    vectors = list_isr_vectors(all_funcs)
    isr_max = 0
    isr_max_name = None
    print(f"\n=== ISR vektory najdene v binarce ({len(vectors)}) ===")
    for v in vectors:
        total, _, ub = deepest_chain(v, frames, calls, missing)
        if ub is not None:
            print(f"  {C.RED}UNBOUND{C.RESET}  {v}  ({' -> '.join(ub)})")
            continue
        # ISR overhead: 2B HW push + (edges-1)*2 return adries.
        # (Edges su uz v ramci ISR retazca, plus 2B HW push pre samotny vstup.)
        # Aby sme nepovedali nieco navyse: pouzijeme tu len frame sum a
        # plnu sumu (s overhead) vypiseme cez print_chain pre worst.
        print(f"  {total:4d}B (frames)  {v}")
        if total > isr_max:
            isr_max = total
            isr_max_name = v
    if not vectors:
        print("  (ziadne)")

    isr_total = 0
    if isr_max_name:
        isr_total = print_chain(f"NAJHLBSI ISR: {isr_max_name}",
                                isr_max_name, frames, calls,
                                hw_push=2, missing_set=missing)

    # Non-ISR vstupy: setup() + main + uzivatelske --entry.
    entries = ["setup()", "main"] + list(args.entry)
    non_isr_max = 0
    for ep in entries:
        if frame_lookup(ep, frames) is None and ep not in all_funcs:
            print(f"\n{C.DIM}(entry-point '{ep}' neexistuje v binarce, preskakujem){C.RESET}")
            continue
        total = print_chain(f"entry: {ep}", ep, frames, calls,
                            missing_set=missing)
        if total is not None and total > non_isr_max:
            non_isr_max = total

    print(f"\n=== CELKOVA HORNA HRANICA ===")
    overall = non_isr_max + (isr_total or 0)
    print(f"max(non-ISR) + worst ISR = {non_isr_max} + {isr_total or 0} = {overall} B")

    # === DIAGNOSTIKA: co sa nepodarilo sparovat / co je staticky neziste ===
    print(f"\n=== DIAGNOSTIKA ===")
    callees = set()
    for v in calls.values():
        callees.update(v)
    # Symboly volane a NACHADZAJUCE sa v binarce, ale bez zaznamu v .su,
    # signalizuju zlyhanie sparovania mien (a teda neviditelnu cast retazca).
    # Inline-only / extern symboly (nie su v all_funcs) ignorujeme — nemaju .su.
    truly_unmatched = sorted(c for c in callees
                             if c in all_funcs
                             and frame_lookup(c, frames) is None)
    print(f"  Direct edges:               {n_edges}")
    print(f"  Indirect call/jmp sites:    {n_indirect}", end="")
    if n_indirect:
        print(f"  {C.YELLOW}<- staticky NEVIDITELNE, zoznam:{C.RESET}")
        for caller, cnt in indirect_sites.items():
            print(f"     {cnt}x v {caller}")
    else:
        print()
    print(f"  Funkcie volane bez .su zaznamu (treated 0 B): "
          f"{len(truly_unmatched)}")
    for c in truly_unmatched[:args.show_missing]:
        print(f"     ? {c}")
    if len(truly_unmatched) > args.show_missing:
        print(f"     ... +{len(truly_unmatched) - args.show_missing} dalsich")
    if dynamic_funcs:
        print(f"  {C.YELLOW}Funkcie s dynamickym frame (alloca/VLA): "
              f"{len(dynamic_funcs)}{C.RESET}")
        for f in sorted(dynamic_funcs)[:5]:
            print(f"     ! {f}")

    static_ram = get_static_ram(elf)
    print_conclusion(static_ram, overall)

    # Final warning ak su nejake neresena nezistenia
    warnings = []
    if n_indirect:
        warnings.append(f"{n_indirect} indirect call site(s) - target unknown")
    if truly_unmatched:
        warnings.append(f"{len(truly_unmatched)} called function(s) without .su frame")
    if dynamic_funcs:
        warnings.append(f"{len(dynamic_funcs)} function(s) with dynamic stack")
    if warnings:
        print(f"\n{C.YELLOW}{C.BOLD}UPOZORNENIE - presnost analyzy:{C.RESET}")
        for w in warnings:
            print(f"  - {w}")
        print(f"{C.DIM}  -> realna horna hranica moze byt vyssia ako uvedena.{C.RESET}")


if __name__ == "__main__":
    main()
