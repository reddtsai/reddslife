import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import '../controllers/settings_page_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final SettingsPageController settingsPageController =
      Get.put(SettingsPageController(Get.find()));

  SettingsSection themeSection() {
    return SettingsSection(
      title: const Text('外觀'),
      tiles: <SettingsTile>[
        SettingsTile.switchTile(
          title: const Text('深色'),
          leading: const Icon(Icons.brightness_6),
          onToggle: (bool value) {
            settingsPageController.toggleThemeBrightness(value);
          },
          initialValue: settingsPageController.isDarkThemeMode.value,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SettingsList(
          sections: [
            themeSection(),
          ],
        ));
  }
}
