import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static final favoriteStorage = getStorage(name: 'favorite');

  static GetStorage getStorage({required String name}) {
    return GetStorage(name);
  }

  static writeToStorage({
    required GetStorage storageName,
    required String key,
    required dynamic value,
  }) async {
    await storageName.write(key, value);
  }

  static String? readFromStorage({
    required GetStorage storageName,
    required String key,
  }) {
    var data = storageName.read(key);
    return data;
  }

  static removeForStorage({
    required GetStorage storageName,
    required String key,
  }) async {
    await storageName.remove(key).then(
          (_) => Fluttertoast.showToast(
            msg: 'Berhasil menghapus',
          ),
        );
  }
}
