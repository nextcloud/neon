import 'package:timezone/timezone.dart' as tz;

/// Extension to convert from Iso8601 DateTime.
extension Iso8601DateTime on tz.TZDateTime {
  /// Constructs a new [tz.TZDateTime] instance based on [formattedString].
  ///
  /// Works like [parse] except that this function returns `null`
  /// where [parse] would throw a [FormatException].
  static tz.TZDateTime? tryParse(tz.Location location, String? formattedString) {
    if (formattedString == null) {
      return null;
    }

    final dateTime = DateTime.tryParse(formattedString);

    if (dateTime == null) {
      return null;
    }
    return tz.TZDateTime.from(dateTime, location);
  }
}
