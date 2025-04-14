import 'package:flutter/material.dart';

class RequestProvider extends ChangeNotifier {
  String? _selectedNeed;
  DateTime? _selectedDate;
  String _note = '';

  String? get selectedNeed => _selectedNeed;
  DateTime? get selectedDate => _selectedDate;
  String get note => _note;

  final List<String> needs = [
    'Medical Care',
    'Education',
    'Housing',
    'Food',
    'Other'
  ];

  void setNeed(String need) {
    _selectedNeed = need;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setNote(String note) {
    _note = note;
    notifyListeners();
  }

  bool get isValid {
    return _selectedNeed != null && _selectedDate != null && _note.isNotEmpty;
  }

  Future<bool> saveRequest() async {
    if (!isValid) return false;

    try {
      // TODO: Implement API call to save request
      await Future.delayed(const Duration(seconds: 1)); // Simulated API call
      return true;
    } catch (e) {
      return false;
    }
  }

  void reset() {
    _selectedNeed = null;
    _selectedDate = null;
    _note = '';
    notifyListeners();
  }
}
