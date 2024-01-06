import 'dart:async';

import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/widgets/no_connection_modal.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/exceptions/home_exceptions.dart';
import 'package:apod/features/home/domain/use_cases/fetch_apods_use_case.dart';
import 'package:apod/features/home/domain/use_cases/fetch_time_to_launch_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

/// [HomePageStore] is a MobX [Store] that manages the state of the `HomePage`.
class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  _HomePageStoreBase(
    this._fetchTimeToLaunchUseCase,
    this._fetchApodsUseCase,
  );

  final FetchTimeToLaunchUseCase _fetchTimeToLaunchUseCase;
  final FetchApodsUseCase _fetchApodsUseCase;

  @observable
  ObservableList<ApodEntity> apodsList = <ApodEntity>[].asObservable();

  @observable
  Duration durationLeft = Duration.zero;

  @observable
  StatesEnum pageState = StatesEnum.regular;

  Future<void> init(BuildContext context) async {
    await Future.wait([
      _fetchTimeToLaunch(),
      _fetchApods(context),
    ]);
  }

  @action
  void _startDecrementingSeconds() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (durationLeft.inSeconds == 0) {
        timer.cancel();
      } else {
        durationLeft = durationLeft - const Duration(seconds: -1);
      }
    });
  }

  @action
  Future<void> _fetchTimeToLaunch() async {
    final response = await _fetchTimeToLaunchUseCase();

    response.fold(
      (l) => l.when<void>(
        noConnection: () {},
        generic: (message) {},
      ),
      (r) {
        durationLeft = DateTime.now().toUtc().difference(r);
        _startDecrementingSeconds();
      },
    );
  }

  @action
  Future<void> _fetchApods(BuildContext context) async {
    pageState = StatesEnum.loading;

    final today = DateTime.now();
    final response = await _fetchApodsUseCase(
      dateRange: (initialDate: today.subtract(const Duration(days: 2)), finalDate: today),
    );

    response.fold(
      (l) => l.when<void>(
        noConnection: () => showModalBottomSheet<void>(
          isDismissible: false,
          context: context,
          builder: (context) => NoConnectionModal(
            retryCallback: () {
              Navigator.pop(context);
              init(context);
            },
          ),
        ),
        generic: (message) {},
      ),
      (r) {
        apodsList.addAll(r);
        pageState = StatesEnum.regular;
      },
    );
  }

  Future<void> navigateToApodPage() async {
    await Modular.to.pushNamed('/home/apod_list', arguments: apodsList);
  }

  Future<void> navigateToApodDetailPage(ApodEntity apod) async {
    await Modular.to.pushNamed('/home/apod_detail', arguments: apod);
  }
}
