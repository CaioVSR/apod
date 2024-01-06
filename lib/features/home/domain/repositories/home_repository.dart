import 'package:apod/features/home/domain/entities/apod_entity.dart';

/// [HomeRepository] is an abstract class that defines the contract for all HomeRepository implementations.
/// 
/// It provides methods to fetch the next launch date and a list of ApodEntities.
/// 
/// Implementations of this class should define how these methods will fetch the data (e.g., from a remote API, local database, etc.).
abstract class HomeRepository {
  /// Fetches the next launch date from the remote data source.
  /// 
  /// Throws an [Exception] if the status code is not 200 or the data is null.
  Future<DateTime> fetchNextLaunch();

  /// Fetches a list of [ApodEntity] from the remote data source.
  /// 
  /// You can provide either a specific [date] or a date range record [(finalDate, initialDate)] to fetch the ApodEntities.
  /// 
  /// Throws an [Exception] if the status code is not 200 or the data is null.
  Future<List<ApodEntity>> fetchApods({
    DateTime? date,
    ({DateTime initialDate, DateTime finalDate})? dateRange,
  });
}
