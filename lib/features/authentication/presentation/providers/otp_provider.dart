import 'dart:async';
import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _remainingTime = 60;
  int get remainingTime => _remainingTime;

  Timer? _timer;
  bool _canResend = false;
  bool get canResend => _canResend;

  String _otp = '';
  String get otp => _otp;

  void startTimer() {
    _canResend = false;
    _remainingTime = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        _canResend = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void setOTP(String value) {
    _otp = value;
    notifyListeners();
  }

  Future<void> verifyOTP() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement OTP verification logic
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    } catch (e) {
      debugPrint('Error verifying OTP: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resendOTP() async {
    if (!_canResend) return;

    try {
      // TODO: Implement resend OTP logic
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay
      startTimer();
    } catch (e) {
      debugPrint('Error resending OTP: $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
