import 'dart:convert';

import '../users/models/admin_user.dart';
import 'package:http/http.dart' as http;
class AdminUserApi {
  final http.Client client;

  AdminUserApi(this.client);



  Future<void> deleteUser(int id) async {
    final response = await client.delete(Uri.parse('http://your-api/admin_users/$id'));
    if (response.statusCode != 200) throw Exception('Delete failed');
  }

  Future<void> updateUser(AdminUser user) async {
    await client.put(
      Uri.parse('http://your-api/admin_users/${user.id}'),
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
