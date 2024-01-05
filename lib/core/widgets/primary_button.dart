import 'package:apod/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// The [PrimaryButton] is a class that contains the primary button of the
/// application.
class PrimaryButton extends StatelessWidget {
  /// The default constructor of the [PrimaryButton] class.
  const PrimaryButton({
    required this.onPressed,
    this.child,
    this.label,
    super.key,
  }) : assert(child != null || label != null, 'Either child or label must be provided'),
        assert(child == null || label == null, 'Either child or label must be provided');

  /// [child] The child of the button.
  final Widget? child;

  /// [label] The label of the button.
  final String? label;

  /// [onPressed] The callback that is called when the button is pressed.
  final VoidCallback onPressed;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 32),
        ),
        foregroundColor: MaterialStatePropertyAll(_theme.colors.background),
        backgroundColor: MaterialStatePropertyAll(_theme.colors.primary),
        textStyle: MaterialStatePropertyAll(_theme.typography.button),
      ),
      child: child ?? Text(label!),
    );
  }
}
