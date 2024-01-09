// FILEPATH: /Users/caioreis/dev/personal/apod/test/features/splash/domain/repositories/splash_repository_test.dart
import 'package:apod/features/splash/data/local_data_source/splash_local_data_source.dart';
import 'package:apod/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements SplashLocalDataSource {}

void main() {
  final mockDataSource = MockDataSource();
  final repository = SplashRepositoryImpl(mockDataSource);

  group('SplashRepository', () {
    test('should return true when onboarding should be shown', () async {
      when(() => mockDataSource.fetchLocalBool(any())).thenAnswer((_) => Future.value(true));

      final result = await repository.shouldShowOnboarding();

      expect(result, true);
      verify(() => mockDataSource.fetchLocalBool(any())).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should set onboarding to false', () async {
      when(() => mockDataSource.saveLocalBool(key: any(named: 'key'), value: any(named: 'value')))
          .thenAnswer((_) async {});

      await repository.setShowOnboardingFalse();

      verify(() => mockDataSource.saveLocalBool(key: any(named: 'key'), value: any(named: 'value'))).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
