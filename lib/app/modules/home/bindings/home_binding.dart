import 'package:get/get.dart';

import 'package:flutter_pulodev_getx/app/modules/home/controllers/search_contents_controller.dart';

import '../controllers/filter_category_controller.dart';
import '../controllers/home_controller.dart';
import '../providers/home_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(
      () => HomeProvider(),
    );
    Get.lazyPut<SearchContentsController>(
      () => SearchContentsController(
        homeProvider: Get.find(),
      ),
    );
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
