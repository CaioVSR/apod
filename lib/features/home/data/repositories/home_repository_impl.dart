import 'package:apod/core/extensions/date_extension.dart';
import 'package:apod/features/home/data/models/apod_response_model.dart';
import 'package:apod/features/home/data/remote_data_source/check_network_connection_data_source.dart';
import 'package:apod/features/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/exceptions/home_exceptions.dart';
import 'package:apod/features/home/domain/repositories/home_repository.dart';

/// [HomeRepositoryImpl] is an implementation of [HomeRepository].
/// It provides methods to fetch the next launch date and a list of ApodEntities.
///
/// This class requires a [HomeRemoteDataSource] to fetch data from the remote source.
class HomeRepositoryImpl implements HomeRepository {
  /// Creates a [HomeRepositoryImpl] with the given [HomeRemoteDataSource].
  const HomeRepositoryImpl(this._dataSource, this._checkNetworkConnectionDataSource);

  final HomeRemoteDataSource _dataSource;
  final CheckNetworkConnectionDataSource _checkNetworkConnectionDataSource;

  @override
  Future<DateTime> fetchNextLaunch() async {
    if (!await _checkNetworkConnectionDataSource.hasInternetConnection()) {
      throw const NoConnectionHomeException();
    }

    final response = await _dataSource.fetchNextLaunch();

    if (response.statusCode != 200 || response.data == null) {
      throw Exception();
    }

    return DateTime.parse(
      ((response.data!['result'] as List)[0] as Map<String, dynamic>)['t0'] as String,
    );
  }

  @override
  Future<List<ApodEntity>> fetchApods({
    DateTime? date,
    ({DateTime finalDate, DateTime initialDate})? dateRange,
  }) async {
    if (!await _checkNetworkConnectionDataSource.hasInternetConnection()) {
      throw const NoConnectionHomeException();
    }

    

    final response = await _dataSource.fetchPictures(
      date: date?.formattedApiDate,
      dateRange: dateRange != null
          ? (
              initialDate: dateRange.initialDate.formattedApiDate,
              finalDate: dateRange.finalDate.formattedApiDate,
            )
          : null,
    );

    if (response.statusCode != 200 || response.data == null) {
      throw Exception();
    }

    final apodsList =
        List<Map<String, dynamic>>.from(response.data!).map((e) => ApodResponseModel.fromJson(e).toEntity()).toList();

    return apodsList.reversed.toList();
  }
}
