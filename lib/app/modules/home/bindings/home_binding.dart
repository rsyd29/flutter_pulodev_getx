import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';
import '../controllers/home_controller.dart';
import '../providers/home_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<FilterCategoryController>(
      () => FilterCategoryController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        homeProvider: Get.find(),
      ),
    );
  }
}
