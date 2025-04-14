import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _phoneNumber;
  String? _otp;
  bool _isLoading = false;
  bool _isAuthenticated = false;

  String? get phoneNumber => _phoneNumber;
  String? get otp => _otp;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void setOTP(String otp) {
    _otp = otp;
    notifyListeners();
  }

  Future<void> verifyOTP() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isAuthenticated = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> resendOTP() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _phoneNumber = null;
    _otp = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
