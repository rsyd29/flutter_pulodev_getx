import 'package:get/get.dart';

import 'home_controller.dart';

enum Media {
  all,
  writing,
  podcast,
  video,
  web,
}

class FilterCategoryController extends GetxController with StateMixin<String> {
  @override
  void onInit() {
    super.onInit();
    change(Media.all.name, status: RxStatus.success());
  }

  void changeFilterByMedia(String filtering) {
    Get.find<HomeController>().getAllContentWithFilterByMedia(filtering);
    change(filtering, status: RxStatus.success());
  }
}
