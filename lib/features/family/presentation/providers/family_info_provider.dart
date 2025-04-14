import 'package:flutter/material.dart';

class FamilyLocation {
  final String country;
  final String region;
  final String zone;
  final String residence;
  final String zip;
  final String mobilenumber;
  final String address;

  FamilyLocation({
    required this.country,
    required this.region,
    required this.zone,
    required this.residence,
    required this.zip,
    required this.mobilenumber,
    required this.address,
  });

  FamilyLocation copyWith({
    String? country,
    String? region,
    String? zone,
    String? residence,
    String? zip,
    String? address,
  }) {
    return FamilyLocation(
      country: country ?? this.country,
      region: region ?? this.region,
      zone: zone ?? this.zone,
      residence: residence ?? this.residence,
      zip: zip ?? this.zip,
      mobilenumber: mobilenumber ?? this.mobilenumber,
      address: mobilenumber ?? this.address,
    );
  }
}

class FamilyInfoProvider extends ChangeNotifier {
  FamilyLocation _currentLocation = FamilyLocation(
    country: '',
    region: '',
    zone: '',
    residence: '',
    zip: '',
    mobilenumber: '',
    address: '',
  );

  FamilyLocation _destinationLocation = FamilyLocation(
    country: '',
    region: '',
    zone: '',
    residence: '',
    zip: '',
    mobilenumber: '',
    address: '',
  );

  bool _isLoading = false;
  String? _error;

  FamilyLocation get currentLocation => _currentLocation;
  FamilyLocation get destinationLocation => _destinationLocation;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void updateCurrentLocation(FamilyLocation location) {
    _currentLocation = location;
    notifyListeners();
  }

  void updateDestinationLocation(FamilyLocation location) {
    _destinationLocation = location;
    notifyListeners();
  }

  Future<void> saveFamilyInfo() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implement API call to save family info
      await Future.delayed(const Duration(seconds: 1)); // Simulated delay
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
