import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/API.dart';
import '../Component/app_theme.dart';
import '../Component/general_response.dart';
import '../Model/configrationModel.dart';
import 'cache_manager.dart';

class LocaleController extends GetxController with CacheManager {
  Locale? language;
  ThemeData appTheme = themeEnglish;
  String selectedcurrency = "2";
  bool isuseralreadylogin = false;
  String initialvalue = "en";
  changeLang(String langcode) {
    languagee = langcode;
    Locale locale = Locale(langcode);
    savedata("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

    update();
  }

  @override
  Future<void> onInit() async {
    String? sharedPrefLang = getdata("lang");
    if (sharedPrefLang == "ar") {
      languagee = 'ar';
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      languagee = 'en';
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      languagee = 'en';
      savedata("lang", "en");
      changeLang("en");
    }
    super.onInit();
    if (getdata("SignUser") != null) {
      isuseralreadylogin = true;
      //  dataUser = logmodel.Data.fromJson(jsonDecode(getdata("SignUser")!));
    }
  }

  var getconfigration = true.obs;
}
