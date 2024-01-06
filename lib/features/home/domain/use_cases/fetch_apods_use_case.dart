import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/exceptions/home_exceptions.dart';
import 'package:apod/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

/// This class is used to fetch the Astronomy Picture of the Day (APOD) from the NASA repository.
/// It takes a `HomeRepository` as a required parameter, which is used to fetch the APOD.
///
/// The class has a single method `call` which is used to fetch the APOD. The `call` method can take
/// a `date` or a `dateRange` as optional parameters. If a `date` is provided, it fetches the APOD for
/// that date. If a `dateRange` is provided, it fetches the APOD for that date range.
///
/// The `call` method returns a `Future` that resolves to an `Either` object. The `Either` object
/// contains a `HomeExceptions` object in case of an error, or a `List<ApodEntity>` in case of success.
///
/// Usage:
/// ```dart
/// final result = await useCase.call(date: DateTime.now());
/// ```
class FetchApodsUseCase {
  /// Creates a [FetchApodsUseCase] with the given [HomeRepository].
  FetchApodsUseCase(this._repository);

  final HomeRepository _repository;

  /// Fetches the APOD from the [HomeRepository] and returns either a `HomeExceptions` or a `List<ApodEntity>`.
  Future<Either<HomeExceptions, List<ApodEntity>>> call({
    DateTime? date,
    ({DateTime finalDate, DateTime initialDate})? dateRange,
  }) async {
    try {
      final response = await _repository.fetchApods(date: date, dateRange: dateRange);

      return Right(response);
    } on HomeExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericHomeException(e.toString()));
    }
  }
}
