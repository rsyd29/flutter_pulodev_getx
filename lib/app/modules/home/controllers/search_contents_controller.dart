import 'package:flutter/cupertino.dart';
import 'package:flutter_pulodev_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_pulodev_getx/app/modules/home/providers/home_provider.dart';
import 'package:get/get.dart';

class SearchContentsController extends GetxController with StateMixin<String> {
  SearchContentsController({required this.homeProvider});
  final HomeProvider homeProvider;

  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<String> onSearchContent(String newSearchTerm) async {
    await Future.delayed(const Duration(milliseconds: 800));
    Get.find<HomeController>().getAllContentWithFilterByText(newSearchTerm);
    change(newSearchTerm, status: RxStatus.success());
    return newSearchTerm;
  }
}
