import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OnboardingViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> registerUser(
      String name, String phoneNumber, String pin, String role) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    const String url = 'http://192.168.0.170:5000/api/auth/register';

    try {

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'phoneNumber': phoneNumber,
          'pin': pin,
          'role': role,
        }),
      );


      if (response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Try again.';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> logInUser (String phoneNumber, String pin) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    const String url = 'http://192.168.0.170:5000/api/auth/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'pin': pin,
        }),
      );

      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      _errorMessage = 'Unable to Login';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
