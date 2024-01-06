/// [ApodEntity] is an entity class that represents the Astronomy Picture of the Day (APOD).
///
/// It contains the following properties:
/// * `date`: The date when the picture was featured as the APOD. This is a DateTime object.
/// * `explanation`: A detailed explanation of the picture. This is a String.
/// * `url`: The URL where the picture can be found. This is a String.
/// * `title`: The title of the picture. This is a String.
///
/// This class is used to model the data received from the APOD API.
class ApodEntity {
  /// Constructs a new ApodEntity instance.
  ///
  /// All parameters are required and must not be null.
  const ApodEntity({
    required this.date,
    required this.explanation,
    required this.url,
    required this.title,
  });

  /// The date when the picture was featured as the APOD.
  final DateTime date;
  
  /// A detailed explanation of the picture.
  final String explanation;

  /// The URL where the picture can be found.
  final String url;

  /// The title of the picture.
  final String title;
}
