from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

from esp.entities.notification import Notification

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

schedule = smart_doorbell_client.inherit('schedule', {
    'start_time', fields.DateTime(),
    'end_time', fields.DateTime(),
})

notification = smart_doorbell_client.inherit('Notification', {
    'message': fields.String(),
    'sound_path': fields.String(),
    'schedule': fields.Nested(schedule),
    'forwarding_destination': fields.String(),
    'forwarding_schedule': fields.Nested(schedule),
})

notification_settings: {str, notification} = {}

@smart_doorbell_client.route("/notification_settings/<string:user_id>")
class NotificationSettings(Resource):

    @smart_doorbell_client.marshal_with(notification)
    def get(self, user_id):
        if user_id in notification_settings.keys():
            return notification_settings[user_id]
        return None

    @smart_doorbell_client.marshal_with(notification)
    @smart_doorbell_client.expect(notification)
    def post(self, user_id, notification: Notification):
        if user_id in notification_settings.keys():
            notification_settings[user_id] = notification
            return notification
        return None


@smart_doorbell_client.route("/slot_settings/<string:user_ip>")
class SlotSettings(Resource):

    def get(self):
        # TODO
        pass

    def post(self):
        # TODO
        pass