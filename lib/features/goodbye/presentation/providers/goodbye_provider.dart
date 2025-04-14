import 'package:flutter/material.dart';

class GoodbyeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> handleLogout() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual logout logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      _error = null;
    } catch (e) {
      _error = 'Failed to logout: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetError() {
    _error = null;
    notifyListeners();
  }
}
