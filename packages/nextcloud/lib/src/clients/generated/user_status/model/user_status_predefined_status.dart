//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusPredefinedStatus {
  /// Returns a new [UserStatusPredefinedStatus] instance.
  UserStatusPredefinedStatus({
    this.id,
    this.icon,
    this.message,
    this.clearAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? icon;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? clearAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatusPredefinedStatus &&
          other.id == id &&
          other.icon == icon &&
          other.message == message &&
          other.clearAt == clearAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (icon == null ? 0 : icon!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (clearAt == null ? 0 : clearAt!.hashCode);

  @override
  String toString() => 'UserStatusPredefinedStatus[id=$id, icon=$icon, message=$message, clearAt=$clearAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.clearAt != null) {
      json[r'clearAt'] = this.clearAt;
    } else {
      json[r'clearAt'] = null;
    }
    return json;
  }

  /// Returns a new [UserStatusPredefinedStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusPredefinedStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusPredefinedStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusPredefinedStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusPredefinedStatus(
        id: mapValueOfType<String>(json, r'id'),
        icon: mapValueOfType<String>(json, r'icon'),
        message: mapValueOfType<String>(json, r'message'),
        clearAt: mapValueOfType<Object>(json, r'clearAt'),
      );
    }
    return null;
  }

  static List<UserStatusPredefinedStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusPredefinedStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusPredefinedStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusPredefinedStatus> mapFromJson(dynamic json) {
    final map = <String, UserStatusPredefinedStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPredefinedStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusPredefinedStatus-objects as value to a dart map
  static Map<String, List<UserStatusPredefinedStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusPredefinedStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPredefinedStatus.listFromJson(
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
