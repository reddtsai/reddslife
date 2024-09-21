import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
      dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
      dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    ),
    useMaterial3: true,
  );
}
