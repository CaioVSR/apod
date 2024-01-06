import 'package:apod/features/home/domain/entities/apod_entity.dart';

/// [VideoEntity] is a subclass of [ApodEntity] that represents a video featured as the Astronomy Picture of the Day (APOD).
///
/// It inherits the following properties from [ApodEntity]:
/// * `date`: The date when the video was featured as the APOD. This is a DateTime object.
/// * `explanation`: A detailed explanation of the video. This is a String.
/// * `url`: The URL where the video can be found. This is a String.
/// * `title`: The title of the video. This is a String.
///
/// This class is used to model the data received from the APOD API when the featured media is a video.
class VideoEntity extends ApodEntity {
  /// Constructs a new VideoEntity instance.
  ///
  /// All parameters are required and must not be null.
  VideoEntity({
    required super.date,
    required super.explanation,
    required super.url,
    required super.title,
  });
}
