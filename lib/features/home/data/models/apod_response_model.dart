import 'package:apod/features/home/domain/entities/apod_entity.dart';
import 'package:apod/features/home/domain/entities/picture_entity.dart';
import 'package:apod/features/home/domain/entities/video_entity.dart';
import 'package:apod/features/home/domain/enums/media_type_enum.dart';

/// The `ApodResponseModel` class extends the `ApodEntity` class.
/// It represents the response model for the Astronomy Picture of the Day (APOD) API.
final class ApodResponseModel extends ApodEntity {
  /// The constructor for the `ApodResponseModel` class.
  /// It requires all the parameters of the `ApodEntity` class, as well as the `mediaType` parameter.
  /// The `hDUrl` parameter is optional.
  ApodResponseModel({
    required super.date,
    required super.explanation,
    required super.url,
    required super.title,
    required this.mediaType,
    this.hDUrl,
  });

  /// A factory constructor that creates an instance of `ApodResponseModel` from a JSON object.
  factory ApodResponseModel.fromJson(Map<String, dynamic> json) {
    return ApodResponseModel(
      date: DateTime.parse(json['date'] as String),
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      mediaType: MediaTypeEnum.fromString(json['media_type'] as String),
      hDUrl: json['hdurl'] as String?,
    );
  }

  /// The type of media (image or video) for the APOD.
  final MediaTypeEnum mediaType;

  /// The URL for the HD version of the APOD, if available.
  final String? hDUrl;

  /// Converts the `ApodResponseModel` to an `ApodEntity`.
  /// If the media type is an image, it returns a `PictureEntity`.
  /// If the media type is a video, it returns a `VideoEntity`.
  /// 
  /// Throws an exception if the media type is neither an image nor a video.
  ApodEntity toEntity() {
    if (mediaType.isImage) {
      return PictureEntity(date: date, explanation: explanation, url: url, title: title);
    }

    if (mediaType.isVideo) {
      return VideoEntity(date: date, explanation: explanation, url: url, title: title);
    }

    throw Exception('Invalid media type: $mediaType');
  }
}
