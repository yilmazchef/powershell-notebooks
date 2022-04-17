import math
import os
import sys
import json
import time
from uuid import uuid4
from folder_structure import path_to_dict

if __name__ == "__main__":

    cwd = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()

    start = time.time()    # for testing purposes
    english = cwd + os.path.sep + "Notebooks" + os.path.sep + "English"
    dutch = cwd + os.path.sep + "Notebooks" + os.path.sep + "Nederlands"

    englishTree = path_to_dict(english)
    dutchTree = path_to_dict(dutch)
    pythonTutorials = [englishTree, dutchTree]
    jsonString = json.dumps(
        pythonTutorials, default=lambda o: o.__dict__, sort_keys=False, indent=4)

    jsonFile = open("data.json", "w")
    jsonFile.write(jsonString)
    jsonFile.close()
    end = time.time()

    print("Conversion took " + str(round(end - start, 2)) + " milliseconds.")
