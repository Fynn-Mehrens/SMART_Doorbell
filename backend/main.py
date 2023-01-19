from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

import datetime

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

doorbell_ring = smart_doorbell_client.inherit('DoorbellRing', {
    'notification': fields.String(required=True, attribute='_notification', description='The pop-up notification that '
                                                                                        'the user wants to be displayed '
                                                                                        'when the associated doorbell '
                                                                                        'is rung'),
    'sound_file': fields.String(required=True, attribute='_sound_file', description='Name of the desired pop-up sound '
                                                                                    'file'),
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
        doorbell_rings[slot].append(DoorbellRing(datetime.datetime.now()))

        # TODO
        # Step 1: Unpacking data on what to do (sound file, notification message)
        return doorbell_ring, 200, {'Access-Control-Allow-Origin': '*'}


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")
