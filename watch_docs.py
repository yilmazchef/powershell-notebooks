import os
import sys
import time
import watchdog.events
import watchdog.observers
from update_docs import to_docx, to_ps1, to_pdf


class Handler(watchdog.events.PatternMatchingEventHandler):
    def __init__(self):
        # Set the patterns for PatternMatchingEventHandler
        watchdog.events.PatternMatchingEventHandler.__init__(self, patterns=['*.ipynb'],
                                                             ignore_directories=True, case_sensitive=False)

    def on_created(self, event):
        print(f"{event.src_path} is created.")
        # Event is created, you can process it now

    def on_modified(self, event):
        # Event is modified, you can process it now
        docx_file = event.src_path.replace(".md", ".docx")
        pdf_file = event.src_path.replace(".md", ".pdf")
        to_docx(event.src_path, docx_file)
        to_pdf(event.src_path, pdf_file)

    def on_deleted(self, event):
        docx_file = event.src_path.replace(".md", ".docx")
        pdf_file = event.src_path.replace(".md", ".pdf")
        os.remove(docx_file)
        os.remove(pdf_file)


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
