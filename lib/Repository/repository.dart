import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginRepository {
  final Dio dio = Dio();

  // Login
  Future<Response> login(String username, String password) async {
    try {
      final response = await dio.post(
        'http://185.238.70.122:8882/api/auth/login',
        data: {
          'userName': username,
          'password': password,
          "remember": false
        },
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = response.data['token'];
        await prefs.setString('token', token);  // Store the token locally
      }
      return response;
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  // Register
  Future<Response> register(String username, String password) async {
    try {
      final response = await dio.post(
        'http://185.238.70.122:8882/api/auth/Register',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = response.data['token'];  // Assuming the API returns a token
        await prefs.setString('token', token);  // Store token locally
      }
      return response;
    } catch (e) {
      throw Exception('Failed to register');
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }

  // Logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
