import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginAction {
  const LoginAction();

  /// Makes the login API call
  Future<Map<String, dynamic>> call(Map<String, dynamic> loginData) async {
    final String apiUrl =
        dotenv.env['API_URL'] ??
        (throw Exception('API_URL is not defined in .env'));

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(loginData),
      );

      return _handleResponse(response);
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception('Network error: Please check your internet connection');
      }
      rethrow;
    }
  }

  /// Handles the response from backend
  Map<String, dynamic> _handleResponse(http.Response response) {
    final responseData = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'token': responseData['token'] ?? responseData['access_token'],
          'user': responseData['user'] ?? responseData['userData'],
          'message': responseData['message'] ?? 'Login successful',
        };
      case 400:
        throw Exception(responseData['message'] ?? 'Invalid email or password');
      case 401:
        throw Exception(responseData['message'] ?? 'Invalid credentials');
      case 403:
        throw Exception(responseData['message'] ?? 'Account not verified');
      case 404:
        throw Exception(responseData['message'] ?? 'User not found');
      case 422:
        throw Exception(responseData['message'] ?? 'Validation failed');
      case 500:
        throw Exception('Server error: Please try again later');
      default:
        throw Exception('Login failed: ${response.statusCode}');
    }
  }
}

/// Export a singleton instance to avoid creating new objects everywhere
const loginAction = LoginAction();
