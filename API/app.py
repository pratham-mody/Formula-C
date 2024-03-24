from flask import Flask,request,jsonify
from carpool_service import CarpoolService
app=Flask(__name__)
carpool_service = CarpoolService()
@app.route('/api',methods=['GET'])
def returnascii():
    d={}
    inputchr=str(request.args['query'])
    answer=str(ord(inputchr))
    d['output']=answer
    return d
@app.route('/geocode', methods=['POST'])
def geocode():
    data = request.json
    address = data.get('address')
    lat, lng = carpool_service.geocode_address(address)
    if lat is not None and lng is not None:
        return jsonify({'lat': lat, 'lng': lng}), 200
    else:
        return jsonify({'error': 'Unable to geocode address'}), 400

    @app.route('/calculate_distance', methods=['POST'])
    def calculate_distance():
        data = request.json
        origin_address = data.get('origin_address')
        destination_address = data.get('destination_address')
        distance = carpool_service.calculate_distance(origin_address, destination_address)
        if distance is not None:
            return jsonify({'distance': distance}), 200
        else:
            return jsonify({'error': 'Unable to calculate distance'}), 400

if __name__ == '__main__':
    app.run(debug=True)