import collections.abc
from email import charset
from pptx import Presentation
from pptx.util import Cm, Inches, Pt
import json
import os
import sys
import pptx
import pprint


c = collections
c.abc = collections.abc


def to_pptx(md_file: str) -> str:

    pptx_path = md_file.replace(".md", ".pptx")
    # pptx_template = os.getcwd() + os.path.sep + "Service" + os.path.sep + "template.pptx"
    cmdlet = f"pandoc -V fontsize=12pt \"{md_file}\" -s --wrap auto -o \"{pptx_path}\""
    os.system(cmdlet)

    return pptx_path
