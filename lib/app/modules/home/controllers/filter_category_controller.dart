import 'package:get/get.dart';

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

  void changeFilterByMedia(String filtering) => change(
        filtering,
        status: RxStatus.success(),
      );
}
