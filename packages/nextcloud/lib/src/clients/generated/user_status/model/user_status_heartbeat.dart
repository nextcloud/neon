//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusHeartbeat {
  /// Returns a new [UserStatusHeartbeat] instance.
  UserStatusHeartbeat({
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserStatusTypeEnum? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserStatusHeartbeat && other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'UserStatusHeartbeat[status=$status]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (status != null) {
      _json[r'status'] = status;
    }
    return _json;
  }

  /// Returns a new [UserStatusHeartbeat] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusHeartbeat? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusHeartbeat[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusHeartbeat[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusHeartbeat(
        status: UserStatusTypeEnum.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<UserStatusHeartbeat>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusHeartbeat>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusHeartbeat.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusHeartbeat> mapFromJson(dynamic json) {
    final map = <String, UserStatusHeartbeat>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusHeartbeat.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusHeartbeat-objects as value to a dart map
  static Map<String, List<UserStatusHeartbeat>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusHeartbeat>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusHeartbeat.listFromJson(
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
