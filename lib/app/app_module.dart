import 'package:apod/core/bindings/core_bindings.dart';
import 'package:apod/features/home/home_module.dart';
import 'package:apod/features/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  final _transition = TransitionType.rightToLeftWithFade;

  @override
  void binds(Injector i) {
    CoreBindings();
  }

  @override
  void routes(RouteManager r) {
    r
      ..module('/', module: SplashModule(), transition: _transition)
      ..module('/home', module: HomeModule(), transition: _transition);
  }
}
