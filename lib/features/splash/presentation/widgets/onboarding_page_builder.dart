import 'package:apod/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// [OnboardingPageBuilder] is used to build each page of the onboarding.
/// 
/// [upperText] The text that is displayed at the top of the paragraph.
/// [lowerText] The text that is displayed at the bottom of the paragraph.
/// [middleText] The text that is displayed in the middle of the paragraph.
/// [backgroundImageUrl] The URL of the background image.
/// 
class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({
    required this.upperText,
    required this.lowerText,
    required this.middleText,
    required this.backgroundImageUrl,
    super.key,
  });

  /// [upperText] The text that is displayed at the top of the paragraph.
  final String upperText;

  /// [lowerText] The text that is displayed at the bottom of the paragraph.
  final String lowerText;

  /// [middleText] The text that is displayed in the middle of the paragraph.
  final String middleText;

  /// [backgroundImageUrl] The URL of the background image.
  final String backgroundImageUrl;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 128),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _theme.colors.background.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  upperText,
                  style: _theme.typography.bodyBold.copyWith(
                    color: _theme.colors.primary,
                  ),
                ),
                Text(
                  middleText.toUpperCase(),
                  style: _theme.typography.nasaL.copyWith(
                    color: _theme.colors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  lowerText,
                  style: _theme.typography.body.copyWith(
                    color: _theme.colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
