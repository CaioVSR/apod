/// [HomeExceptions] are thrown when an error occurs in the
/// onboarding feature.
sealed class HomeExceptions implements Exception {
  const HomeExceptions(this.message);

  /// The error message.
  final String? message;
}

/// [NoConnectionHomeException] is thrown when there is no internet connection.
/// Example:
/// ```dart
/// throw NoConnectionHomeException();
/// ```
class NoConnectionHomeException extends HomeExceptions {
  /// The default constructor of the [NoConnectionHomeException] class.
  const NoConnectionHomeException() : super(null);
}

/// [GenericHomeException] is thrown when an error occurs in the
/// onboarding feature.
class GenericHomeException extends HomeExceptions {
  /// The default constructor of the [GenericHomeException] class.
  /// Example:
  /// ```dart
  /// throw GenericOnboardingException('An error occurred while fetching the data.');
  /// ```
  const GenericHomeException(super.message);
}

/// The [when] extension helps to deal with the returned exception.
extension When on HomeExceptions {
  /// The [when] method is used to handle the exceptions.
  /// Example:
  /// ```dart
  /// try {
  ///  await onboardingRepository.shouldShowOnboarding();
  /// } on OnboardingExceptions catch (e) {
  ///   e.when(
  ///     genericOnboardingException: () {
  ///       // handle the error
  ///     },
  ///   );
  /// }
  /// ```
  T when<T>({
    required T Function(String?) generic,
    required T Function() noConnection,
  }) {
    if (this is NoConnectionHomeException) {
      return noConnection.call();
    }

    if (this is GenericHomeException) {
      return generic.call(message);
    }

    return generic.call(message);
  }
}
