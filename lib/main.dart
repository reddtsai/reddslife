import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './theme.dart';
import './global.dart';
import './controllers/app_controller.dart';
import './views/home_page.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Global.dependencies();

  runApp(const App());
}

class App extends GetWidget<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setAppThemeMode();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      getPages: Global.pages(),
    );
  }
}
