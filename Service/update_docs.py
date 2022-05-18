#!/usr/bin/env python


from progressbar import AnimatedMarker, Bar, BouncingBar, Counter, ETA, \
    AdaptiveETA, FileTransferSpeed, FormatLabel, Percentage, \
    ProgressBar, ReverseBar, RotatingMarker, \
    SimpleProgress, Timer, UnknownLength
import os
import sys
from pandoc_mapper import f4docx, h4docx, md2pptx
from folder_manager import filter_files
from pandoc_mapper import md2docx, md2odt, md2pdf, md2ipynb, img2base64


if __name__ == "__main__":

    src_path = input(
        "Source folder: "
    )

    if src_path == "":
        src = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()

    source_file_list = filter_files(src_path, ".md")

    pBarMax = len(source_file_list)
    widgets = [Percentage(),
               ' ', Bar(),
               ' ', ETA(),
               ' ', AdaptiveETA()]
    pBar = ProgressBar(widgets=widgets, maxval=pBarMax)

    pBar.start()
    pBarCount = 0
    for source_file in source_file_list:

        docx_file = md2docx(source_file)

        header_image = os.getcwd() + os.path.sep + "Service" + \
            os.path.sep + "header.png"
        header_text = open(os.getcwd() + os.path.sep +
                           "Service" + os.path.sep + "header.txt", "r")
        h4docx(docx_file, header_image, header_text)

        footer_image = os.getcwd() + os.path.sep + "Service" + \
            os.path.sep + "footer.png"
        footer_text = open(os.getcwd() + os.path.sep +
                           "Service" + os.path.sep + "footer.txt", "r")
        f4docx(docx_file, footer_image, footer_text)

        pptx_file = md2pptx(source_file)
        
        pdf_file = md2pdf(source_file)

        pBarCount += 1
        pBar.update(pBarCount)

    pBar.finish()

