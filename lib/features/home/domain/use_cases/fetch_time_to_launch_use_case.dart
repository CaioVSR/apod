import 'package:apod/features/home/domain/exceptions/home_exceptions.dart';
import 'package:apod/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

/// [FetchTimeToLaunchUseCase] is a use case for fetching the time to the next launch.
/// 
/// This class uses the [HomeRepository] to fetch the next launch date and calculates the time remaining until that date.
/// 
/// Example:
/// 
/// ```dart
/// final timeToLaunch = await useCase.execute();
/// print('Time to next launch: $timeToLaunch');
/// ```
/// 
class FetchTimeToLaunchUseCase {
  /// Creates a [FetchTimeToLaunchUseCase] with the given [HomeRepository].
  const FetchTimeToLaunchUseCase(this._homeRepository);
  
  final HomeRepository _homeRepository;

  /// Fetches the next launch date from the [HomeRepository] and returns either a `HomeExceptions` or a `DateTime`.
  Future<Either<HomeExceptions, DateTime>> call() async {
    try {
      final response = await _homeRepository.fetchNextLaunch();

      return Right(response);
    } catch (e) {
      return Left(GenericHomeException(e.toString()));
    }
  }
}
