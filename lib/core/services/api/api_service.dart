import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bookfinder/core/services/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'api_response.dart';

class ApiService {
  Future<ApiResponse> get(String endpoint) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}$endpoint');
      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } on SocketException {
      return ApiResponse(error: "No Internet connection.");
    } on HttpException {
      return ApiResponse(error: "Couldn't find the server.");
    } on FormatException {
      return ApiResponse(error: "Invalid response format.");
    } on TimeoutException {
      return ApiResponse(error: "Request timed out.");
    } catch (e) {
      return ApiResponse(error: "Something went wrong: ${e.toString()}");
    }
  }

  ApiResponse _handleResponse(http.Response response) {
    if (response.body.isEmpty) {
      return ApiResponse(error: "Empty response from server.");
    }

    switch (response.statusCode) {
      case 200:
        return ApiResponse(data: jsonDecode(response.body));
      case 400:
        return ApiResponse(error: "Bad Request. Please check your input.");
      case 401:
        return ApiResponse(error: "Unauthorized. Please log in again.");
      case 403:
        return ApiResponse(error: "Forbidden. You don't have access.");
      case 404:
        return ApiResponse(error: "Resource not found.");
      case 500:
        return ApiResponse(error: "Server error. Please try again later.");
      default:
        return ApiResponse(error: "Unexpected error: ${response.statusCode}");
    }
  }
}
