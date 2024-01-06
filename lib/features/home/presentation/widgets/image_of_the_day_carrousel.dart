import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/secondary_button.dart';
import 'package:apod/core/widgets/shimmed_box.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/presentation/widgets/image_of_the_day_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// `ImageOfTheDayCarrousel` is a stateless widget that displays a carousel of images.
///
/// It takes the following parameters:
///
/// * `apodsList`: A list of `ApodEntity` objects that represent the images to be displayed in the carousel.
///
/// * `state`: A `StatesEnum` object that represents the current state of the widget. This is used to determine how the widget should be displayed.
///
/// * `onSeeAllPressed`: A callback function that is called when the "See All" button is pressed.
///
/// * `onCardTap`: A callback function that is called when an image card is tapped. This function takes an `ApodEntity` object as a parameter and returns a `Future<void>`.
///
/// The widget uses the `CarouselSlider` package to display the images in a carousel format.
class ImageOfTheDayCarrousel extends StatelessWidget {
  /// Creates an [ImageOfTheDayCarrousel] with the given parameters.
  const ImageOfTheDayCarrousel({
    required this.apodsList,
    required this.state,
    required this.onSeeAllPressed,
    required this.onCardTap,
    super.key,
  });

  /// The [state] of the widget.
  final StatesEnum state;

  /// The list of [ApodEntity] objects to be displayed in the carousel.
  final List<ApodEntity> apodsList;

  /// The callback function that is called when the "See All" button is pressed.
  final VoidCallback onSeeAllPressed;

  /// The callback function that is called when an image card is tapped.
  final Future<void> Function(ApodEntity) onCardTap;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) => state.when(
        regular: () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Image of the Day',
                  style: _theme.typography.bodyBold.copyWith(
                    color: _theme.colors.primary,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                SecondaryButton(
                  onPressed: onSeeAllPressed,
                  child: Row(
                    children: [
                      Text(
                        'See all',
                        style: _theme.typography.thinL.copyWith(
                          color: _theme.colors.primaryDimmedDown,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: _theme.colors.primaryDimmedDown,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Observer(
              builder: (_) {
                return CarouselSlider.builder(
                  itemCount: apodsList.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    final apod = apodsList[index];

                    return ImageOfTheDayCard(apod: apod, onCardTap: () => onCardTap(apod));
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    height: 200,
                    padEnds: false,
                    viewportFraction: 0.9,
                  ),
                );
              },
            ),
          ],
        ),
        loading: () => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmedBox(
              height: 20,
              width: 128,
            ),
            SizedBox(height: 8),
            ShimmedBox(
              height: 200,
              width: double.infinity,
              borderRadius: 16,
            ),
          ],
        ),
        error: () => const SizedBox.shrink(),
      );
}
