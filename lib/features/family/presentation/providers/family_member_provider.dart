import 'package:flutter/material.dart';

class FamilyMemberProvider extends ChangeNotifier {
  String? _currentCountry;
  String? _currentRegion;
  String? _currentZone;
  String? _residence;
  String? _zip;
  String? _address;
  String? _destinationCountry;
  String? _destinationRegion;
  String? _destinationZone;
  String? _destinationResidence;
  String? _destinationZip;
  String? _destinationAddress;
  bool _isLoading = false;
  String? _error;

  // Getters
  String? get currentCountry => _currentCountry;
  String? get currentRegion => _currentRegion;
  String? get currentZone => _currentZone;
  String? get residence => _residence;
  String? get zip => _zip;
  String? get address => _address;
  String? get destinationCountry => _destinationCountry;
  String? get destinationRegion => _destinationRegion;
  String? get destinationZone => _destinationZone;
  String? get destinationResidence => _destinationResidence;
  String? get destinationZip => _destinationZip;
  String? get destinationAddress => _destinationAddress;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Sample data for dropdowns
  final List<String> countries = ['Syria', 'Turkey', 'Lebanon', 'Jordan'];
  final List<String> regions = ['Damascus', 'Aleppo', 'Homs', 'Hama'];
  final List<String> zones = ['Zone A', 'Zone B', 'Zone C', 'Zone D'];

  // Setters
  void setCurrentCountry(String value) {
    _currentCountry = value;
    notifyListeners();
  }

  void setCurrentRegion(String value) {
    _currentRegion = value;
    notifyListeners();
  }

  void setCurrentZone(String value) {
    _currentZone = value;
    notifyListeners();
  }

  void setResidence(String value) {
    _residence = value;
    notifyListeners();
  }

  void setZip(String value) {
    _zip = value;
    notifyListeners();
  }

  void setAddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setDestinationCountry(String value) {
    _destinationCountry = value;
    notifyListeners();
  }

  void setDestinationRegion(String value) {
    _destinationRegion = value;
    notifyListeners();
  }

  void setDestinationZone(String value) {
    _destinationZone = value;
    notifyListeners();
  }

  void setDestinationResidence(String value) {
    _destinationResidence = value;
    notifyListeners();
  }

  void setDestinationZip(String value) {
    _destinationZip = value;
    notifyListeners();
  }

  void setDestinationAddress(String value) {
    _destinationAddress = value;
    notifyListeners();
  }

  bool get isValid {
    return _currentCountry != null &&
        _currentRegion != null &&
        _currentZone != null &&
        _residence != null &&
        _zip != null &&
        _address != null &&
        _destinationCountry != null &&
        _destinationRegion != null &&
        _destinationZone != null &&
        _destinationResidence != null &&
        _destinationZip != null &&
        _destinationAddress != null;
  }

  Future<bool> saveFamilyMember() async {
    if (!isValid) return false;

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Implement API call to save family member
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to save family member';
      notifyListeners();
      return false;
    }
  }

  void reset() {
    _currentCountry = null;
    _currentRegion = null;
    _currentZone = null;
    _residence = null;
    _zip = null;
    _address = null;
    _destinationCountry = null;
    _destinationRegion = null;
    _destinationZone = null;
    _destinationResidence = null;
    _destinationZip = null;
    _destinationAddress = null;
    _isLoading = false;
    _error = null;
    notifyListeners();
  }
}
