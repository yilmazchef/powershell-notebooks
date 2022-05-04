import imp
import os
import runpy
import sys
import time
import pip
import watchdog.events
import watchdog.observers
from docx_manager import to_docx
from pptx_manager import to_pptx
from odt_manager import to_odt
from markdown_manager import to_ipynb, to_md


class Handler(watchdog.events.PatternMatchingEventHandler):
    def __init__(self):
        # Set the patterns for PatternMatchingEventHandler
        watchdog.events.PatternMatchingEventHandler.__init__(self, patterns=['*.md'],
                                                             ignore_directories=True, case_sensitive=False)
        print(sys.getdefaultencoding())

    def on_created(self, event):
        print(f"{event.src_path} is created.")
        # Event is created, you can process it now

    def on_modified(self, event):
        to_docx(event.src_path)

    def on_deleted(self, event):
        os.remove(event.src_path.replace(".md", "docx"))


if __name__ == "__main__":

    src_path = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    event_handler = Handler()
    observer = watchdog.observers.Observer()
    observer.schedule(event_handler, path=src_path, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
