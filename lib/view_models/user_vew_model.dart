import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  String? _userId;

  String? get userId => _userId;

  // Set the user ID
  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  // Clear the user ID (e.g., on logout)
  void clearUserId() {
    _userId = null;
    notifyListeners();
  }
}
