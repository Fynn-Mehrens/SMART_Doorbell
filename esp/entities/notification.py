class Notification:

    def __init__(self, message, sound_path, schedule, forwarding_destination, forwarding_schedule):
        self._message = message
        self._sound_path = sound_path
        self._schedule = schedule
        self._forwarding_destination = forwarding_destination
        self._forwarding_schedule = forwarding_schedule
