// FILEPATH: /Users/caioreis/dev/personal/apod/test/features/splash/domain/use_cases/should_show_onboarding_use_case_test.dart
import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';
import 'package:apod/features/splash/domain/use_cases/should_show_onboarding_use_case.dart';
import 'package:apod/features/splash/splash_module.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSplashRepository extends Mock implements SplashRepository {}

void main() {
  late SplashRepository repository;
  late ShouldShowOnboardingUseCase useCase;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    Modular.bindModule(SplashModule());
    Modular.replaceInstance<SplashRepository>(MockSplashRepository());
    repository = Modular.get<SplashRepository>();
    useCase = Modular.get<ShouldShowOnboardingUseCase>();
  });

  group('ShouldShowOnboardingUseCase', () {
    test('should get the correct instance injection', () {
      expect(repository, isA<SplashRepository>());
      expect(useCase, isA<ShouldShowOnboardingUseCase>());
    });

    test('should return true when onboarding should be shown', () async {
      when(repository.shouldShowOnboarding).thenAnswer((_) async => true);

      final result = await useCase.call();

      expect(result, const Right(true));
      verify(repository.shouldShowOnboarding).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return false when onboarding should not be shown', () async {
      when(repository.shouldShowOnboarding).thenAnswer((_) async => false);

      final result = await useCase.call();

      expect(result, const Right(false));
      verify(repository.shouldShowOnboarding).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return GenericSplashException when an error occurs', () async {
      when(repository.shouldShowOnboarding).thenThrow(Exception('Unexpected error'));

      final result = await useCase.call();

      result.fold(
        (l) => expect(l, isA<GenericSplashException>()),
        (r) {},
      );
      verify(repository.shouldShowOnboarding).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
