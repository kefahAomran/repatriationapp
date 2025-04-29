import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../Component/general_response.dart';
import 'HomeController.dart';
import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  // String error = '';
  var finishGet = false.obs;
  final UpdateState = false.obs;
  RxBool jailbroken = false.obs;
  RxBool firstInstall = true.obs;
  //  RxBool developerMode=false.obs;
  RxDouble progress = 0.00001.obs;
  // var url = "https://ecsc.gov.sy/assets/ECSCV2.1.10.apk";

  /*
  checkJailBreak() async {
    print("checkJailBreak");
    try {
      print(GetPlatform.isIOS);
      if(GetPlatform.isIOS) { print("GetPlatform.isIOS");
        jailbroken.value = await FlutterJailbreakDetection.jailbroken;
      } else {print("GetPlatform.android");
        jailbroken.value = await FlutterJailbreakDetection.developerMode;
        print(jailbroken.value);
      }
    } on PlatformException {print("errror");
      jailbroken(true);
    }

  }
*/

  Future<File> _getFile(String filename) async {
    final dir = await getDownloadsDirectory();
    print(dir!.path);

    return File("/storage/emulated/0/Download/$filename");
  }

  Future<void> logOut() async {
    isLogged.value = false;

    //SignedUser = null;

    await removeToken();
  }

  void login(String token) async {
    isLogged.value = true;
    //Token is cached
    Token = token;
    saveToken(token);
  }

  Future<void> checkLoginStatus() async {
    Token = getToken() == null ? "" : getToken()!;
    if (Token!.isNotEmpty) {
      final res = getdata("SignUser");
      //       SignedUser = PProfileResult.fromJson(jsonDecode(res!));
      // print(SignedUser);
      isLogged.value = true;
    }
  }

  var check;
  String val = "";
  RxInt counter = 0.obs;
}
