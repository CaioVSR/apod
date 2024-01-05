import 'package:apod/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// `ShimmedBox` is a base shimmer component for creating custom shim effect.
///
/// This widget is used to create a box with a shim effect. The shim effect is a placeholder animation
/// often used to indicate that content is loading. This can be useful in situations where content
/// needs to be fetched from a network source and you want to provide a visual indication to the user
/// that something is happening.
///
/// The `ShimmedBox` takes a single child widget. The child is the content that will be displayed
/// once it is loaded. Until then, the shim effect will be displayed.
///
/// Note: This is a basic documentation. The actual implementation and usage of `ShimmedBox` may vary
/// based on its implementation in your codebase.
class ShimmedBox extends StatelessWidget {

  /// Creates a ShimmedBox.
  ///
  /// The [height], [width], and [borderRadius] arguments are optional.
  const ShimmedBox({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  /// The height of the box.
  final double? height;

  /// The width of the box.
  final double? width;

  /// The border radius of the box.
  final double? borderRadius;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _theme.colors.primaryDimmedDown,
      highlightColor: _theme.colors.primary,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: _theme.colors.primary,
        ),
        height: height,
        width: width,
        // child: const SizedBox(),
      ),
    );
  }
}
