// Import necessary packages
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Function to call the geocode API endpoint
  Future<Map<String, dynamic>?> geocodeAddress(String address) async {
    final url = Uri.parse(
        'http://10.0.2.2:5000/geocode'); // Adjust with your actual API URL if needed
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'address': address}),
    );

    if (response.statusCode == 200) {
      // Successfully received response from the API
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      // Handle error or show message
      print(
          'Failed to geocode address with status code: ${response.statusCode}');
      return null;
    }
  }
}
