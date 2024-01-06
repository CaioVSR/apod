import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/primary_button.dart';
import 'package:apod/features/splash/presentation/stores/onboarding_page_store.dart';
import 'package:apod/features/splash/presentation/widgets/onboarding_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// The [OnboardingPage] is the second page of the onboarding feature.
class OnboardingPage extends StatefulWidget {
  /// The default constructor of the [OnboardingPage] class.
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final store = Modular.get<OnboardingPageStore>();
  final onboardingPagesBuilders = [
    OnboardingPageBuilder(
      upperText: 'Read all the',
      middleText: 'Latest news & featured stories',
      lowerText: 'New news and featured stories are added every day. You can read them all here.',
      backgroundImageUrl: AppTheme.instance.imagesUrls.astronautFloating,
    ),
    OnboardingPageBuilder(
      upperText: 'Learn more about the',
      middleText: 'Solar system & beyond',
      lowerText: 'view over 19,000 images and watch thousands of on-demand NASA videos',
      backgroundImageUrl: AppTheme.instance.imagesUrls.bloodMoon,
    ),
    OnboardingPageBuilder(
      upperText: 'Explore all the',
      middleText: 'Featured content',
      lowerText: 'Learn about the universe with Augmented Reality and 3D models',
      backgroundImageUrl: AppTheme.instance.imagesUrls.earthAtNight,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: onboardingPagesBuilders.length,
                itemBuilder: (context, index) {
                  return onboardingPagesBuilders[index];
                },
                onPageChanged: store.setCurrentPage,
              ),
              if (store.showHomePageButton)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: PrimaryButton(
                      onPressed: () {
                        store.toHomePage(context);
                      },
                      label: 'Begin your journey',
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
