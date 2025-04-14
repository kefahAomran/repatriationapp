import 'package:flutter/material.dart';

class FamilyMember {
  final String id;
  final String name;
  final String currentLocation;
  final String destinationLocation;
  final String status;
  final String? imageUrl;

  FamilyMember({
    required this.id,
    required this.name,
    required this.currentLocation,
    required this.destinationLocation,
    required this.status,
    this.imageUrl,
  });
}

class FamilyMembersProvider extends ChangeNotifier {
  List<FamilyMember> _familyMembers = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<FamilyMember> get familyMembers => _familyMembers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Sample data for demonstration
  final List<FamilyMember> _sampleData = [
    FamilyMember(
      id: '1',
      name: 'Ahmed Mohammed',
      currentLocation: 'Damascus, Syria',
      destinationLocation: 'Istanbul, Turkey',
      status: 'In Progress',
    ),
    FamilyMember(
      id: '2',
      name: 'Fatima Ali',
      currentLocation: 'Aleppo, Syria',
      destinationLocation: 'Ankara, Turkey',
      status: 'Completed',
    ),
    FamilyMember(
      id: '3',
      name: 'Omar Hassan',
      currentLocation: 'Homs, Syria',
      destinationLocation: 'Izmir, Turkey',
      status: 'Pending',
    ),
  ];

  Future<void> loadFamilyMembers() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));
      _familyMembers = _sampleData;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load family members';
      notifyListeners();
    }
  }

  Future<void> addFamilyMember({
    required String name,
    required String currentLocation,
    required String destinationLocation,
    required String status,
    String? imageUrl,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));

      final newMember = FamilyMember(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        currentLocation: currentLocation,
        destinationLocation: destinationLocation,
        status: status,
        imageUrl: imageUrl,
      );

      _familyMembers.add(newMember);

      _isLoading = false;
      notifyListeners();
      return;
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to add family member';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteFamilyMember(String id) async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));
      _familyMembers.removeWhere((member) => member.id == id);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to delete family member';
      notifyListeners();
    }
  }

  void resetError() {
    _error = null;
    notifyListeners();
  }
}
