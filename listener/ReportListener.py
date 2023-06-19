class ReportListener:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, filename='report.md'):
        self.filename = filename
        self.fh = open(self.filename, 'w')
        self.fh.write("# Robot Framework Report\n")
        self.fh.write("|Suite|Test|Status|\n")
        self.fh.write("|---|---|---|\n")

    def close(self):
        self.fh.close()

    def end_test(self, data, result):
        self.fh.write(f"|{result.parent}|{result.name}|{result.status}|\n")