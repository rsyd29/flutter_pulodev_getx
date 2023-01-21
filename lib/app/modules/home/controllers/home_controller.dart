import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/services/local_storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  String changeFilterMediaName(String media) {
    String? mediaNamed;

    switch (media) {
      case 'all':
        mediaNamed = 'Semua Media';
        break;
      case 'writing':
        mediaNamed = 'Tulisan';
        break;
      case 'podcast':
        mediaNamed = 'Podcast';
        break;
      case 'video':
        mediaNamed = 'Video';
        break;
      case 'web':
        mediaNamed = 'Web';
        break;
    }
    return mediaNamed ?? 'Not Found';
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

  void saveFavoriteContent(DatumContents data) async {
    List<DatumContents> newDataStorage = [data];
    List<DatumContents>? allDataStorage = await readFavoriteContent();
    if (allDataStorage != null) {
      List<DatumContents> newAllDataStorage = List.from(allDataStorage)
        ..addAll(newDataStorage);
      String encodeData = jsonEncode(newAllDataStorage.toSet().toList());
      LocalStorageService.writeToStorage(
        storageName: LocalStorageService.favoriteStorage,
        key: 'favorite',
        value: encodeData,
      );
      await Fluttertoast.showToast(
        msg: 'Berhasil menyimpan ${data.title}',
        backgroundColor: Colors.green,
      );
    } else {
      List<DatumContents> dataSaved = [data];
      String encodeData = jsonEncode(dataSaved);
      LocalStorageService.writeToStorage(
        storageName: LocalStorageService.favoriteStorage,
        key: 'favorite',
        value: encodeData,
      );
      await Fluttertoast.showToast(
        msg: 'Berhasil menyimpan ${data.title}',
        backgroundColor: Colors.green,
      );
    }
  }

  void deleteFavoriteContent(DatumContents data) async {
    List<DatumContents>? allDataStorage = await readFavoriteContent();
    if (allDataStorage != null) {
      allDataStorage.remove(data);
      String encodeData = jsonEncode(allDataStorage);
      LocalStorageService.writeToStorage(
        storageName: LocalStorageService.favoriteStorage,
        key: 'favorite',
        value: encodeData,
      );
      await Fluttertoast.showToast(
        msg: 'Berhasil menghapus ${data.title}',
        backgroundColor: Colors.red,
      );
    }
  }

  void onPressedFavorite(DatumContents data) async {
    print('test');
    List<DatumContents>? storageData = await readFavoriteContent();
    if (storageData != null) {
      int index = storageData.indexOf(data);
      if (index.isNegative) {
        saveFavoriteContent(data);
      } else {
        deleteFavoriteContent(data);
      }
    } else {
      saveFavoriteContent(data);
    }
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
      debugPrint('$e\n$s');
    }
  }

  void getAllContentWithFilterByMedia(String media) async {
    try {
      change(null, status: RxStatus.loading());
      await homeProvider
          .getFilterMedia(changeFilterMediaName(media).toLowerCase())
          .then(
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
      debugPrint('$e\n$s');
    }
  }

  void getAllContentWithFilterByText(String newSearchTerm) async {
    try {
      change(null, status: RxStatus.loading());
      await homeProvider.getFilterText(newSearchTerm).then(
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
      debugPrint('$e\n$s');
    }
  }
}
