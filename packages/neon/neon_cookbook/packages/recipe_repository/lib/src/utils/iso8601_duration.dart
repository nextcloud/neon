// Copyright (c) 2019, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// Extension to convert from and to Iso8601 duration.
///
/// Note that this serializer is not 100% compatible with the ISO8601 format
/// due to limitations of the [Duration] class, but is designed to produce and
/// consume reasonable strings that match the standard.
///
/// This is copied from package:built_value.
extension Iso8601Duration on Duration {
  // The unit tokens.
  static const _durationToken = 'P';
  static const _dayToken = 'D';
  static const _timeToken = 'T';
  static const _hourToken = 'H';
  static const _minuteToken = 'M';
  static const _secondToken = 'S';

  // The parse format for ISO8601 durations.
  static final _parseFormat = RegExp(
    r'^P(?!$)(0D|[1-9][0-9]*D)?'
    r'(?:T(?!$)(0H|[1-9][0-9]*H)?(0M|[1-9][0-9]*M)?(0S|[1-9][0-9]*S)?)?$',
  );

  /// Tries to deserialize a given ISO8601 [input] String.
  static Duration? tryParse(String? input) {
    if (input == null) {
      return null;
    }

    final match = _parseFormat.firstMatch(input);
    if (match == null) {
      return null;
    }
    // Iterate through the capture groups to build the unit mappings.
    final unitMappings = <String, int>{};

    // Start iterating at 1, because match[0] is the full match.
    for (var i = 1; i <= match.groupCount; i++) {
      final group = match[i];
      if (group == null) {
        continue;
      }

      // Get all but last character in group.
      // The RegExp ensures this must be an int.
      final value = int.parse(group.substring(0, group.length - 1));
      // Get last character.
      final unit = group.substring(group.length - 1);
      unitMappings[unit] = value;
    }

    return Duration(
      days: unitMappings[_dayToken] ?? 0,
      hours: unitMappings[_hourToken] ?? 0,
      minutes: unitMappings[_minuteToken] ?? 0,
      seconds: unitMappings[_secondToken] ?? 0,
    );
  }

  /// Returns an ISO-8601 duration.
  String toIso8601String() {
    if (this == Duration.zero) {
      return 'PT0S';
    }
    final days = inDays;
    final hours = (this - Duration(days: days)).inHours;
    final minutes = (this - Duration(days: days, hours: hours)).inMinutes;
    final seconds = (this - Duration(days: days, hours: hours, minutes: minutes)).inSeconds;
    final remainder = this - Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);

    if (remainder != Duration.zero) {
      throw ArgumentError.value(this, 'duration', 'Contains sub-second data which cannot be serialized.');
    }
    final buffer = StringBuffer(_durationToken)..write(days == 0 ? '' : '$days$_dayToken');
    if (!(hours == 0 && minutes == 0 && seconds == 0)) {
      buffer
        ..write(_timeToken)
        ..write(hours == 0 ? '' : '$hours$_hourToken')
        ..write(minutes == 0 ? '' : '$minutes$_minuteToken')
        ..write(seconds == 0 ? '' : '$seconds$_secondToken');
    }
    return buffer.toString();
  }
}
