import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> fetchNews() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
