import 'package:apod/core/bindings/core_bindings.dart';
import 'package:apod/features/splash/data/local_data_source/splash_local_data_source.dart';
import 'package:apod/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';
import 'package:apod/features/splash/domain/use_cases/set_show_onboarding_use_case.dart';
import 'package:apod/features/splash/domain/use_cases/should_show_onboarding_use_case.dart';
import 'package:apod/features/splash/presentation/pages/onboarding_page.dart';
import 'package:apod/features/splash/presentation/pages/splash_page.dart';
import 'package:apod/features/splash/presentation/stores/onboarding_page_store.dart';
import 'package:apod/features/splash/presentation/stores/splash_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CoreBindings(),
      ];

  @override
  void binds(Injector i) {
    i
      // DATA SOURCES
      ..addLazySingleton<SplashLocalDataSource>(SplashLocalDataSourceImpl.new)

      // REPOSITORIES
      ..addLazySingleton<SplashRepository>(SplashRepositoryImpl.new)

      // USE CASES
      ..addLazySingleton<SetShowOnboardingUseCase>(SetShowOnboardingUseCase.new)
      ..addLazySingleton<ShouldShowOnboardingUseCase>(ShouldShowOnboardingUseCase.new)

      // STORES
      ..addLazySingleton<SplashPageStore>(SplashPageStore.new)
      ..addLazySingleton<OnboardingPageStore>(OnboardingPageStore.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child('/', child: (context) => const SplashPage())
      ..child('/onboarding', child: (context) => const OnboardingPage());
  }
}
