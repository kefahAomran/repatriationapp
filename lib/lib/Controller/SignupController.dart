import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import '../Services/API.dart';
import 'cache_manager.dart';

class SignupController extends GetxController with CacheManager {
  late Rx<TextEditingController> mobileController = TextEditingController().obs;
  late Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  late Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  late Rx<TextEditingController> userNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  late Rx<TextEditingController> idController = TextEditingController().obs;

  late Rx<TextEditingController> emailController = TextEditingController().obs;
  late Rx<TextEditingController> addressController =
      TextEditingController().obs;

  final List<Map<String, String>> countries = [
    {"code": "+966", "flag": "🇸🇦", "name": "Saudi Arabia"},
    {
      "code": "+963",
      "flag": "assets/images/syrian_flag.png",
      "name": "Syrian Arab Republic",
    },
    {"code": "+1", "flag": "🇺🇸", "name": "United States"},
    {"code": "+91", "flag": "🇮🇳", "name": "India"},
    {"code": "+44", "flag": "🇬🇧", "name": "United Kingdom"},
    // Add more countries as needed
  ];

  String selectedCountryCode = '+963';

  var chooseGender;

  var passwordVisible = true.obs;
  var passwordVisible2 = true.obs;
  var accept = false.obs;
  var loginProcess = true.obs;

  var error = "";
  Future<String> signup() async {
    error = "";
    loginProcess(false);
    try {
      List signupResp = await API.registerCivilian(
        mobile: selectedCountryCode + mobileController.value.text,
        last: lastNameController.value.text,
        password: passwordController.value.text,
        first: firstNameController.value.text,
        email: emailController.value.text,
        address: addressController.value.text,
        username: userNameController.value.text,
      );
      if (signupResp[0] != "") {
        //success

        await savedata('UserName', userNameController.value.text);
        Get.snackbar("Done", signupResp[0].toString());
      } else if (signupResp[1] == 'unknown') {
        error = "Unexpected error occurred, please try again later".tr;
      } else {
        error = signupResp[1];
      }
    } catch (e) {
      print(e);
      error = "Connection error".tr;
    } finally {
      loginProcess(true);
    }

    return error;
  }

  List<String> listType = ['سوري', 'فلسطيني سوري'];
  bool validateStructure(String value) {
    String pattern = r'(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9d$@].{7,29}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
