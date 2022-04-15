import os
import sys
import time
import watchdog.events
import watchdog.observers
from update_docs import to_docx, to_ps1, to_pdf


class Handler(watchdog.events.PatternMatchingEventHandler):
    def __init__(self):
        # Set the patterns for PatternMatchingEventHandler
        watchdog.events.PatternMatchingEventHandler.__init__(self, patterns=['*.md'],
                                                             ignore_directories=True, case_sensitive=False)

    def on_created(self, event):
        print("#" * 255)
        print(f"{event.src_path} is created.")
        # Event is created, you can process it now
        print("#" * 255)

    def on_modified(self, event):
        print("#" * 255)
        print(f"{event.src_path} is modified.")
        # Event is modified, you can process it now
        docx_file = event.src_path.replace(".md", ".docx")
        pdf_file = event.src_path.replace(".md", ".pdf")
        print(f"{docx_file} is modified.")
        to_pdf(event.src_path, pdf_file)
        print(f"{pdf_file} is modified.")
        print("#" * 255)

    def on_deleted(self, event):
        print("#" * 255)
        print(f"{event.src_path} is deleted.")
        docx_file = event.src_path.replace(".md", ".docx")
        pdf_file = event.src_path.replace(".md", ".pdf")
        os.remove(docx_file)
        print(f"{docx_file} is deleted.")
        os.remove(pdf_file)
        print(f"{pdf_file} is deleted.")
        print("#" * 255)


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
