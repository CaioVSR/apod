import 'package:apod/features/home/domain/entities/apod_entity.dart';

/// [PictureEntity] is a subclass of [ApodEntity] that represents a picture featured as the Astronomy Picture of the Day (APOD).
///
/// It inherits the following properties from [ApodEntity]:
/// * `date`: The date when the picture was featured as the APOD. This is a DateTime object.
/// * `explanation`: A detailed explanation of the picture. This is a String.
/// * `url`: The URL where the picture can be found. This is a String.
/// * `title`: The title of the picture. This is a String.
///
/// In addition to the inherited properties, [PictureEntity] also has the following property:
/// * `hDUrl`: The URL where the high-definition version of the picture can be found. This is a String.
///
/// This class is used to model the data received from the APOD API when the featured media is a picture.
class PictureEntity extends ApodEntity {
  /// Constructs a new PictureEntity instance.
  ///
  /// All parameters are required and must not be null.
  PictureEntity({
    required super.date,
    required super.explanation,
    required super.url,
    required super.title,
  });

  /// The URL where the high-definition version of the picture can be found.
  final String hDUrl = '';
}
