import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data/local_key_value_storage.dart';

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
    var result =
        await localStorage.readBool(LocalKeyValueStorageKeys.IsDarkThemeMode);

    // TODO: Handle error
    if (result.isRight()) {
      isDarkThemeMode.value = result.getOrElse(() => false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getThemeBrightness();
  }
}
