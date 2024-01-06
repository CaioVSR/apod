import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/features/home/presentation/stores/home_page_store.dart';
import 'package:apod/features/home/presentation/widgets/about_apod.dart';
import 'package:apod/features/home/presentation/widgets/countdown_timer.dart';
import 'package:apod/features/home/presentation/widgets/image_of_the_day_carrousel.dart';
import 'package:apod/features/home/presentation/widgets/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

/// The [HomePage] is a class that contains the home page of the app.
class HomePage extends StatefulWidget {
  /// The [HomePage] constructor.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomePageStore>();
  final theme = AppTheme.instance;
  final dateFormatter = DateFormat('MMMM dd');

  @override
  void initState() {
    super.initState();
    store.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 64),
              Observer(builder: (_) => Today(state: store.pageState)),
              const SizedBox(height: 16),
              Observer(builder: (_) => CountdownTimer(duration: store.durationLeft, state: store.pageState)),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => ImageOfTheDayCarrousel(
                  apodsList: store.apodsList,
                  state: store.pageState,
                  onSeeAllPressed: store.navigateToApodPage,
                  onCardTap: store.navigateToApodDetailPage,
                ),
              ),
              const SizedBox(height: 64),
              Observer(builder: (_) => AboutApod(state: store.pageState)),
            ],
          ),
        ),
      ),
    );
  }
}
