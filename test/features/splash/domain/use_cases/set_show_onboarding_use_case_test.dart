import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';
import 'package:apod/features/splash/domain/use_cases/set_show_onboarding_use_case.dart';
import 'package:apod/features/splash/splash_module.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSplashRepository extends Mock implements SplashRepository {}

void main() {
  late SplashRepository repository;
  late SetShowOnboardingUseCase useCase;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    Modular.bindModule(SplashModule());
    Modular.replaceInstance<SplashRepository>(MockSplashRepository());
    repository = Modular.get<SplashRepository>();
    useCase = Modular.get<SetShowOnboardingUseCase>();
  });

  group('SetShowOnboardingUseCase', () {
    test('should get the correct instance injection', () {
      expect(repository, isA<SplashRepository>());
      expect(useCase, isA<SetShowOnboardingUseCase>());
    });

    test('should set show onboarding to false', () async {
      when(repository.setShowOnboardingFalse).thenAnswer((_) async {});

      final shouldShowOnboarding = await useCase.call();

      verify(repository.setShowOnboardingFalse).called(1);
      verifyNoMoreInteractions(repository);
      expect(shouldShowOnboarding, const Right(null));
    });

    test('should return GenericSplashException when an error occurs', () async {
      when(repository.setShowOnboardingFalse).thenThrow('Some error description');

      final result = await useCase.call();

      result.fold(
        (l) {
          expect(l, isA<GenericSplashException>());
          expect(l.message, 'Some error description');
        },
        (r) {},
      );

      verify(repository.setShowOnboardingFalse).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
