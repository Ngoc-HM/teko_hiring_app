import 'dart:convert';
import 'package:http/http.dart' as http;
import '../endpoints.dart';

class ApiService {
  static const String baseUrl = API_TEKO;

  Future<Map<String, dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
