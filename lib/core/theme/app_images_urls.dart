import 'package:flutter/material.dart';

/// `AppImagesUrls` is an immutable class that provides 
/// static and instance getters to retrieve the paths of various image assets.
/// 
/// This class uses the Dart getter syntax to provide a clean, 
/// easy-to-use interface for accessing these paths.
/// 
/// Example usage:
/// ```dart
/// print(AppTheme.instance.imagesUrls.logo); // Outputs: 'assets/images/nasa_logo.png'
/// ```
@immutable
class AppImagesUrls {
  
  const AppImagesUrls();

  static const _logo = 'assets/images/nasa_logo.png';
  static const _planetBackground = 'assets/images/planet_background.jpg';
  static const _astronautFloating = 'assets/images/astronaut_floating.jpg';
  static const _earthAtNight = 'assets/images/earth_at_night.jpg';
  static const _astronautOnMoon = 'assets/images/astronaut_on_moon.jpg';
  static const _bloodMoon = 'assets/images/blood_moon.jpg';
  static const _noConnection = 'assets/images/no_connection.png';

  
  /// [logo] returns the path of the logo image.
  String get logo => _logo;

  /// [planetBackground] returns the path of the planet background image.
  String get planetBackground => _planetBackground;

  /// [astronautFloating] returns the path of the astronaut floating image.
  String get astronautFloating => _astronautFloating;

  /// [earthAtNight] returns the path of the earth at night image.
  String get earthAtNight => _earthAtNight;

  /// [astronautOnMoon] returns the path of the astronaut on moon image.
  String get astronautOnMoon => _astronautOnMoon;

  /// [bloodMoon] returns the path of the blood moon image.
  String get bloodMoon => _bloodMoon;

  /// [noConnection] returns the path of the no connection image.
  String get noConnection => _noConnection;
}
