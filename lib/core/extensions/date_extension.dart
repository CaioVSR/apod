import 'package:intl/intl.dart';

/// `DateExtension` is a Dart class that extends the functionality of the `DateTime` class.
///
/// This class provides additional methods and properties to work with dates.
///
/// Example:
///
/// ```dart
/// DateTime now = DateTime.now();
/// print(now.yourMethod()); // Use your method from DateExtension
/// ```
extension DateExtension on DateTime {
  /// Returns a formatted date.
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// print(now.formattedDate); // January 01, 2021
  /// ```
  String get formattedMonthAndDay => DateFormat('MMMM dd').format(this);

  /// Returns a formatted day.
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// print(now.formattedDay); // January 01
  /// ```
  String get formattedFullDate => DateFormat('MMMM dd, yyyy').format(this);

  /// Returns a formatted short date.
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// print(now.formattedShortDate); // 01/01/2021
  /// ```
  String get formattedShortDate => DateFormat('MM/dd/yyyy').format(this);

  /// Returns a formatted API date.
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// print(now.formattedApiDate); // 2021-01-01
  /// ```
  String get formattedApiDate => DateFormat('yyyy-MM-dd').format(this);
}
