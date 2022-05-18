import os
from uuid import uuid4
import json
from urllib.parse import quote


def hierarchy_json(path):
    base = os.path.basename(path)
    d = {
        'id': str(uuid4()),
        'name': base
    }
    if os.path.isdir(path):
        d['type'] = "directory"
        d['child'] = [hierarchy_json(os.path.join(path, x))
                      for x in os.listdir(path)]
    else:
        pdf = f'https://raw.githubusercontent.com/yilmazchef/powershell-notebooks/main/Notebooks/English/{quote(base)}'
        md = f'https://raw.githubusercontent.com/yilmazchef/powershell-notebooks/main/Notebooks/English/{quote(base.replace(".md", ".pdf"))}'

        d['type'] = "file"
        d['link'] = md,
        d['download'] = pdf

    return d


def filter_files(folder_path: str, file_type: str) -> list:
    paths = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.lower().endswith(file_type.lower()):
                paths.append(os.path.join(root, file))

    return paths


if __name__ == "__main__":

    cwd = os.getcwd()

    os.chdir("./")

    note_dir = os.path.join(cwd, "Notebooks")
    json_formatted_str = json.dumps(hierarchy_json(note_dir), indent=4)

    print(
        json_formatted_str
    )
