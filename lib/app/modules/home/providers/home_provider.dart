import 'package:get/get.dart';

import '../../../core/values/app_api.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppAPI.baseURL;
  }

  Future<Response> getAllContent() async => await get(AppAPI.allContent);

  Future<Response> getFilterPage(String page) async =>
      await get('${AppAPI.filterPage}$page');

  Future<Response> getFilterMedia(String media) async =>
      await get('${AppAPI.filterMedia}$media');

  Future<Response> getFilterText(String text) async =>
      await get('${AppAPI.filterText}$text');
}
