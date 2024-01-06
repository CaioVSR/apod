import 'dart:developer';

import 'package:apod/core/widgets/warning_snack_bar.dart';
import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/use_cases/set_show_onboarding_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_page_store.g.dart';

/// The [OnboardingPageStore] is a class that contains the state of
/// the `OnboardingPage`.
///
/// Should be declared on the `onboarding_module.dart` file.
/// Example:
/// ```dart
/// class OnboardingModule extends Module {
///
/// @override
/// void binds(Injector i) {
/// i.addLazySingleton<OnboardingPageStore>(OnboardingPageStore.new);
/// }
/// ```
class OnboardingPageStore = _OnboardingPageStoreBase with _$OnboardingPageStore;

abstract class _OnboardingPageStoreBase with Store {
  _OnboardingPageStoreBase(this._setShowOnboardingUseCase);

  final SetShowOnboardingUseCase _setShowOnboardingUseCase;

  @observable
  int _currentPage = 0;

  @action
  // ignore: use_setters_to_change_properties
  void setCurrentPage(int value) {
    _currentPage = value;
  }

  @computed
  bool get showHomePageButton => _currentPage == 2;

  Future<void> toHomePage(BuildContext context) async {
    final setShowOnboarding = await _setShowOnboardingUseCase();

    setShowOnboarding.fold(
      (l) => l.when(
        generic: (message) {
          if (message != null) {
            log(message, name: 'OnboardingPageStore.toHomepage');
          }

          ScaffoldMessenger.of(context).showSnackBar(
            WarningSnackBar(
              text: 'Houston, we have a problem!\nPlease, try again.',
            ),
          );
        },
      ),
      (r) {
        Modular.to.navigate('/home');
      },
    );
  }
}
