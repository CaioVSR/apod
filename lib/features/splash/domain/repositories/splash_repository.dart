/// `OnboardingRepository` is an abstract class that serves as an interface for the onboarding repository.
/// It provides two main methods:
///
/// 1. `shouldShowOnboarding`: This method is expected to return a Future of a boolean value indicating whether the onboarding should be shown or not.
///
/// 2. `setShowOnboardingFalse`: This method is expected to set the onboarding status to false. It returns a Future of void.
///
/// The actual implementation of these methods would depend on the concrete class that implements this interface.
abstract class SplashRepository {
  /// Returns whether the onboarding should be shown.
  Future<bool> shouldShowOnboarding();

  /// Sets the onboarding to false.
  Future<void> setShowOnboardingFalse();
}
