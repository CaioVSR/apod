import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/entities/picture_entity.dart';
import 'package:apod/features/home/domain/entities/video_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// `ImageOfTheDayCard` is a stateful widget that displays an image of the day card.
///
/// It takes the following parameters:
///
/// * `apod`: An `ApodEntity` object that represents the image or video to be displayed on the card.
///
/// * `onCardTap`: A callback function that is called when the card is tapped.
///
/// The widget checks if the `apod` is a `PictureEntity` or a `VideoEntity` and displays the card accordingly.
class ImageOfTheDayCard extends StatefulWidget {
  /// Creates an [ImageOfTheDayCard] with the given parameters.
  const ImageOfTheDayCard({
    required this.onCardTap,
    required this.apod,
    this.padding,
    super.key,
  });

  /// The [padding] to be applied to the card.
  final EdgeInsets? padding;

  /// The [apod] to be displayed on the card.
  final ApodEntity apod;

  /// The callback function that is called when the card is tapped.
  final VoidCallback onCardTap;

  @override
  State<ImageOfTheDayCard> createState() => _ImageOfTheDayCardState();
}

class _ImageOfTheDayCardState extends State<ImageOfTheDayCard> {
  AppTheme get _theme => AppTheme.instance;

  YoutubePlayerController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.apod is PictureEntity) {
      final picture = widget.apod as PictureEntity;

      return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: GestureDetector(
          onTap: widget.onCardTap,
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            decoration: BoxDecoration(
              color: _theme.colors.background.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: CachedNetworkImageProvider(picture.url),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    decoration: BoxDecoration(
                      color: _theme.colors.background.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      picture.title,
                      style: _theme.typography.bodyS.copyWith(
                        color: _theme.colors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (widget.apod is VideoEntity) {
      final video = widget.apod as VideoEntity;

      controller = YoutubePlayerController(
        initialVideoId: video.url.replaceAll('https://www.youtube.com/embed/', '').replaceAll('?rel=0', ''),
        flags: const YoutubePlayerFlags(
          mute: true,
          loop: true,
          showLiveFullscreenButton: false,
        ),
      );

      return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: GestureDetector(
          onTap: widget.onCardTap,
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            decoration: BoxDecoration(
              color: _theme.colors.background.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                AbsorbPointer(
                  child: YoutubePlayer(
                    controller: controller!,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      decoration: BoxDecoration(
                        color: _theme.colors.background.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        widget.apod.title,
                        style: _theme.typography.bodyS.copyWith(
                          color: _theme.colors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    throw UnimplementedError('$runtimeType is not implemented');
  }
}
