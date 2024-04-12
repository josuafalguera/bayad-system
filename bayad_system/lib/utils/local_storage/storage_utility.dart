import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async =>
      await _storage.write(key, value);

  // Generic method to read data
  T? readData<T>(String key) => _storage.read(key);

  // Generic method to remove data
  Future<void> removeData(String key) async => await _storage.remove(key);

  // Clear all data in storage
  Future<void> clearAllData() async => await _storage.erase();
}
