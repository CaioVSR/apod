import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

/// The [SetShowOnboardingUseCase] class is a use case that sets
/// the show onboarding value to false.
///
/// Should be declared on the `onboarding_module.dart` file.
/// Example:
/// ```dart
/// class OnboardingModule extends Module {
/// @override
/// void binds(Injector i) {
/// i.addLazySingleton<SetShowOnboardingUseCase>(SetShowOnboardingUseCase.new);
/// }
/// ```
class SetShowOnboardingUseCase {
  /// The default constructor of the [SetShowOnboardingUseCase] class.
  const SetShowOnboardingUseCase(this._splashRepository);

  final SplashRepository _splashRepository;

  /// Sets the show onboarding value to false.
  Future<Either<SplashExceptions, void>> call() async {
    try {
      await _splashRepository.setShowOnboardingFalse();

      return const Right(null);
    } catch (e) {
      return Left(GenericSplashException(e.toString()));
    }
  }
}
