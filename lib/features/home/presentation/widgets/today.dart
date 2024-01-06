import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/extensions/date_extension.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/shimmed_box.dart';
import 'package:flutter/material.dart';

/// [Today] is a widget that shows the current date
/// It can be in 3 states:
/// - [StatesEnum.regular] - shows the current date
/// - [StatesEnum.loading] - shows a shimmer
/// - [StatesEnum.error] - shows nothing
class Today extends StatelessWidget {

  /// Creates a [Today] widget
  const Today({
    required this.state,
    super.key,
  });

  /// The state of the widget
  final StatesEnum state;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) => state.when(
        regular: () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODAY',
                style: _theme.typography.nasaL.copyWith(
                  color: _theme.colors.primary,
                  height: 1,
                ),
              ),
              Text(
                DateTime.now().formattedFullDate,
                style: _theme.typography.bodyS.copyWith(
                  color: _theme.colors.primary,
                  height: 1,
                ),
              ),
            ],
          );
        },
        loading: () {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmedBox(
                height: 20,
                width: 100,
              ),
              SizedBox(height: 4),
              ShimmedBox(
                height: 10,
                width: 100,
              ),
            ],
          );
        },
        error: () {
          return const SizedBox.shrink();
        },
      );
}
