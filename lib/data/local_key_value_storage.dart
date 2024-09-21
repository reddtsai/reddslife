import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalKeyValueStorageKeys {
  static const String IsDarkThemeMode = 'IsDarkThemeMode';
}

abstract class LocalKeyValueStorage {
  // TODO: define result type
  Future<Either<String, Unit>> save<T>(String key, T data);
  Future<Either<String, bool>> readBool(String key);
}

typedef SharedPrefsProvider = Future<SharedPreferences> Function();

class SharedPreferencesStorage implements LocalKeyValueStorage {
  final SharedPrefsProvider _storage;

  SharedPreferencesStorage({SharedPrefsProvider? storage})
      : _storage = storage ?? SharedPreferences.getInstance;

  @override
  Future<Either<String, Unit>> save<T>(String key, T data) async {
    try {
      final prefs = await _storage();
      switch (T) {
        case == bool:
          await prefs.setBool(key, data as bool);
          return right(unit);
        case == int:
          await prefs.setInt(key, data as int);
          return right(unit);
        case == double:
          await prefs.setDouble(key, data as double);
          return right(unit);
        case == String:
          await prefs.setString(key, data as String);
          return right(unit);
        default:
          return left('Type not supported');
      }
    } catch (ex) {
      return left('Error : $ex');
    }
  }

  @override
  Future<Either<String, bool>> readBool(String key) async {
    try {
      final prefs = await _storage();
      final response = prefs.getBool(key);
      if (response != null) {
        return right(response);
      }
      return left('No value found for key $key');
    } catch (ex) {
      return left('Error : $ex');
    }
  }
}
