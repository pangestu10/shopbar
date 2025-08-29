import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<Map<String, dynamic>> fetchUser() async {
    final response = await http.get(Uri.parse('$_baseUrl/users/1'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
