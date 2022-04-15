import os
import sys
import json
import logging
import time
from uuid import uuid4
from folder_structure import path_to_dict, dict_to_json, notebook_file_paths

logging.basicConfig(filename='logs.json', filemode='a+', level=logging.DEBUG)

if __name__ == "__main__":

    cwd = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()

    start = time.time()    # for testing purposes
    cwd = os.getcwd() + os.path.sep + "Notebooks" + os.path.sep + "English"

    tree = path_to_dict(cwd)

    dict_to_json(tree, os.getcwd() + os.path.sep + "data.json")

    end = time.time()
    print(end - start)
