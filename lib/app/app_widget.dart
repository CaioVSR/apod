import 'package:apod/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: key,
      title: 'NASA APOD',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        colorSchemeSeed: AppTheme.instance.colors.background,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.instance.colors.background,
          foregroundColor: AppTheme.instance.colors.primary,
          titleTextStyle: AppTheme.instance.typography.nasaL,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
    );
  }
}
