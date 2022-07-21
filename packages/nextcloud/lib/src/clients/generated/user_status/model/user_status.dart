//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatus {
  /// Returns a new [UserStatus] instance.
  UserStatus({
    this.userId,
    this.message,
    this.messageId,
    this.messageIsPredefined,
    this.icon,
    this.clearAt,
    this.status,
    this.statusIsUserDefined,
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
  String? messageId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? messageIsPredefined;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? statusIsUserDefined;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatus &&
          other.userId == userId &&
          other.message == message &&
          other.messageId == messageId &&
          other.messageIsPredefined == messageIsPredefined &&
          other.icon == icon &&
          other.clearAt == clearAt &&
          other.status == status &&
          other.statusIsUserDefined == statusIsUserDefined;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (userId == null ? 0 : userId!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (messageId == null ? 0 : messageId!.hashCode) +
      (messageIsPredefined == null ? 0 : messageIsPredefined!.hashCode) +
      (icon == null ? 0 : icon!.hashCode) +
      (clearAt == null ? 0 : clearAt!.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (statusIsUserDefined == null ? 0 : statusIsUserDefined!.hashCode);

  @override
  String toString() =>
      'UserStatus[userId=$userId, message=$message, messageId=$messageId, messageIsPredefined=$messageIsPredefined, icon=$icon, clearAt=$clearAt, status=$status, statusIsUserDefined=$statusIsUserDefined]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (userId != null) {
      _json[r'userId'] = userId;
    } else {
      _json[r'userId'] = null;
    }
    if (message != null) {
      _json[r'message'] = message;
    } else {
      _json[r'message'] = null;
    }
    if (messageId != null) {
      _json[r'messageId'] = messageId;
    } else {
      _json[r'messageId'] = null;
    }
    if (messageIsPredefined != null) {
      _json[r'messageIsPredefined'] = messageIsPredefined;
    } else {
      _json[r'messageIsPredefined'] = null;
    }
    if (icon != null) {
      _json[r'icon'] = icon;
    } else {
      _json[r'icon'] = null;
    }
    if (clearAt != null) {
      _json[r'clearAt'] = clearAt;
    } else {
      _json[r'clearAt'] = null;
    }
    if (status != null) {
      _json[r'status'] = status;
    } else {
      _json[r'status'] = null;
    }
    if (statusIsUserDefined != null) {
      _json[r'statusIsUserDefined'] = statusIsUserDefined;
    } else {
      _json[r'statusIsUserDefined'] = null;
    }
    return _json;
  }

  /// Returns a new [UserStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatus(
        userId: mapValueOfType<String>(json, r'userId'),
        message: mapValueOfType<String>(json, r'message'),
        messageId: mapValueOfType<String>(json, r'messageId'),
        messageIsPredefined: mapValueOfType<bool>(json, r'messageIsPredefined'),
        icon: mapValueOfType<String>(json, r'icon'),
        clearAt: mapValueOfType<Object>(json, r'clearAt'),
        status: UserStatusTypeEnum.fromJson(json[r'status']),
        statusIsUserDefined: mapValueOfType<bool>(json, r'statusIsUserDefined'),
      );
    }
    return null;
  }

  static List<UserStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatus> mapFromJson(dynamic json) {
    final map = <String, UserStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatus-objects as value to a dart map
  static Map<String, List<UserStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatus.listFromJson(
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
