import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tafeel/data/user.dart';

class ApiDataSource {
  Future<Map<String, dynamic>> getUsers(int page) async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'users': (data['data'] as List)
              .map((json) => User.fromJson(json))
              .toList(),
          'totalPages': data['total_pages'],
        };
      }
      throw Exception(
          'Failed to load users: ${response.statusCode} https://reqres.in/api/users?page=$page');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Map<String, dynamic>> getUserDetail(int userId) async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users/$userId'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return {'user': User.fromJson(data['data'])};
      }
      throw Exception('Failed to load user: ${response.statusCode}');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
