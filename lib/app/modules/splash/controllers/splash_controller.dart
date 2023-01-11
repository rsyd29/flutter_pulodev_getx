import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<bool> {
  @override
  void onInit() {
    super.onInit();
    loadingSplashScreen();
  }

  void loadingSplashScreen() async {
    change(true, status: RxStatus.success());
    await Future.delayed(const Duration(seconds: 3));
    change(false, status: RxStatus.success());
    await Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
  }
}
