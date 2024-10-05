import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/local_key_value_storage.dart';

class AppController extends GetxController {
  late ThemeMode themeMode;
  final LocalKeyValueStorage localStorage;
  AppController(this.localStorage);

  Future setAppThemeMode() async {
    themeMode = ThemeMode.light;
    var (err, isDark) =
        await localStorage.readBool(LocalKeyValueStorageKeys.IsDarkThemeMode);
    // TODO: Handle error
    if (!err && isDark) {
      themeMode = ThemeMode.dark;
    }
    Get.changeThemeMode(themeMode);
    // Get.updateLocale(Locale('en'));
  }
}
