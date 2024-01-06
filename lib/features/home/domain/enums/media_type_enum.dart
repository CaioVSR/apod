/// Enum representing different types of media.
///
/// This enum is used to differentiate between image and video media types.
enum MediaTypeEnum {
  /// Represents an image media type.
  image('image'),
  
  /// Represents a video media type.
  video('video');

  /// Constructs a new MediaTypeEnum instance.
  const MediaTypeEnum(this.value);

  /// Creates a new MediaTypeEnum from a string value.
  ///
  /// This method will throw a StateError if the provided string does not match any MediaTypeEnum values.
  factory MediaTypeEnum.fromString(String value) => MediaTypeEnum.values.firstWhere((element) => element.value == value);

  /// The value of the media type.
  final String value;

  /// Returns true if the media type is an image.
  bool get isImage => this == MediaTypeEnum.image;
  
  /// Returns true if the media type is a video.
  bool get isVideo => this == MediaTypeEnum.video;
}
