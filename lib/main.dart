import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './theme.dart';
import './global.dart';
import './controllers/app_controller.dart';
import './views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjections.dependencies();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  Future initialize() async {
    var controller = Get.find<AppController>();
    controller.setAppThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () => initialize(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
