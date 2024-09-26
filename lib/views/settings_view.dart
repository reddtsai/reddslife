import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsPageController> {
  const SettingsView({super.key});

  SettingsSection themeSection(BuildContext context) {
    return SettingsSection(
      title: Text(AppLocalizations.of(context)!.settingsViewThemeSectionTitle),
      tiles: <SettingsTile>[
        SettingsTile.switchTile(
          title: Text(
              AppLocalizations.of(context)!.settingsViewThemeSectionDarkMode),
          leading: const Icon(Icons.brightness_6),
          onToggle: (bool value) {
            controller.toggleThemeBrightness(value);
          },
          initialValue: controller.isDarkThemeMode.value,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SettingsList(
          sections: [
            themeSection(context),
          ],
        ));
  }
}
