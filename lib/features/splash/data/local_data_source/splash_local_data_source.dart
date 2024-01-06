import 'package:shared_preferences/shared_preferences.dart';

/// The [SplashLocalDataSource] is a class that contains the methods
/// to fetch and save data from the local storage.
abstract class SplashLocalDataSource {
  /// Fetches a boolean value from the local storage.
  Future<bool?> fetchLocalBool(String key);

  /// Saves a boolean value to the local storage.
  Future<void> saveLocalBool({required String key, required bool value});
}

/// The [SplashLocalDataSourceImpl] is a class that implements the
/// [SplashLocalDataSource] abstract class.
/// Should be declared on the `splash_module.dart` file.
/// Example:
/// ```dart
/// class SplashModule extends Module {
///  @override
/// void binds(Injector i) {
///  i.addLazySingleton<SplashLocalDataSource>(SplashLocalDataSourceImpl.new);
/// }
/// ```
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  /// The default constructor of the [SplashLocalDataSourceImpl] class.
  const SplashLocalDataSourceImpl(this._sharedPreferences);

  /// The [SharedPreferences] instance.
  final Future<SharedPreferences> _sharedPreferences;

  @override
  Future<bool?> fetchLocalBool(String key) async {
    final localCache = await _sharedPreferences;

    return localCache.getBool(key);
  }

  @override
  Future<void> saveLocalBool({required bool value, required String key}) async {
    final localCache = await _sharedPreferences;

    await localCache.setBool(key, value);
  }
}
