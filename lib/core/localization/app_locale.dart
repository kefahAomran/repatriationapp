import 'package:flutter/material.dart';

class AppLocale {
  static final AppLocale _instance = AppLocale._internal();
  factory AppLocale() => _instance;
  AppLocale._internal();

  static const String english = 'en';
  static const String arabic = 'ar';

  static Locale currentLocale = const Locale(english);

  static void setLocale(String languageCode) {
    currentLocale = Locale(languageCode);
  }

  static bool get isArabic => currentLocale.languageCode == arabic;
}
