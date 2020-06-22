class Publisher(object):
    def __init__(self, exports, start_frame, end_frame, fields=None):
        """
        Args:
            exports (list): List of the exports of objects you want to export
            start_frame (int): Frame to begin exporting from.
            end_frame (int): Frame to end exporting on.
            fields (dict): Optional dict of fields to store for publishers
        """
        self.exports = exports
        self.start_frame = start_frame
        self.end_frame = end_frame
        self.fields = fields or {}

    def __repr__(self):
        return "{}({}, {}, {}, {})".format(
            self.__class__.__name__,
            self.exports,
            self.start_frame,
            self.end_frame,
            self.fields,
        )

    def publish(self, driver, destination):
        driver.run_export(self.exports, destination, self.start_frame, self.end_frame)
