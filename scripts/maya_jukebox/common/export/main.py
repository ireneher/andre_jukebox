class Exporter(object):
    def __init__(self, exports, frame_range=None, fields=None):
        """
        Args:
            exports (list): List of the exports of objects you want to export
            frame_range=None (int): Frame to begin exporting from.
            end_frame (int): Frame to end exporting on.
            fields (dict): Optional dict of fields to store for exporters
        """
        self.exports = exports
        self.frame_range = frame_range
        self.fields = fields or {}

    def __repr__(self):
        return "{}({}, {}, {}, {})".format(
            self.__class__.__name__, self.exports, self.frame_range, self.fields,
        )

    def export(self, engine, filepath, exports=None, frame_range=None):
        # TODO: Have to sort these imports
        print self.exports
        engine.run_export(
            filepath,
            exports=exports or self.exports,
            frame_range=frame_range or self.frame_range,
        )
