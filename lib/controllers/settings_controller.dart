import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/local_key_value_storage.dart';

class SettingsPageController extends GetxController {
  Rx<bool> isDarkThemeMode = false.obs;

  final LocalKeyValueStorage localStorage;
  SettingsPageController(this.localStorage);

  Future<void> toggleThemeBrightness(bool isDarkMode) async {
    isDarkThemeMode.value = isDarkMode;
    Get.changeThemeMode(
        isDarkThemeMode.value ? ThemeMode.dark : ThemeMode.light);
    // TODO: Handle error
    localStorage.save(LocalKeyValueStorageKeys.IsDarkThemeMode, isDarkMode);
  }

  Future<void> getThemeBrightness() async {
    final (err, isDark) =
        await localStorage.readBool(LocalKeyValueStorageKeys.IsDarkThemeMode);

    // TODO: Handle error
    if (!err) {
      isDarkThemeMode.value = isDark;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getThemeBrightness();
  }
}
