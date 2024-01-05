import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

/// `NoConnectionModal` is a stateless widget that displays a modal with a message
/// indicating that there is no internet connection.
///
/// It includes an image, a title, a message, and a button to retry the connection.
/// The image, title, and message are centered in the modal.
///
/// The modal's appearance is defined by the current theme, which is accessed through the [_theme] getter.
///
/// The [retryCallback] is a function that is called when the retry button is pressed.
/// This function should attempt to reestablish the internet connection.
class NoConnectionModal extends StatelessWidget {
  /// Creates a `NoConnectionModal` widget.
  ///
  /// The [retryCallback] must not be null.
  const NoConnectionModal({
    required this.retryCallback,
    super.key,
  });

  /// The function to call when the retry button is pressed.
  final VoidCallback retryCallback;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _theme.colors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 64),
          Image.asset(
            _theme.imagesUrls.noConnection,
            height: 128,
          ),
          const SizedBox(height: 24),
          Text(
            'Houston, we have a problem!',
            style: _theme.typography.bodyBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Please check your internet connection and try again later.',
            textAlign: TextAlign.center,
            style: _theme.typography.body,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            onPressed: retryCallback,
            label: 'Try again',
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
