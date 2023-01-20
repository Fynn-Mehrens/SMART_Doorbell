from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

import datetime

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

doorbell_ring = smart_doorbell_client.inherit('DoorbellRing', {
    'notification': fields.DateTime(required=True, attribute='_timestamp', description='The timestamp when the door '
                                                                                       'has been rung'),
})


doorbell_rings = {
    1: [],
    2: [],
    3: [],
}

@smart_doorbell_client.route("/doorbell_ring/<int:slot>")
class DoorbellRing(Resource):
    """
    This endpoint is contacted by the ESP that is hosting the doorbell service.
    The slot gives information on which slot of the doorbell has been presssed.

    """

    @smart_doorbell_client.marshal_with(doorbell_ring)
    def get(self, slot):
        ring = DoorbellRing(datetime.datetime.now())
        doorbell_rings[slot].append(ring)

        # TODO
        # Step 1: Unpacking data on what to do (sound file, notification message)
        return ring, 200, {'Access-Control-Allow-Origin': '*'}


@smart_doorbell_client.route("/doorbell_notification/<int:slot>")
class DoorNotifications(Resource):
    """

    """

    @smart_doorbell_client.marshal_with(doorbell_ring)
    def get(self, slot):
        return doorbell_rings[slot]


doorbell_button = smart_doorbell_client.inherit('DoorbellButton', {
    # 'country_name': fields.String(required=True, attribute='_country_name', description='The name of a country'),
    # 'is_online_market': fields.Boolean(required=True, attribute='_is_online_market', description='Is it an online market'),
    # 'country_code': fields.Integer(required=True, attribute='_country_code', description='The code of the country'),
})


class DoorbellButton(Resource):

    @smart_doorbell_client.marshal_with(doorbell_button)
    @smart_doorbell_client.expect(doorbell_button)
    def post(self):
        # Defining data to send as subscription (sound file, notification message, doorbell button - as index)
        print("post of DoorbellRing has been called")
        return doorbell_button, 200, {'Access-Control-Allow-Origin': '*'}

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

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")
