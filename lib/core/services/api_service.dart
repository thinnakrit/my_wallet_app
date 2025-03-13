import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<T> post<T, R>(
    Uri url,
    R body,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return fromJson(responseData);
      } else {
        throw Exception(
          'Failed to post: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to post: $e');
    }
  }

  static Future<T> get<T>(
    String apiUrl,
    String path,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final Uri url = Uri.parse('$apiUrl/$path');
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json', ...?headers},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return fromJson(responseData);
      } else {
        throw Exception(
          'Failed to get: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to get: $e');
    }
  }
}
