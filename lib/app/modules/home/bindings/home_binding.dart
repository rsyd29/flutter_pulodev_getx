import 'package:get/get.dart';

import 'package:flutter_pulodev_getx/app/modules/home/controllers/filter_category_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterCategoryController>(
      () => FilterCategoryController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
