import 'package:intl/intl.dart';

extension NullableDateTimeFormatters on DateTime? {
  /// Converts to time format like "3:45 PM", uses current time if null
  String toTimeString() {
    final date = this ?? DateTime.now();
    return DateFormat('h:mm a').format(date);
  }

  /// Converts to date format like "25 October", uses current date if null
  String toDayMonthString() {
    final date = this ?? DateTime.now();
    return DateFormat('d MMMM').format(date);
  }

  /// Converts to combined date & time like "25 October, 3:45 PM"
  String toDayMonthTimeString() {
    final date = this ?? DateTime.now();
    return DateFormat('d MMMM, h:mm a').format(date);
  }

  /// Generic formatter with custom pattern
  String formatWith(String pattern) {
    final date = this ?? DateTime.now();
    return DateFormat(pattern).format(date);
  }
}
