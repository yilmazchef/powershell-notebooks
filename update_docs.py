#!/usr/bin/env python


import os
import sys
import json
import time
import uuid
from folder_structure import notebook_file_paths


def to_ps1(md_file):
    pass


def to_docx(md_file, docx_file):
    print(f"\"{md_file}\" to \"{docx_file}\" conversion started...")
    cmdlet = f"pandoc \"{md_file}\" -f markdown -o \"{docx_file}\""
    print(cmdlet)
    os.system(cmdlet)
    print(f"\"{md_file}\" to \"{docx_file}\" conversion complete...")


def to_odt(md_file, odt_file):
    print(f"{md_file} to \"{odt_file}\" conversion started...")
    cmdlet = f"pandoc -t odt \"{md_file}\" -o \"{odt_file}\""
    print(cmdlet)
    os.system(cmdlet)
    print(f"\"{md_file}\" to \"{odt_file}\" conversion complete...")


def to_json(md_file, json_file):
    pass


def to_pdf(md_file, pdf_file):
    print(f"{md_file} to \"{pdf_file}\" conversion started...")
    cmdlet = f"pandoc \"{md_file}\" --pdf-engine=pdflatex -o \"{md_file}\""
    print(cmdlet)
    os.system(cmdlet)
    print(f"\"{md_file}\" to \"{pdf_file}\" conversion complete...")


if __name__ == "__main__":

    src_path = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    md_file_list = notebook_file_paths(src_path, ".md")

    for md_file in md_file_list:
        docx_file = md_file.replace(".md", ".docx")
        pdf_file = md_file.replace(".md", ".pdf")

        print("#" * 255)

        to_docx(md_file, docx_file)
        to_pdf(md_file, pdf_file)

        print("#" * 255)

    print("#" * 255)
    print("#" * 80, end="")
    print("THE CONVERSION IS COMPLETED..", end="")
    print("#" * 80, end="\n")
