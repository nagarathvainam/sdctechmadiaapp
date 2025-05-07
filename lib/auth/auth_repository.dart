import 'dart:convert';
import 'package:http/http.dart' as http;
class AuthRepository {
  final String baseUrl = 'https://sdctech.in/Admin/fAmdm'; // Change for emulator/device
  Future<Map<String, dynamic>> login(String email, String password) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=o39eovqd1670u8v94uqprrefg5'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl/login_api.php'));
    request.body = json.encode({
      "username": "$email",
      "password": "$password"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return json.decode(await response.stream.bytesToString());
    } else {
      throw Exception('Failed to login');
    }
  }
}
