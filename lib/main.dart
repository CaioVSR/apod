import 'package:apod/app/app_module.dart';
import 'package:apod/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
