import 'package:flutter/material.dart';

/// `AppTypography` is an immutable class that provides
/// static and instance getters to retrieve various text styles.
///
/// This class uses the Dart getter syntax to provide a clean,
/// easy-to-use interface for accessing these styles.
///
/// Example usage:
/// ```dart
/// const typography = AppTypography();
/// print(typography.nasaL); // Outputs: TextStyle(fontSize: 24, fontFamily: 'Nasalization', fontWeight: FontWeight.w800)
/// ```
@immutable
class AppTypography {
  const AppTypography();

  /// Returns a `TextStyle` with a font size of 24,
  /// using the 'Nasalization' font family and a font weight of 800.
  TextStyle get nasaL => const TextStyle(
        fontSize: 24,
        fontFamily: 'Nasalization',
        fontWeight: FontWeight.w800,
      );

  /// Returns a `TextStyle` with a font size of 32,
  /// using the 'Nasalization' font family and a font weight of 600.
  TextStyle get nasaXL => const TextStyle(
        fontSize: 32,
        fontFamily: 'Nasalization',
        fontWeight: FontWeight.w600,
      );

  /// Returns a `TextStyle` with a font size of 14,
  /// using the 'Poppins' font family and a font weight of 400.
  TextStyle get body => const TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      );

  /// Returns a `TextStyle` with a font size of 18,
  /// using the 'Poppins' font family and a font weight of 500.
  TextStyle get bodyBold => const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      );

  /// Returns a `TextStyle` with a font size of 12,
  /// using the 'Poppins' font family and a font weight of 300.
  TextStyle get bodyS => const TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
      );

  /// Returns a `TextStyle` for buttons with a font size of 14,
  /// using the 'Poppins' font family and a font weight of 400.
  TextStyle get button => const TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      );

  /// Returns a `TextStyle` with a font size of 18,
  /// using the 'Poppins' font family and a font weight of 300.
  TextStyle get thinL => const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
      );
}
