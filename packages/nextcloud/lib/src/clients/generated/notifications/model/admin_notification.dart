//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AdminNotification {
  /// Returns a new [AdminNotification] instance.
  AdminNotification({
    this.shortMessage,
    this.longMessage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? shortMessage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? longMessage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminNotification && other.shortMessage == shortMessage && other.longMessage == longMessage;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (shortMessage == null ? 0 : shortMessage!.hashCode) + (longMessage == null ? 0 : longMessage!.hashCode);

  @override
  String toString() => 'AdminNotification[shortMessage=$shortMessage, longMessage=$longMessage]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (shortMessage != null) {
      _json[r'shortMessage'] = shortMessage;
    }
    if (longMessage != null) {
      _json[r'longMessage'] = longMessage;
    }
    return _json;
  }

  /// Returns a new [AdminNotification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AdminNotification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AdminNotification[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AdminNotification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AdminNotification(
        shortMessage: mapValueOfType<String>(json, r'shortMessage'),
        longMessage: mapValueOfType<String>(json, r'longMessage'),
      );
    }
    return null;
  }

  static List<AdminNotification>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AdminNotification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AdminNotification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AdminNotification> mapFromJson(dynamic json) {
    final map = <String, AdminNotification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AdminNotification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AdminNotification-objects as value to a dart map
  static Map<String, List<AdminNotification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AdminNotification>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AdminNotification.listFromJson(
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
