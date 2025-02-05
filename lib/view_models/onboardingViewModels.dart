import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pebble_pharmacy/models/state/user_provider.dart';
import 'package:pebble_pharmacy/models/user/user_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final Ref ref;

  OnboardingViewModel(this.ref);

  // Register user
  Future<User?> registerUser(String name, String phoneNumber, String pin, String role,) async {
    _setLoadingState(true);
    _errorMessage = null;
    notifyListeners();

    const String url = 'http://192.168.0.170:5000/api/auth/register';

    try {

      // print("Sending payload: ");
      // print({
      //   'name': name,
      //   'phoneNumber': phoneNumber,
      //   'pin': pin,
      //   'role': role,
      // });

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

      // print("Response body: ${response.body}");

      if (response.statusCode == 201) {
        User user = User.fromJson(jsonDecode(response.body));

        ref.read(userProvider.notifier).setUser(user);

        _setLoadingState(false);
        notifyListeners();
        // print("Registration successful: ${response.body}");
        return user;// Deserialize to User
      } else {
        _errorMessage = _getErrorMessage(response);
        // print("Error: ${_errorMessage}");
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Try again.';
      // print("Exception: $e");
    }

    _setLoadingState(false);
    notifyListeners();
    return null;  // Return null if registration fails
  }

  // Login user
  Future<User?> logInUser(String phoneNumber, String pin) async {
    _setLoadingState(true);
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
        User user = User.fromJson(jsonDecode(response.body));

        ref.read(userProvider.notifier).setUser(user);

        _setLoadingState(false);
        notifyListeners();
        return user; // Deserialize to User
      } else {
        _errorMessage = _getErrorMessage(response);
      }
    } catch (e) {
      _errorMessage = 'Unable to Login';
    }

    _setLoadingState(false);
    notifyListeners();
    return null;  // Return null if login fails
  }

  // Helper function to manage loading state
  void _setLoadingState(bool loading) {
    _isLoading = loading;
  }

  // Helper function to extract error message from response
  String _getErrorMessage(http.Response response) {
    try {
      final errorResponse = jsonDecode(response.body);
      return errorResponse['message'] ?? 'An error occurred';
    } catch (e) {
      return 'An error occurred';
    }
  }
}
