import re


MIN_SILK_SCREEN_WIDTH = 0.254
MIN_SILK_SCREEN_TEXT_WIDTH = 0.5

with open('numeri-iv9-hodiny-atmega328.kicad_pcb', 'r', encoding="utf-8") as f:
    pcbfile = f.read()


"""
			(stroke
				(width 0.12)
				(type solid)
			)
			(layer "F.SilkS")


        (fp_text user "K"
			(at 0 -1.8 0)
			(layer "F.SilkS")
			(uuid "8599885c-235e-473e-8d03-618892c1ca7c")
			(effects
				(font
					(size 1 1)
					(thickness 0.15)
				)
			)
		)

"""

for match in re.finditer(r'\(stroke\n\s+\(width ([0-9.]+)\)\n\s+\(type solid\)', pcbfile):
    silk_screen_width = float(match.group(1))
    if silk_screen_width < MIN_SILK_SCREEN_WIDTH:
        print(f"Silk screen width {silk_screen_width} is below the minimum of {MIN_SILK_SCREEN_WIDTH}.")
        pcbfile = pcbfile.replace(match.group(0), f'(stroke\n\t\t\t\t(width {MIN_SILK_SCREEN_WIDTH})\n\t\t\t\t(type solid)')

for match in re.finditer(r'\(gr_text "[^"]+"\n\s+\(at ([0-9. -]+)\)\n\s+\(layer "F\.SilkS"\)\n\s+\(uuid ("[^"]+")\)\n\s+\(effects\n\s+\(font\n\s+\(size ([0-9. ]+)\)\n\s+\(thickness ([0-9.]+)\)\n\s+\)\n\s+\)', pcbfile):
    silk_screen_thickness = float(match.group(5))
    print(silk_screen_thickness)
    if silk_screen_thickness < MIN_SILK_SCREEN_TEXT_WIDTH:
        print(f"Silk screen thickness {silk_screen_thickness} is below the minimum of {MIN_SILK_SCREEN_TEXT_WIDTH}.")
        pcbfile = pcbfile.replace(match.group(0), f'(fp_text user {match.group(1)}\n\t\t\t(at {match.group(2)})\n\t\t\t(layer "F.SilkS")\n\t\t\t(uuid {match.group(3)})\n\t\t\teffects\n\t\t\t(font\n\t\t\t(size {match.group(4)})\n\t\t\t(thickness {MIN_SILK_SCREEN_TEXT_WIDTH})\n\t\t\t))')

with open('test.kicad_pcb', 'w', encoding="utf-8") as f:
    f.write(pcbfile)
