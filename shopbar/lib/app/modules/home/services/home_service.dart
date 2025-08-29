import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> fetchHomeNews() async {
    final response = await http.get(Uri.parse('$_baseUrl/products?limit=5'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load home news');
    }
  }
}
