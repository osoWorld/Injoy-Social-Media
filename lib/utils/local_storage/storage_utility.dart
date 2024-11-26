import 'package:get_storage/get_storage.dart';

class CFSLocalStorage {
  static final CFSLocalStorage _instance =
      CFSLocalStorage._internal(); //Singleton Class

  factory CFSLocalStorage() {
    return _instance;
  }

  CFSLocalStorage._internal();

  final _storage = GetStorage();

  //Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //Generic method to read data
  T? readData<T>(String key) {
    return _storage.read(key);
  }

  //Generic method to remove data
  Future<void> removeData<T>(String key) async {
    return _storage.remove(key);
  }

  //Clear all data in storage
  Future<void> clearAll() async {
    return _storage.erase();
  }
}
