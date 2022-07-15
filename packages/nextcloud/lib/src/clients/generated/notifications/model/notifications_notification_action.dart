//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsNotificationAction {
  /// Returns a new [NotificationsNotificationAction] instance.
  NotificationsNotificationAction({
    this.label,
    this.link,
    this.type,
    this.primary,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? link;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? primary;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsNotificationAction &&
          other.label == label &&
          other.link == link &&
          other.type == type &&
          other.primary == primary;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (label == null ? 0 : label!.hashCode) +
      (link == null ? 0 : link!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (primary == null ? 0 : primary!.hashCode);

  @override
  String toString() => 'NotificationsNotificationAction[label=$label, link=$link, type=$type, primary=$primary]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (label != null) {
      _json[r'label'] = label;
    } else {
      _json[r'label'] = null;
    }
    if (link != null) {
      _json[r'link'] = link;
    } else {
      _json[r'link'] = null;
    }
    if (type != null) {
      _json[r'type'] = type;
    } else {
      _json[r'type'] = null;
    }
    if (primary != null) {
      _json[r'primary'] = primary;
    } else {
      _json[r'primary'] = null;
    }
    return _json;
  }

  /// Returns a new [NotificationsNotificationAction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsNotificationAction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotificationsNotificationAction[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotificationsNotificationAction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsNotificationAction(
        label: mapValueOfType<String>(json, r'label'),
        link: mapValueOfType<String>(json, r'link'),
        type: mapValueOfType<String>(json, r'type'),
        primary: mapValueOfType<bool>(json, r'primary'),
      );
    }
    return null;
  }

  static List<NotificationsNotificationAction>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsNotificationAction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsNotificationAction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsNotificationAction> mapFromJson(dynamic json) {
    final map = <String, NotificationsNotificationAction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsNotificationAction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsNotificationAction-objects as value to a dart map
  static Map<String, List<NotificationsNotificationAction>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsNotificationAction>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsNotificationAction.listFromJson(
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
