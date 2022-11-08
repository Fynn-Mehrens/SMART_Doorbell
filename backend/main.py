from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

@smart_doorbell_client.route("/doorbell_ring")
class DoorbellRing(Resource):

    @smart_doorbell_client.marshal_with(doorbell_ring)
    @smart_doorbell_client.expect(doorbell_ring)
    def post(self):
        print("post of DoorbellRing has been called")
        # TODO
        # Step 1: Unpacking data on what to do (sound file, notification message
        return doorbell_ring, 200, {'Access-Control-Allow-Origin': '*'}

class Subscription(Resource):

    @smart_doorbell_client.marshal_with(subscription)
    @smart_doorbell_client.expect(subscription)
    def post(self):
        print("post of DoorbellRing has been called")
        return subscription, 200, {'Access-Control-Allow-Origin': '*'}