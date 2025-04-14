import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  bool _isPasswordVisible = false;
  String _selectedCountryCode = '+963'; // Default country code

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isPasswordVisible => _isPasswordVisible;
  String get selectedCountryCode => _selectedCountryCode;

  // Mock list of country codes for the dropdown
  final List<String> _countryCodes = ['+963', '+1', '+44', '+91'];
  List<String> get countryCodes => _countryCodes;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void selectCountryCode(String? code) {
    if (code != null) {
      _selectedCountryCode = code;
      notifyListeners();
    }
  }

  Future<bool> signIn({
    required String phoneNumber,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implement actual sign-in logic with API call
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Example validation (replace with actual API response check)
      if (phoneNumber.isEmpty || password.isEmpty) {
        throw Exception('Please fill all fields');
      }
      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      // Assuming login is successful
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error =
          'Sign-in failed: ${e.toString().replaceFirst('Exception: ', '')}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void resetError() {
    _error = null;
    notifyListeners();
  }
}
