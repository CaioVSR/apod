import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/features/splash/presentation/stores/splash_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// The [SplashPage] is the first page of the onboarding feature.
class SplashPage extends StatefulWidget {
  /// The default constructor of the [SplashPage] class.
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final theme = AppTheme.instance;
  final store = Modular.get<SplashPageStore>();

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(72),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theme.imagesUrls.planetBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(theme.imagesUrls.logo),
        ),
      ),
    );
  }
}
