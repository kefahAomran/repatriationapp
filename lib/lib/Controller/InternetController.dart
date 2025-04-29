import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivity.checkConnectivity().then((status) {
      isConnected.value = _getStatus(status as ConnectivityResult);
    });

    _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
            bool connection = _getStatus(result);
            if (!connection && isConnected.value != false) {
              Get.snackbar(
                "لا يوجد اتصال",
                "الرجاء التحقق من اتصال الإنترنت",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Get.theme.colorScheme.error,
                colorText: Get.theme.colorScheme.onError,
              );
            }
            isConnected.value = connection;
          }
          as void Function(List<ConnectivityResult> event)?,
    );
  }

  bool _getStatus(ConnectivityResult result) {
    return result != ConnectivityResult.none;
  }
}
