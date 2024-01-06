import 'package:apod/features/splash/data/local_data_source/splash_local_data_source.dart';
import 'package:apod/features/splash/domain/repositories/splash_repository.dart';

/// The [SplashRepositoryImpl] class is a implementation of the
/// [OnboardingRepository] abstract class.
///
/// Should be declared on the `onboarding_module.dart` file.
/// Example:
/// ```dart
/// class SplashModule extends Module {
///
///  @override
/// void binds(Injector i) {
/// i.addLazySingleton<SplashRepository>(SplashRepositoryImpl.new);
/// }
/// ```
class SplashRepositoryImpl implements SplashRepository {
  /// The default constructor of the [SplashRepositoryImpl] class.
  const SplashRepositoryImpl(this.localDataSource);

  /// The [OnboardingLocalDataSource] instance.
  final SplashLocalDataSource localDataSource;

  static const _shouldShowOnboardingKey = 'shouldShowOnboarding';

  @override
  Future<bool> shouldShowOnboarding() async {
    final fetchData = await localDataSource.fetchLocalBool(
      _shouldShowOnboardingKey,
    );

    return fetchData ?? true;
  }

  @override
  Future<void> setShowOnboardingFalse() async {
    await localDataSource.saveLocalBool(
      key: _shouldShowOnboardingKey,
      value: false,
    );
  }
}
