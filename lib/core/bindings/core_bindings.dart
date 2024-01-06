import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The `CoreBindings` is a class that contains the main bindings of the
/// application.
///
/// This file should be imported in every module of the application
///
/// Example:
///
/// ```dart
/// import 'package:flutter_modular/flutter_modular.dart';
///
/// class MyAwesomeModule extends Module {
///
/// @override
///   @override
///  List<Module> get imports => [
///        CoreBindings(),
///      ];
/// }
/// ```
class CoreBindings extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<Dio>(() => Dio())
      ..addLazySingleton<Future<SharedPreferences>>(() => SharedPreferences.getInstance());
  }
}
