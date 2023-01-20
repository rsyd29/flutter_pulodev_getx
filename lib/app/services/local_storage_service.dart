import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static final favoriteStorage = createStorage(name: 'favorite');

  static GetStorage createStorage({required String name}) {
    return GetStorage(name);
  }

  static writeToStorage({
    required GetStorage storageName,
    required String key,
    required dynamic value,
  }) async {
    await storageName.write(key, value);
  }

  static readFromStorage({
    required GetStorage storageName,
    required String key,
  }) {
    storageName.read(key);
  }

  static removeForStorage({
    required GetStorage storageName,
    required String key,
  }) async {
    await storageName.remove(key);
  }
}
