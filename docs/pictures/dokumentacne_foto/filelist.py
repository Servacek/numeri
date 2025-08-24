# Python script to generate JSON list of jpg and mp4 files in a folder

import os
import json

# Folder path containing images and videos
folder_path = 'docs/pictures/dokumentacne_foto/'

# Supported file extensions
extensions = ('.jpg', '.jpeg', '.png', '.mp4')

# List all files in the folder with the correct extensions
files = [f for f in os.listdir(folder_path) if f.lower().endswith(extensions)]

# Sort files alphabetically (optional)
files.sort()

# Output JSON file path
output_file = os.path.join(folder_path, 'filelist.json')

# Write JSON file
with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(files, f, indent=2)

print(f"Generated {output_file} with {len(files)} files.")
