import 'package:apod/core/theme/app_colors.dart';
import 'package:apod/core/theme/app_images_urls.dart';
import 'package:apod/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// The *`AppTheme`* class is an immutable class, meaning that once its
/// properties are set, they cannot be changed.
/// 
/// * The class has a private constructor, `_()`, to prevent the 
/// creation of instances from outside.
/// 
///  * You can access the instance of the class using the `instance` getter.
/// 
/// * The [colors] getter returns the colors of the application.
/// 
/// * The [typography] getter returns the typography of the application.
/// 
/// * The [imagesUrls] getter returns the URLs of the images used in the application.
@immutable
class AppTheme {
  const AppTheme._();

  static const instance = AppTheme._();

  /// [colors] getter returns the colors of the application.
  AppColors get colors =>  const AppColors();

  /// [typography] getter returns the typography of the application.
  AppTypography get typography =>  const AppTypography();

  /// [imagesUrls] getter returns the URLs of the images used in the application.
  AppImagesUrls get imagesUrls =>  const AppImagesUrls();
}
