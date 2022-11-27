import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/model/contents_model.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController
    with StateMixin<List<DatumContents>> {
  final HomeProvider homeProvider;
  HomeController({required this.homeProvider});

  @override
  void onInit() {
    super.onInit();
    getAllContent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllContent() async {
    try {
      change(null, status: RxStatus.loading());
      await homeProvider.getAllContent().then(
        (response) {
          if (response.statusCode == 200) {
            List<DatumContents> data =
                (jsonDecode(response.body)['data'] as List)
                    .map((e) => DatumContents.fromJson(e))
                    .toList();

            if (data.isEmpty) {
              change([], status: RxStatus.empty());
            } else {
              change(data, status: RxStatus.success());
            }
          } else {
            change(null,
                status:
                    RxStatus.error('${response.statusCode}: ${response.body}'));
          }
        },
      );
    } catch (e, s) {
      print('$e\n$s');
    }
  }
}
