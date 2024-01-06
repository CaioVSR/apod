import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/use_cases/should_show_onboarding_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_page_store.g.dart';

/// The [SplashPageStore] is a class that contains the state and holds
/// de business logic of the `SplashPage`.
///
/// Should be declared on the `onboarding_module.dart` file.
/// Example:
/// ```dart
/// class OnboardingModule extends Module {
///
/// @override
/// void binds(Injector i) {
/// i.addLazySingleton<SplashPageStore>(SplashPageStore.new);
/// }
/// ```
class SplashPageStore = _SplashPageStoreBase with _$SplashPageStore;

abstract class _SplashPageStoreBase with Store {
  const _SplashPageStoreBase(this._shouldShowOnboardingUseCase);

  final ShouldShowOnboardingUseCase _shouldShowOnboardingUseCase;

  Future<void> init() async {
    final delayer = Future<void>.delayed(const Duration(seconds: 3));
    final shouldShowOnboarding = await _shouldShowOnboardingUseCase();

    await delayer;

    shouldShowOnboarding.fold(
      (l) => l.when(
        generic: (message) {
          Modular.to.navigate('/onboarding');
        },
      ),
      (r) {
        if (r) {
          Modular.to.navigate('/onboarding');
        } else {
          Modular.to.navigate('/home');
        }
      },
    );
  }
}
