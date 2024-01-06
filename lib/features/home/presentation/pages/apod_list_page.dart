import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/extensions/date_extension.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/shimmed_box.dart';
import 'package:apod/features/home/presentation/stores/apod_list_page_store.dart';
import 'package:apod/features/home/presentation/widgets/image_of_the_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [ApodListPage] is a stateful widget that displays a list of APOD (Astronomy Picture of the Day) with the given range
/// or single date.
///
/// This page fetches the APOD data and displays it in a list format.
/// Each item in the list represents a single APOD.
class ApodListPage extends StatefulWidget {
  /// Creates a [ApodListPage].
  const ApodListPage({super.key});

  @override
  State<ApodListPage> createState() => _ApodListPageState();
}

class _ApodListPageState extends State<ApodListPage> {
  final theme = AppTheme.instance;
  final store = Modular.get<ApodListPageStore>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.fetchApods(context);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous APODs'),
        // titleTextStyle: theme.typography.body,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Observer(
            builder: (_) {
              if (store.pageState == StatesEnum.loading) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...List.generate(10, (index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: ShimmedBox(
                          height: 200,
                          borderRadius: 16,
                        ),
                      );
                    }),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${store.initialDate.formattedShortDate} - ${store.finalDate.formattedShortDate}',
                    style: theme.typography.bodyS,
                    textAlign: TextAlign.end,
                  ),
                  if (store.apodsList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: store.apodsList.length,
                      itemBuilder: (_, index) {
                        final apod = store.apodsList[index];

                        return ImageOfTheDayCard(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          onCardTap: () {
                            Modular.to.pushNamed(
                              '/home/apod_detail',
                              arguments: apod,
                            );
                          },
                          apod: apod,
                        );
                      },
                    ),
                  const SizedBox(height: 128),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.primary,
        onPressed: () => store.selectDateRange(
          context: context,
          scrollController: scrollController,
        ),
        child: Icon(
          Icons.date_range_rounded,
          color: theme.colors.background,
        ),
      ),
    );
  }
}
