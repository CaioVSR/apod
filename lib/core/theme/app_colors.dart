import 'package:flutter/material.dart';

/// `AppColors` is an immutable class that describes the colors used throughout the application.
/// Each color is represented as a `Color` object.
@immutable
class AppColors {
  const AppColors();

  /// The primary color used in the application.
  /// It is a light grey color represented by the hex code #E9E9E9.
  Color get primary => const Color(0xFFe9e9e9);

  /// The primary dimmed down color used in the application.
  /// It is a dimmed down version of the primary color, represented by the hex code #D0D0D0.
  Color get primaryDimmedDown => const Color(0xFFd0d0d0);

  /// The secondary color used in the application.
  /// It is a light grey color, slightly darker than the primary color, represented by the hex code #DDDDDD.
  Color get secondary => const Color(0xFFdddddd);

  /// The background color used in the application.
  /// It is a dark color, almost black, represented by the hex code #121218.
  Color get background => const Color(0xFF121218);

  /// The warning color used in the application.
  /// It is a bright red color, represented by the hex code #E54141.
  Color get warning => const Color(0xFFe54141);

  /// The white color used in the application.
  /// It is represented by the hex code #FFFFFF.
  Color get white => const Color(0xFFFFFFFF);
}
