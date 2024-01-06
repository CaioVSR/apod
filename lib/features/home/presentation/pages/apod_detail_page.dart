import 'package:apod/core/extensions/date_extension.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/entities/picture_entity.dart';
import 'package:apod/features/home/domain/entities/video_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// The Astronomy Picture of the Day Detail Page.
///
/// This page shows the Astronomy Picture of the Day details.
class ApodDetailPage extends StatefulWidget {
  /// Creates an `ApodDetailPage`.
  ///
  /// The [apod] argument is required and it represents the Astronomy Picture of the Day.
  const ApodDetailPage({
    required this.apod,
    super.key,
  });

  /// The Astronomy Picture of the Day Object.
  final ApodEntity apod;

  @override
  State<ApodDetailPage> createState() => _ApodDetailPageState();
}

class _ApodDetailPageState extends State<ApodDetailPage> {
  YoutubePlayerController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const theme = AppTheme.instance;
    final imageHeight = MediaQuery.sizeOf(context).height * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image of the day'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Builder(
              builder: (context) {
                if (widget.apod is PictureEntity) {
                  final picture = widget.apod as PictureEntity;

                  return CachedNetworkImage(
                    imageUrl: picture.url,
                    height: imageHeight,
                    fit: BoxFit.cover,
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

                  return AbsorbPointer(
                    child: SizedBox(
                      height: imageHeight,
                      child: YoutubePlayer(
                        controller: controller!,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                widget.apod.date.formattedMonthAndDay,
                style: theme.typography.bodyS.copyWith(color: theme.colors.primary),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.apod.title,
                    style: theme.typography.bodyBold.copyWith(color: theme.colors.primary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.apod.explanation,
                    style: theme.typography.body.copyWith(color: theme.colors.primary),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 128),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
