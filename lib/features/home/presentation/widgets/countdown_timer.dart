import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/shimmed_box.dart';
import 'package:flutter/material.dart';

/// The [CountdownTimer] is a widget that displays the countdown timer
/// to the next launch.
/// Example:
/// ```dart
/// CountdownTimer(
///  duration: const Duration(days: 1),
/// state: const StatesEnum.regular,
/// );
/// ```
/// Should be declared on the `home_module.dart` file.
/// Example:
/// ```dart
/// class HomeModule extends Module {
/// @override
/// void binds(Injector i) {
///   i.addLazySingleton<HomeRemoteDataSource>(HomeRemoteDataSource.new);
/// }
/// ```
class CountdownTimer extends StatelessWidget {
  /// The default constructor of the [CountdownTimer] class.
  const CountdownTimer({
    required this.duration,
    required this.state,
    super.key,
  });

  /// The [duration] of the countdown timer.
  final Duration duration;

  /// The [state] of the countdown timer.
  final StatesEnum state;

  AppTheme get _theme => AppTheme.instance;
  @override
  Widget build(BuildContext context) {
    return state.when(
      regular: () {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _theme.colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              TimeBuilder(
                time: duration.inHours.abs().toString().padLeft(2, '0'),
                label: 'hours',
              ),
              const SizedBox(width: 16),
              TimeBuilder(
                time: duration.inMinutes.remainder(60).abs().toString().padLeft(2, '0'),
                label: 'mins',
              ),
              const SizedBox(width: 16),
              TimeBuilder(
                time: duration.inSeconds.remainder(60).abs().toString().padLeft(2, '0'),
                label: 'secs',
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'To the next',
                      style: _theme.typography.body.copyWith(color: _theme.colors.background),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'launch',
                      style: _theme.typography.bodyBold.copyWith(color: _theme.colors.background),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () {
        return const ShimmedBox(
          height: 62,
          width: double.infinity,
          borderRadius: 16,
        );
      },
      error: () {
        return const SizedBox.shrink();
      },
    );
  }
}

/// The [TimeBuilder] is a builder that displays the time and its label.
class TimeBuilder extends StatelessWidget {
  /// The default constructor of the [TimeBuilder] class.
  const TimeBuilder({
    required this.time,
    required this.label,
    super.key,
  });

  /// The [time] to be displayed.
  final String time;

  /// The [label] of the time.
  final String label;

  @override
  Widget build(BuildContext context) {
    const theme = AppTheme.instance;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: theme.typography.nasaXL.copyWith(
            color: theme.colors.background,
            height: 1,
            letterSpacing: 2,
          ),
        ),
        Text(
          label,
          style: theme.typography.bodyS.copyWith(
            color: theme.colors.background,
            height: 1,
          ),
        ),
      ],
    );
  }
}
