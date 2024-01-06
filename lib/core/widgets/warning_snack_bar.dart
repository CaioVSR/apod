import 'package:apod/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// The [WarningSnackBar] is a class that represents a warning snack bar.
///
/// Example:
/// ```dart
/// ScaffoldMessenger.of(context).showSnackBar(
///  const WarningSnackBar(label: 'Something went wrong, please try again later.'),
/// );
class WarningSnackBar extends SnackBar {
  /// The default constructor of the [WarningSnackBar] class.
  WarningSnackBar({
    required this.text,
    super.key,
  }) : super(
          backgroundColor: AppTheme.instance.colors.warning,
          content: Text(
            text,
            style: AppTheme.instance.typography.bodyBold.copyWith(
              color: AppTheme.instance.colors.white,
            ),
          ),
        );

  /// The label of the snack bar.
  final String text;
}
