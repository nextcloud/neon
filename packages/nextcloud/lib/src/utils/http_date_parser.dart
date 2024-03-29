// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: unnecessary_raw_strings, cascade_invocations, parameter_assignments, always_put_control_body_on_new_line

import 'package:string_scanner/string_scanner.dart';
import 'package:timezone/timezone.dart' as tz;

const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

final _shortWeekdayRegExp = RegExp(r'Mon|Tue|Wed|Thu|Fri|Sat|Sun');
final _longWeekdayRegExp = RegExp(r'Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday');
final _monthRegExp = RegExp(r'Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec');
final _digitRegExp = RegExp(r'\d+');
final _zoneRegExp = RegExp(r'[+|-]');

/// Return a HTTP-formatted string representation of [date].
///
/// This follows [RFC 822](http://tools.ietf.org/html/rfc822) as updated by
/// [RFC 1123](http://tools.ietf.org/html/rfc1123).
String formatHttpDate(DateTime date) {
  date = date.toUtc();
  final buffer = StringBuffer()
    ..write(_weekdays[date.weekday - 1])
    ..write(', ')
    ..write(date.day <= 9 ? '0' : '')
    ..write(date.day.toString())
    ..write(' ')
    ..write(_months[date.month - 1])
    ..write(' ')
    ..write(date.year.toString())
    ..write(date.hour <= 9 ? ' 0' : ' ')
    ..write(date.hour.toString())
    ..write(date.minute <= 9 ? ':0' : ':')
    ..write(date.minute.toString())
    ..write(date.second <= 9 ? ':0' : ':')
    ..write(date.second.toString())
    ..write(' GMT');
  return buffer.toString();
}

/// Parses an HTTP-formatted date into a UTC [DateTime].
///
/// This follows [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3).
/// It will throw a [FormatException] if [date] is invalid.
tz.TZDateTime parseHttpDate(String date) {
  final scanner = StringScanner(date);

  if (scanner.scan(_longWeekdayRegExp)) {
    // RFC 850 starts with a long weekday.
    scanner.expect(', ');
    final day = _parseInt(scanner, 2);
    scanner.expect('-');
    final month = _parseMonth(scanner);
    scanner.expect('-');
    final year = 1900 + _parseInt(scanner, 2);
    scanner.expect(' ');
    final time = _parseTime(scanner);
    scanner.expect(' GMT');
    scanner.expectDone();

    return _makeDateTime(year, month, day, time);
  }

  // RFC 1123 and asctime both start with a short weekday.
  scanner.expect(_shortWeekdayRegExp);
  if (scanner.scan(', ')) {
    // RFC 1123 follows the weekday with a comma.
    final day = _parseInt(scanner, 2);
    scanner.expect(' ');
    final month = _parseMonth(scanner);
    scanner.expect(' ');
    final year = _parseInt(scanner, 4);
    scanner.expect(' ');
    final time = _parseTime(scanner);
    scanner.expect(' ');
    final offset = _parseLocation(scanner);
    scanner.expectDone();

    return _makeDateTime(year, month, day, time, offset);
  }

  // asctime follows the weekday with a space.
  scanner.expect(' ');
  final month = _parseMonth(scanner);
  scanner.expect(' ');
  final day = scanner.scan(' ') ? _parseInt(scanner, 1) : _parseInt(scanner, 2);
  scanner.expect(' ');
  final time = _parseTime(scanner);
  scanner.expect(' ');
  final year = _parseInt(scanner, 4);
  scanner.expectDone();

  return _makeDateTime(year, month, day, time);
}

/// Parses a short-form month name to a form accepted by [DateTime].
int _parseMonth(StringScanner scanner) {
  scanner.expect(_monthRegExp);
  // DateTime uses 1-indexed months.
  return _months.indexOf(scanner.lastMatch![0]!) + 1;
}

/// Parses an int an enforces that it has exactly [digits] digits.
int _parseInt(StringScanner scanner, int digits) {
  scanner.expect(_digitRegExp);
  if (scanner.lastMatch![0]!.length != digits) {
    scanner.error('expected a $digits-digit number.');
  }

  return int.parse(scanner.lastMatch![0]!);
}

/// Parses an timestamp of the form "HH:MM:SS" on a 24-hour clock.
tz.TZDateTime _parseTime(StringScanner scanner) {
  final hours = _parseInt(scanner, 2);
  if (hours >= 24) scanner.error('hours may not be greater than 24.');
  scanner.expect(':');

  final minutes = _parseInt(scanner, 2);
  if (minutes >= 60) scanner.error('minutes may not be greater than 60.');
  scanner.expect(':');

  final seconds = _parseInt(scanner, 2);
  if (seconds >= 60) scanner.error('seconds may not be greater than 60.');

  return tz.TZDateTime.utc(1, 1, 1, hours, minutes, seconds);
}

Duration? _parseLocation(StringScanner scanner) {
  if (scanner.scan('GMT')) {
    return null;
  } else if (scanner.scan(_zoneRegExp)) {
    final modifier = scanner.lastMatch![0]!;

    scanner.expect(RegExp(r'\d{2}'));
    final hours = int.parse(scanner.lastMatch![0]!);

    scanner.expect(RegExp(r'\d{2}'));
    final minutes = int.parse(scanner.lastMatch![0]!);

    if (hours >= 99 && minutes > 59) {
      throw FormatException("invalid timezone offset '$hours$minutes'.");
    }

    var offset = Duration(hours: hours, minutes: minutes);
    if (modifier == '-') {
      offset *= -1;
    }

    return offset;
  } else {
    throw const FormatException('Parsing timezone can not be done unambiguously.');
  }
}

/// Returns a UTC [tz.TZDateTime] from the given components.
///
/// Validates that [day] is a valid day for [month]. If it's not, throws a
/// [FormatException].
tz.TZDateTime _makeDateTime(int year, int month, int day, tz.TZDateTime time, [Duration? offset]) {
  var dateTime = tz.TZDateTime(tz.UTC, year, month, day, time.hour, time.minute, time.second);
  if (offset != null) {
    dateTime = dateTime.add(offset);
  }

  // If [day] was too large, it will cause [month] to overflow.
  if (dateTime.month != month) {
    throw FormatException("invalid day '$day' for month '$month'.");
  }
  return dateTime;
}
