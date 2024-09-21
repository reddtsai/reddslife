import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/settings_page_controller.dart';
import './data/local_key_value_storage.dart';

class GlobalInjections {
  void dependencies() {
    Get.put<LocalKeyValueStorage>(SharedPreferencesStorage());
    Get.lazyPut(() => GlobalController(Get.find()));
    Get.lazyPut(() => SettingsPageController(Get.find()));
  }
}

class GlobalController extends GetxController {
  late ThemeMode themeMode;
  final LocalKeyValueStorage localStorage;
  GlobalController(this.localStorage);

  Future setAppThemeMode() async {
    themeMode = ThemeMode.light;
    // TODO: Handle error
    var result =
        await localStorage.readBool(LocalKeyValueStorageKeys.IsDarkThemeMode);
    if (result.isRight() && result.getOrElse(() => false)) {
      themeMode = ThemeMode.dark;
    }
    Get.changeThemeMode(themeMode);
  }
}
