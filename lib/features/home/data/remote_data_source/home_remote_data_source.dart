import 'package:dio/dio.dart';

/// The [HomeRemoteDataSource] is a class that contains the methods
/// to fetch data from the remote data source.
abstract class HomeRemoteDataSource {
  /// Fetches the data from the next launch.
  /// Example:
  /// ```dart
  /// final response = await homeRemoteDataSource.fetchNextLaunch();
  /// ```
  Future<Response<Map<String, dynamic>>> fetchNextLaunch();

  /// Fetches the data from the pictures.
  /// Example:
  /// ```dart
  /// final response = await homeRemoteDataSource.fetchPictures();
  /// ```
  Future<Response<List<dynamic>>> fetchPictures({
    String? date,
    ({String initialDate, String finalDate})? dateRange,
  });
}

/// The [HomeRemoteDataSourceImpl] is a class that implements the
/// [HomeRemoteDataSource] abstract class.
/// Should be declared on the `home_module.dart` file.
/// Example:
/// ```dart
/// class HomeModule extends Module {
/// @override
/// void binds(Injector i) {
///   i.addLazySingleton<HomeRemoteDataSource>(HomeRemoteDataSource.new);
/// }
/// ```
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  /// The default constructor of the [HomeRemoteDataSourceImpl] class.
  const HomeRemoteDataSourceImpl(this._client);
  final Dio _client;

  @override
  Future<Response<Map<String, dynamic>>> fetchNextLaunch() async {
    _client.options.baseUrl = const String.fromEnvironment('BASE_LAUNCH_URL');

    return _client.get<Map<String, dynamic>>('/next');
  }

  @override
  Future<Response<List<dynamic>>> fetchPictures({
    String? date,
    ({String initialDate, String finalDate})? dateRange,
  }) {
    assert(
      date != null || dateRange != null,
      'Date or date range must be provided',
    );

    _client.options.baseUrl = const String.fromEnvironment('NASA_APOD_BASE_URL');

    final queryParams = {
      'api_key': const String.fromEnvironment('NASA_API_KEY'),
    };

    if (date != null) {
      queryParams.addAll({'date': date});
    } else {
      queryParams.addAll({
        'start_date': dateRange!.initialDate,
        'end_date': dateRange.finalDate,
      });
    }

    return _client.get<List<dynamic>>(
      '/',
      queryParameters: queryParams,
    );
  }
}
