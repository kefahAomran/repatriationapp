import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import '../Services/API.dart';
import 'authentication_manager.dart';
import 'cache_manager.dart';

class LoginController extends GetxController with CacheManager {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mobileController.value.text =
        getdata("UserName") != null ? getdata("UserName")! : "";
  }

  var loginProcess = true.obs;
  var passwordVisible = true.obs;
  late Rx<TextEditingController> mobileController = TextEditingController().obs;
  late Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  var error = "";
  Future<String> login() async {
    loginProcess(false);
    error = "";
    try {
      List loginResp = await API.login(
        email: mobileController.value.text,
        password: passwordController.value.text,
      );
      if (loginResp[0] != "") {
        //success
        // savedata("SignUser", json.encode(loginResp[0]));
        // savedata("UserName", mobileController.value.text);
        _authManager.login(loginResp[0]);
      } else {
        error = loginResp[1];
      }
    } catch (e) {
      error = "Connection error".tr;
      error = "$e";
      print(e);
    } finally {
      loginProcess(true);
    }
    return error;
  }

  bool validateStructure(String value) {
    String pattern = r'(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9d$@].{7,29}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
