import 'dart:developer';

import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/widgets/no_connection_modal.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/exceptions/home_exceptions.dart';
import 'package:apod/features/home/domain/use_cases/fetch_apods_use_case.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'apod_list_page_store.g.dart';

/// [ApodListPageStore] is a MobX [Store] that manages the state of the `ApodListPage`.
class ApodListPageStore = _ApodListPageStoreBase with _$ApodListPageStore;

abstract class _ApodListPageStoreBase with Store {
  _ApodListPageStoreBase(this._fetchApodsUseCase);

  final FetchApodsUseCase _fetchApodsUseCase;

  @observable
  DateTime initialDate = DateTime.now().subtract(const Duration(days: 10));

  @observable
  DateTime finalDate = DateTime.now();

  @observable
  ObservableList<ApodEntity> apodsList = <ApodEntity>[].asObservable();

  @observable
  StatesEnum pageState = StatesEnum.regular;

  final searchController = TextEditingController();

  @action
  Future<void> selectDateRange({required BuildContext context, required ScrollController scrollController}) async {
    final rangePicked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
      lastDate: DateTime.now(),
      saveText: 'Select',
      initialDateRange: DateTimeRange(start: initialDate, end: finalDate),
    );

    if (rangePicked != null) {
      initialDate = rangePicked.start;
      finalDate = rangePicked.end;

      if (context.mounted) {
        await fetchApods(context);
        await scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    }
  }

  @action
  Future<void> fetchApods(BuildContext context) async {
    pageState = StatesEnum.loading;

    final fetchApods = await _fetchApodsUseCase.call(dateRange: (initialDate: initialDate, finalDate: finalDate));

    fetchApods.fold(
      (l) => l.when(
        generic: (message) {
          log(message.toString());
          // log stacktrace on error tracer service...
        },
        noConnection: () => showModalBottomSheet<void>(
          context: context,
          builder: (context) => NoConnectionModal(
            retryCallback: () {
              Navigator.of(context).pop();
              this.fetchApods(context);
            },
          ),
        ),
      ),
      (r) => apodsList = r.asObservable(),
    );

    pageState = StatesEnum.regular;
  }
}
