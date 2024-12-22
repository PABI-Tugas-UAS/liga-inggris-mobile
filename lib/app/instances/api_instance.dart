import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liga_inggris_mobile/app/core/handler/api_response.dart';

class ApiInstance {
  String baseUrl = dotenv.env['BACKEND_URL']!;
  Map<String, String> headers = {'Content-Type': 'application/json'};

  void setBaseUrl(String url) {
    baseUrl = url;
  }

  void setHeaders(Map<String, String> headers) {
    this.headers = headers;
  }

  Future<ApiResponse> get(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    final uri =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);

    http.Response response;
    try {
      response = await http.get(
        uri,
        headers: headers,
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        statusCode: 500,
        message: 'An unexpected error occurred: $e',
      );
    }

    if (response.body == '404 page not found') {
      return ApiResponse(
        success: false,
        statusCode: response.statusCode,
        message: 'Page not found',
      );
    }

    return _handleResponse(response);
  }

  Future<ApiResponse> post<T>(String endpoint, T body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<ApiResponse> put<T>(String endpoint, T body) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<ApiResponse> patch<T>(String endpoint, T body) async {
    final response = await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<ApiResponse> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );

    return _handleResponse(response);
  }

  Future<bool> validateFile(String url) async {
    final uri = Uri.parse('$baseUrl/v1/file/$url');
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ApiResponse _handleResponse(http.Response rawResponse) {
    try {
      final decodedResponse = json.decode(rawResponse.body);
      if (decodedResponse['success'] == null) {
        final clientStatusCode = rawResponse.statusCode;
        return ApiResponse(
          success: clientStatusCode == 200,
          statusCode: clientStatusCode,
          message: '',
        );
      }
      final response = ApiResponse.fromJson(decodedResponse);

      return response;
    } catch (e) {
      return ApiResponse(
        success: false,
        statusCode: 500,
        message: 'An unknown error occurred',
      );
    }
  }
}
