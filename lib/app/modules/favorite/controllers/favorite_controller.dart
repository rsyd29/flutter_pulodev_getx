import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/data/model/contents_model.dart';
import 'package:flutter_pulodev_getx/app/services/local_storage_service.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController
    with StateMixin<List<DatumContents>> {
  @override
  void onInit() {
    super.onInit();
    getAllFavorite();
  }

  Future<List<DatumContents>?> readFavoriteContent() async {
    var data = LocalStorageService.readFromStorage(
      storageName: LocalStorageService.favoriteStorage,
      key: 'favorite',
    );

    if (data != null) {
      List<DatumContents>? allData = (jsonDecode(data) as List)
          .map((e) => DatumContents.fromJson(e))
          .toList();
      return allData;
    } else {
      return null;
    }
  }

  void getAllFavorite() async {
    try {
      change(null, status: RxStatus.loading());
      await Future.delayed(
        Duration(
          seconds: Random().nextInt(3),
        ),
      );
      List<DatumContents>? data = await readFavoriteContent();
      if (data != null) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(
            await readFavoriteContent(),
            status: RxStatus.success(),
          );
        }
      } else {
        change([], status: RxStatus.empty());
      }
    } catch (e, s) {
      debugPrint('$e\n$s');
    }
  }
}
