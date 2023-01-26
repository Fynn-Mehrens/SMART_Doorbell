from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

import datetime
from entities.doorbell_ring import DoorbellRing

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

doorbell_ring = smart_doorbell_client.inherit('DoorbellRing', {
    'time': fields.DateTime(required=True, attribute='_timestamp', description='The timestamp when the door '
                                                                                       'has been rung'),
})


doorbell_rings = {
    1: [],
    2: [],
    3: [],
}


@smart_doorbell_client.route("/doorbell_ring/<int:slot>")
class DoorbellRings(Resource):
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
        print(vars(doorbell_rings[slot][0]))
        return doorbell_rings[slot]


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")
