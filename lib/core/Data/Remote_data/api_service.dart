import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get(String endPoint) async {
    var url = Uri.parse('https://newsapi.org/$endPoint');
    final http.Response response = await http.get(url);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
