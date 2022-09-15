//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusPublicUserStatus {
  /// Returns a new [UserStatusPublicUserStatus] instance.
  UserStatusPublicUserStatus({
    this.userId,
    this.message,
    this.icon,
    this.clearAt,
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

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
  String? icon;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? clearAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserStatusTypeEnum? status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatusPublicUserStatus &&
          other.userId == userId &&
          other.message == message &&
          other.icon == icon &&
          other.clearAt == clearAt &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId == null ? 0 : userId!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (icon == null ? 0 : icon!.hashCode) +
      (clearAt == null ? 0 : clearAt!.hashCode) +
      (status == null ? 0 : status!.hashCode);

  @override
  String toString() =>
      'UserStatusPublicUserStatus[userId=$userId, message=$message, icon=$icon, clearAt=$clearAt, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
    }
    if (this.clearAt != null) {
      json[r'clearAt'] = this.clearAt;
    } else {
      json[r'clearAt'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [UserStatusPublicUserStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusPublicUserStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusPublicUserStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusPublicUserStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusPublicUserStatus(
        userId: mapValueOfType<String>(json, r'userId'),
        message: mapValueOfType<String>(json, r'message'),
        icon: mapValueOfType<String>(json, r'icon'),
        clearAt: mapValueOfType<Object>(json, r'clearAt'),
        status: UserStatusTypeEnum.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<UserStatusPublicUserStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusPublicUserStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusPublicUserStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusPublicUserStatus> mapFromJson(dynamic json) {
    final map = <String, UserStatusPublicUserStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPublicUserStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusPublicUserStatus-objects as value to a dart map
  static Map<String, List<UserStatusPublicUserStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusPublicUserStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPublicUserStatus.listFromJson(
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
