import requests

class CarpoolService:
    def __init__(self):
        self.geocoding_api_key = 'AIzaSyCiK_BbIXq8mIXdqaAPxf4WG9LwM2_CYkk'
        self.distance_matrix_api_key = 'AIzaSyD3ltf6E3Amq_jB1g4Hn1asaQfSwvAlcSY'

    def geocode_address(self, address):
        url = f'https://maps.googleapis.com/maps/api/geocode/json?address={address}&key={self.geocoding_api_key}'
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            if data['status'] == 'OK':
                location = data['results'][0]['geometry']['location']
                return location['lat'], location['lng']
            else:
                print("Geocoding API returned status:", data['status'])
        else:
            print("Error calling Geocoding API. Status code:", response.status_code)
        return None, None

    def calculate_distance(self, origin_address, destination_address):
        origin_coords = self.geocode_address(origin_address)
        destination_coords = self.geocode_address(destination_address)
        if origin_coords and destination_coords:
            url = f'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins={origin_coords[0]},{origin_coords[1]}&destinations={destination_coords[0]},{destination_coords[1]}&key={self.distance_matrix_api_key}'
            response = requests.get(url)
            if response.status_code == 200:
                data = response.json()
                if data['status'] == 'OK':
                    element = data['rows'][0]['elements'][0]
                    distance = element['distance']['value'] / 1000  # Distance in kilometers
                    return distance
                else:
                    print("Distance Matrix API returned status:", data['status'])
            else:
                print("Error calling Distance Matrix API. Status code:", response.status_code)
        return None
