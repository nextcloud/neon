//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusSetCustomMessage {
  /// Returns a new [UserStatusSetCustomMessage] instance.
  UserStatusSetCustomMessage({
    this.statusIcon,
    this.message,
    this.clearAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusIcon;

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
  int? clearAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatusSetCustomMessage &&
          other.statusIcon == statusIcon &&
          other.message == message &&
          other.clearAt == clearAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (statusIcon == null ? 0 : statusIcon!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (clearAt == null ? 0 : clearAt!.hashCode);

  @override
  String toString() => 'UserStatusSetCustomMessage[statusIcon=$statusIcon, message=$message, clearAt=$clearAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (statusIcon != null) {
      _json[r'statusIcon'] = statusIcon;
    }
    if (message != null) {
      _json[r'message'] = message;
    }
    if (clearAt != null) {
      _json[r'clearAt'] = clearAt;
    }
    return _json;
  }

  /// Returns a new [UserStatusSetCustomMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusSetCustomMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusSetCustomMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusSetCustomMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusSetCustomMessage(
        statusIcon: mapValueOfType<String>(json, r'statusIcon'),
        message: mapValueOfType<String>(json, r'message'),
        clearAt: mapValueOfType<int>(json, r'clearAt'),
      );
    }
    return null;
  }

  static List<UserStatusSetCustomMessage>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusSetCustomMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusSetCustomMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusSetCustomMessage> mapFromJson(dynamic json) {
    final map = <String, UserStatusSetCustomMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusSetCustomMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusSetCustomMessage-objects as value to a dart map
  static Map<String, List<UserStatusSetCustomMessage>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusSetCustomMessage>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusSetCustomMessage.listFromJson(
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
