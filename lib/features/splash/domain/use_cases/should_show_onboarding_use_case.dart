import 'package:apod/features/splash/domain/exceptions/splash_exceptions.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

/// The [ShouldShowOnboardingUseCase] class is a use case that returns
/// whether the onboarding should be shown.
class ShouldShowOnboardingUseCase {

  /// The default constructor of the [ShouldShowOnboardingUseCase] class.
  const ShouldShowOnboardingUseCase(this._onboardingRepository);

  final SplashRepository _onboardingRepository;


  /// Returns whether the onboarding should be shown.
  Future<Either<SplashExceptions, bool>> call() async {
    try {
      final result = await _onboardingRepository.shouldShowOnboarding();

      return Right(result);
    } catch (e) {
      return Left(GenericSplashException(e.toString()));
    }
  }
}
