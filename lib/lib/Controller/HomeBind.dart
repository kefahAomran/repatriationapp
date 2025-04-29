import 'package:get/get.dart';

import 'HomeController.dart';
import 'authentication_manager.dart';

class HomeBind implements Bindings {
  final AuthenticationManager _authmanager = Get.find();
  @override
  Future<void> dependencies() async {
     Get.delete<HomeController>();

  }


}