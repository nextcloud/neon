//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusClearAt {
  /// Returns a new [UserStatusClearAt] instance.
  UserStatusClearAt({
    this.type,
    this.time,
  });

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
  int? time;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UserStatusClearAt && other.type == type && other.time == time;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type == null ? 0 : type!.hashCode) + (time == null ? 0 : time!.hashCode);

  @override
  String toString() => 'UserStatusClearAt[type=$type, time=$time]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (type != null) {
      _json[r'type'] = type;
    } else {
      _json[r'type'] = null;
    }
    if (time != null) {
      _json[r'time'] = time;
    } else {
      _json[r'time'] = null;
    }
    return _json;
  }

  /// Returns a new [UserStatusClearAt] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusClearAt? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusClearAt[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusClearAt[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusClearAt(
        type: mapValueOfType<String>(json, r'type'),
        time: mapValueOfType<int>(json, r'time'),
      );
    }
    return null;
  }

  static List<UserStatusClearAt>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusClearAt>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusClearAt.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusClearAt> mapFromJson(dynamic json) {
    final map = <String, UserStatusClearAt>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusClearAt.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusClearAt-objects as value to a dart map
  static Map<String, List<UserStatusClearAt>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusClearAt>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusClearAt.listFromJson(
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
