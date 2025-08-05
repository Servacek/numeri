#!/usr/bin/env python3
"""
rescue.py: A script to remove all nets named "RESCUE" from a KiCad PCB file.

Usage:
    python rescue.py input.kicad_pcb -o output.kicad_pcb
"""
import re

# Regex patterns to remove 'RESCUE' net definitions and attributes
LAYER_PATTERN = re.compile(r"\(layer\s+\"RESCUE\"\)\s*\n?", flags=re.IGNORECASE)


def remove_rescue_nets(text):
    text, defs = NET_DEF_PATTERN.subn('', text)
    text, attrs = NET_ATTR_PATTERN.subn('', text)
    return text, defs, attrs


def main():
    with open("test.kicad_pcb", 'r', encoding='utf-8') as f:
        data = f.read()

    cleaned, defs, attrs = remove_rescue_nets(data)

    with open("test.kicad_pcb", 'w', encoding='utf-8') as f:
        f.write(cleaned)

    print(f"Removed 'RESCUE' net declarations: {defs}")
    print(f"Removed 'RESCUE' net attributes: {attrs}")

if __name__ == '__main__':
    main()
