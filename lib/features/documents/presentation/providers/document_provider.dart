import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentProvider extends ChangeNotifier {
  File? _selectedImage;
  bool _isLoading = false;
  String? _error;
  final int _maxSizeInKb = 500;

  File? get selectedImage => _selectedImage;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasValidImage => _selectedImage != null;

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final sizeInKb = await file.length() ~/ 1024;

        if (sizeInKb > _maxSizeInKb) {
          _error = 'Image size must be less than 500 Kb';
          _selectedImage = null;
        } else {
          _selectedImage = file;
          _error = null;
        }
        notifyListeners();
      }
    } catch (e) {
      _error = 'Failed to pick image';
      notifyListeners();
    }
  }

  Future<bool> uploadDocument() async {
    if (_selectedImage == null) return false;

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // TODO: Implement actual API call to upload document
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to upload document';
      notifyListeners();
      return false;
    }
  }

  void reset() {
    _selectedImage = null;
    _isLoading = false;
    _error = null;
    notifyListeners();
  }
}
