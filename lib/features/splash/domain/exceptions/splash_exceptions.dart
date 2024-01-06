/// [SplashExceptions] are thrown when an error occurs in the onboarding feature.
sealed class SplashExceptions implements Exception {
  const SplashExceptions(this.message);

  /// [message] is the error message.
  final String? message;
}

/// [GenericSplashException] is thrown when an error occurs in the splash feature.
class GenericSplashException extends SplashExceptions {
  /// The default constructor of the [GenericSplashException] class.
  /// Example:
  /// ```dart
  /// throw GenericSplashException('An error occurred while fetching the data.');
  /// ```
  const GenericSplashException(super.message);
}

/// The [when] extension helps to deal with the returned exception.
extension When on SplashExceptions {
  /// The [when] method is used to handle the exceptions.
  /// Example:
  /// ```dart
  /// try {
  ///  await splashRepository.shouldShowOnboarding();
  /// } on SplashExceptions catch (e) {
  ///   e.when(
  ///     genericSplashException: () {
  ///       // handle the error
  ///     },
  ///   );
  /// }
  /// ```
  T when<T>({
    required T Function(String?) generic,
  }) {
    if (this is GenericSplashException) {
      return generic.call(message);
    }

    return generic.call(message);
  }
}
