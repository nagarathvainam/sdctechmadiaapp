import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/admin_user.dart';

class AdminUserApi {
  final http.Client client = http.Client();

  Future<List<AdminUser>> fetchAllUsers() async {
    // Replace with actual API URL
    final response = await client.get(Uri.parse('https://sdctech.in/Admin/fAmdm/admin_user_api.php'));

    if (response.statusCode == 200) {

      final List data = jsonDecode(response.body);

      return data.map((json) => AdminUser.fromJson(json)).toList();
    } else {

      throw Exception('Failed to load users');
    }
  }

  Future<void> deleteUser(String id) async {
    await client.delete(Uri.parse('http://your-api/admin_users/\$id'));
  }

  Future<void> updateUser(AdminUser user) async {
    await client.put(
      Uri.parse('http://your-api/admin_users/\${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }

  Future<void> createUser(AdminUser user) async {
    await client.post(
      Uri.parse('http://your-api/admin_users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }
}