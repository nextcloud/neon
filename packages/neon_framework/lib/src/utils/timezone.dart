import 'package:collection/collection.dart';
import 'package:timezone/timezone.dart' as tz;

/// Guesses the location of the device used for the timezone.
///
/// It will most likely report a different location than the location that is configured on the device,
/// because it just estimates the location by returning the first location which matches the timezone name or abbreviation.
/// This is still accurate, as many locations share the same timezone.
tz.Location? guessDeviceLocation() {
  final timezoneName = DateTime.now().timeZoneName;

  final match = tz.timeZoneDatabase.locations.entries.firstWhereOrNull(
    (entry) => entry.key == timezoneName || entry.value.currentTimeZone.abbreviation == timezoneName,
  );

  return match?.value;
}
