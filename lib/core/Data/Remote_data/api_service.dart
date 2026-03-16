import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'newsapi.org';
  final String key = '32e73a68843c44f3bc5ab850983ec22d';

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? params}) async {
    var url = Uri.http(baseUrl, 'v2/$endPoint', {'apiKey': key, ...?params});
    final http.Response response = await http.get(url);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
