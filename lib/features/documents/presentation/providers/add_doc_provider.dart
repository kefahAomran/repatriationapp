import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDocProvider extends ChangeNotifier {
  File? _selectedImage;
  bool _isLoading = false;
  String? _error;
  final _imagePicker = ImagePicker();

  File? get selectedImage => _selectedImage;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();

        // Check if file size is less than 500KB
        if (fileSize > 500 * 1024) {
          _error = 'Image size must be less than 500KB';
          _selectedImage = null;
          notifyListeners();
          return;
        }

        // Check if file is JPG/JPEG
        final extension = pickedFile.path.split('.').last.toLowerCase();
        if (extension != 'jpg' && extension != 'jpeg') {
          _error = 'Only JPG/JPEG images are allowed';
          _selectedImage = null;
          notifyListeners();
          return;
        }

        _selectedImage = file;
        _error = null;
      }
    } catch (e) {
      _error = 'Failed to pick image: $e';
      _selectedImage = null;
    }
    notifyListeners();
  }

  Future<void> saveDocument({
    required String title,
    required String description,
    required String category,
  }) async {
    if (_selectedImage == null) {
      _error = 'Please select an image';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to save document
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      _error = null;
    } catch (e) {
      _error = 'Failed to save document: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetError() {
    _error = null;
    notifyListeners();
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }
}
