import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';
import '../Services/API.dart';
import 'cache_manager.dart';

class VerificationController extends GetxController with CacheManager {
  late Rx<TextEditingController> verification = TextEditingController().obs;
  late Rx<TextEditingController> password = TextEditingController().obs;
  late Rx<TextEditingController> confPassword = TextEditingController().obs;
  late Rx<TextEditingController> userName = TextEditingController().obs;
  var passwordVisible = false.obs;
  var passwordVisible2 = false.obs;
  var otpCode = ''.obs;
  var verify = true.obs;
  bool validateStructure(String value) {
    String pattern = r'(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9d$@].{7,29}';
    RegExp regExp = new RegExp(pattern);
    //  print(regExp.hasMatch(value));
    return regExp.hasMatch(value);
  }

  late Rx<TextEditingController> pinController = TextEditingController().obs;

  Future<String> verificationCode() async {
    error = "";
    verify(false);
    var user = getdata('UserName');

    try {
      List activate = await API.verify(
        email: user.toString(),
        code: pinController.value.text,
      );
      if (activate[0] != "") {
        //success
        Get.snackbar("Done".tr, activate[0]);
      } else {
        error = activate[1];
      }
    } catch (e) {
      print(e);

      error = "Connection error".tr;
    } finally {
      verify(true);
    }
    return error;
  }

  var error = "";
  var resend = true.obs;
}
