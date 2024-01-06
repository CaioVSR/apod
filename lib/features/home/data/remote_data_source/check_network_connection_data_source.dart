import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class CheckNetworkConnectionDataSource {
  /// The [hasInternetConnection] method checks if the device is connected to the internet.
  Future<bool> hasInternetConnection();
}

/// The [CheckNetworkConnectionDataSourceImpl] is a class that implements the
/// [CheckNetworkConnectionDataSource] abstract class.
/// Should be declared on the `home_module.dart` file.
/// Example:
/// ```dart
/// class HomeModule extends Module {
/// @override
/// void binds(Injector i) {
///  i.addLazySingleton<CheckNetworkConnectionDataSource>(CheckNetworkConnectionDataSource.new);
/// }
///
/// ```
///
///
class CheckNetworkConnectionDataSourceImpl implements CheckNetworkConnectionDataSource {
  /// The default constructor of the [CheckNetworkConnectionDataSourceImpl] class.
  /// Example:
  /// ```dart
  /// const CheckNetworkConnectionDataSourceImpl(this.internetConnection);
  /// ```
  const CheckNetworkConnectionDataSourceImpl(this._internetConnection);

  /// [internetConnection] The instance of the [InternetConnection] class.
  final InternetConnection _internetConnection;

  @override
  Future<bool> hasInternetConnection() => _internetConnection.hasInternetAccess;
}
