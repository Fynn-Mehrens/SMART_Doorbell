from flask import Flask
from flask_cors import CORS
from flask_restx import Api, Resource, fields

app = Flask(__name__)
smart_doorbell_client = Api(app)
cors = CORS(app, resources={r"/smart_doorbell_client/*": {"origins": "*"}})

doorbell_ring = smart_doorbell_client.inherit('DoorbellRing', {
    # 'country_name': fields.String(required=True, attribute='_country_name', description='The name of a country'),
    # 'is_online_market': fields.Boolean(required=True, attribute='_is_online_market', description='Is it an online market'),
    # 'country_code': fields.Integer(required=True, attribute='_country_code', description='The code of the country'),
})

@smart_doorbell_client.route("/doorbell_ring")
class DoorbellRing(Resource):

    @smart_doorbell_client.marshal_with(doorbell_ring)
    @smart_doorbell_client.expect(doorbell_ring)
    def post(self):
        print("post of DoorbellRing has been called")
        # TODO
        # Step 1: Unpacking data on what to do (sound file, notification message)
        return doorbell_ring, 200, {'Access-Control-Allow-Origin': '*'}

subscription = smart_doorbell_client.inherit('Subscription', {
    # 'country_name': fields.String(required=True, attribute='_country_name', description='The name of a country'),
    # 'is_online_market': fields.Boolean(required=True, attribute='_is_online_market', description='Is it an online market'),
    # 'country_code': fields.Integer(required=True, attribute='_country_code', description='The code of the country'),
})

class Subscription(Resource):

    @smart_doorbell_client.marshal_with(subscription)
    @smart_doorbell_client.expect(subscription)
    def post(self):
        # Defining data to send as subscription (sound file, notification message, doorbell button - as index)
        print("post of DoorbellRing has been called")
        return subscription, 200, {'Access-Control-Allow-Origin': '*'}

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
