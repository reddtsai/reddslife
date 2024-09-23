import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalKeyValueStorageKeys {
  static const String IsDarkThemeMode = 'IsDarkThemeMode';
}

abstract class LocalKeyValueStorage extends GetxService {
  // TODO: define result type
  Future<(bool, Unit)> save<T>(String key, T data);
  Future<(bool, bool)> readBool(String key);
}

typedef SharedPrefsProvider = Future<SharedPreferences> Function();

class SharedPreferencesStorage extends LocalKeyValueStorage {
  late SharedPrefsProvider storage;

  Future<SharedPreferencesStorage> conn() async {
    storage = SharedPreferences.getInstance;
    return this;
  }

  @override
  Future<(bool, Unit)> save<T>(String key, T data) async {
    // TODO
    bool err = false;

    try {
      final prefs = await storage();
      switch (T) {
        case == bool:
          await prefs.setBool(key, data as bool);
        case == int:
          await prefs.setInt(key, data as int);
        case == double:
          await prefs.setDouble(key, data as double);
        case == String:
          await prefs.setString(key, data as String);
        default:
          // return left('Type not supported');
          err = true;
      }
    } catch (ex) {
      // return left('Error : $ex');
      err = true;
    }

    return (err, unit);
  }

  @override
  Future<(bool, bool)> readBool(String key) async {
    // TODO
    bool err = false;
    bool result = false;

    try {
      final prefs = await storage();
      final response = prefs.getBool(key);
      if (response != null) {
        result = response;
      }
      // return left('No value found for key $key');
    } catch (ex) {
      // return left('Error : $ex');
      err = true;
    }

    return (err, result);
  }
}
