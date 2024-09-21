import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddslife/theme.dart';
import './views/home_screen.dart';
import './global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var injection = GlobalInjections();
  injection.dependencies();

  runApp(const ReddsLifeApp());
}

class ReddsLifeApp extends StatelessWidget {
  const ReddsLifeApp({super.key});

  Future initialize() async {
    var controller = Get.find<GlobalController>();
    controller.setAppThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () => initialize(),
      title: 'Redds Life App',
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
