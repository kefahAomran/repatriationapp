import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _userName = 'Roba';
  String _familySummary = '---';
  String _requestsList = '---';
  bool _isLoading = false;
  String? _error;

  String get userName => _userName;
  String get familySummary => _familySummary;
  String get requestsList => _requestsList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUserData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to load user data
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay

      // Simulated data
      _userName = 'Roba';
      _familySummary = 'Family members: 4\nStatus: Active';
      _requestsList = 'Pending Requests: 2\nCompleted Requests: 5';

      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement logout logic
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay
      _error = null;
    } catch (e) {
      _error = e.toString();
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
