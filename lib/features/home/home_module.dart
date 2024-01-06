import 'package:apod/core/bindings/core_bindings.dart';
import 'package:apod/features/home/data/remote_data_source/check_network_connection_data_source.dart';
import 'package:apod/features/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:apod/features/home/data/repositories/home_repository_impl.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/repositories/home_repository.dart';
import 'package:apod/features/home/domain/use_cases/fetch_apods_use_case.dart';
import 'package:apod/features/home/domain/use_cases/fetch_time_to_launch_use_case.dart';
import 'package:apod/features/home/presentation/pages/apod_detail_page.dart';
import 'package:apod/features/home/presentation/pages/apod_list_page.dart';
import 'package:apod/features/home/presentation/pages/home_page.dart';
import 'package:apod/features/home/presentation/stores/apod_list_page_store.dart';
import 'package:apod/features/home/presentation/stores/home_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// The [HomeModule] is a class that contains dependencies injections
/// and the routes of the onboarding feature.
class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreBindings(),
      ];

  @override
  void binds(Injector i) {
    i

      /// External injections
      ..addLazySingleton<InternetConnection>(InternetConnection.new)

      /// Data sources injections
      ..addLazySingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl.new)
      ..addLazySingleton<CheckNetworkConnectionDataSource>(CheckNetworkConnectionDataSourceImpl.new)

      /// Repositories injections
      ..addLazySingleton<HomeRepository>(HomeRepositoryImpl.new)

      /// Use cases injections
      ..addLazySingleton<FetchTimeToLaunchUseCase>(FetchTimeToLaunchUseCase.new)
      ..addLazySingleton<FetchApodsUseCase>(FetchApodsUseCase.new)

      /// Stores injections
      ..addLazySingleton<HomePageStore>(HomePageStore.new)
      ..addLazySingleton<ApodListPageStore>(ApodListPageStore.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child('/', child: (context) => const HomePage())
      ..child(
        '/apod_detail',
        child: (context) => ApodDetailPage(
          apod: r.args.data as ApodEntity,
        ),
      )
      ..child('/apod_list', child: (context) => const ApodListPage());
  }
}
