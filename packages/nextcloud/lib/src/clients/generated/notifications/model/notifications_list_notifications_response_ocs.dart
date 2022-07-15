//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsListNotificationsResponseOcs {
  /// Returns a new [NotificationsListNotificationsResponseOcs] instance.
  NotificationsListNotificationsResponseOcs({
    this.meta,
    this.data = const [],
  });

  /// Stub
  Object? meta;

  List<NotificationsNotification> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsListNotificationsResponseOcs && other.meta == meta && other.data == data;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (meta == null ? 0 : meta!.hashCode) + (data.hashCode);

  @override
  String toString() => 'NotificationsListNotificationsResponseOcs[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (meta != null) {
      _json[r'meta'] = meta;
    } else {
      _json[r'meta'] = null;
    }
    _json[r'data'] = data;
    return _json;
  }

  /// Returns a new [NotificationsListNotificationsResponseOcs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsListNotificationsResponseOcs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "NotificationsListNotificationsResponseOcs[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "NotificationsListNotificationsResponseOcs[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsListNotificationsResponseOcs(
        meta: mapValueOfType<Object>(json, r'meta'),
        data: NotificationsNotification.listFromJson(json[r'data']) ?? const [],
      );
    }
    return null;
  }

  static List<NotificationsListNotificationsResponseOcs>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsListNotificationsResponseOcs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsListNotificationsResponseOcs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsListNotificationsResponseOcs> mapFromJson(dynamic json) {
    final map = <String, NotificationsListNotificationsResponseOcs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsListNotificationsResponseOcs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsListNotificationsResponseOcs-objects as value to a dart map
  static Map<String, List<NotificationsListNotificationsResponseOcs>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsListNotificationsResponseOcs>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsListNotificationsResponseOcs.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
