import 'dart:math';

import 'package:apod/core/enums/state_enum.dart';
import 'package:apod/core/theme/app_theme.dart';
import 'package:apod/core/widgets/shimmed_box.dart';
import 'package:flutter/material.dart';

class AboutApod extends StatelessWidget {
  const AboutApod({super.key, required this.state});

  final StatesEnum state;

  AppTheme get _theme => AppTheme.instance;

  @override
  Widget build(BuildContext context) {
    return state.when(
      regular: () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ABOUT APOD', style: _theme.typography.nasaL),
          const SizedBox(height: 16),
          Text(
            '''
                Astronomy Picture of the Day (APOD) is a website provided by NASA and Michigan Technological University (MTU) dedicated to astronomical images. Each day a different image or photograph of our universe is featured, along with a brief explanation written by a professional astronomer. Past images are stored in the APOD Archive, with the first image appearing on June 16, 1995. About half of the images that appear on APOD are submitted by volunteers.

                APOD receives most of its volunteer images via email. Beyond that, APOD organizes a public flickr group and a public online discussion forum called “Starship Asterisk*” The Asterisk* forum is also used for those who have a question about an APOD-run image, or want to discuss any topic in astronomy. More than 2500 volunteers have participated in these discussions.

                APOD is one of the oldest and most popular astronomy sites on the web. Its simple html code makes it robust and easily portable, and it is translated into over 20 languages daily by international group of volunteers. Volunteeers also coordinate APOD’s presence on Facebook, Instagram, Twitter, Discord, Reddit, Tumblr, YouTube, mastodon, and iPhone and Adroid apps, and is available as an email subscription. APOD has over 1.4 million Twitter followers.

                APOD is supported by NASA’s Science Activation Program, NASA’s Astrophysics Science Division, Michigan Technological University, and the University of Maryland.
                ''',
            style: _theme.typography.body,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ShimmedBox(
            height: 24,
            width: 200,
          ),
          const SizedBox(height: 16),
          ...List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ShimmedBox(
                height: 14,
                width: Random().nextDouble() * MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
        ],
      ),
      error: () => const SizedBox.shrink(),
    );
  }
}
