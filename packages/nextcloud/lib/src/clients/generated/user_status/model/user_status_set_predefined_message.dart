//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusSetPredefinedMessage {
  /// Returns a new [UserStatusSetPredefinedMessage] instance.
  UserStatusSetPredefinedMessage({
    this.messageId,
    this.clearAt,
  });

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
  int? clearAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStatusSetPredefinedMessage && other.messageId == messageId && other.clearAt == clearAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (messageId == null ? 0 : messageId!.hashCode) + (clearAt == null ? 0 : clearAt!.hashCode);

  @override
  String toString() => 'UserStatusSetPredefinedMessage[messageId=$messageId, clearAt=$clearAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (messageId != null) {
      _json[r'messageId'] = messageId;
    } else {
      _json[r'messageId'] = null;
    }
    if (clearAt != null) {
      _json[r'clearAt'] = clearAt;
    } else {
      _json[r'clearAt'] = null;
    }
    return _json;
  }

  /// Returns a new [UserStatusSetPredefinedMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusSetPredefinedMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusSetPredefinedMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusSetPredefinedMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusSetPredefinedMessage(
        messageId: mapValueOfType<String>(json, r'messageId'),
        clearAt: mapValueOfType<int>(json, r'clearAt'),
      );
    }
    return null;
  }

  static List<UserStatusSetPredefinedMessage>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusSetPredefinedMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusSetPredefinedMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusSetPredefinedMessage> mapFromJson(dynamic json) {
    final map = <String, UserStatusSetPredefinedMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusSetPredefinedMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusSetPredefinedMessage-objects as value to a dart map
  static Map<String, List<UserStatusSetPredefinedMessage>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusSetPredefinedMessage>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusSetPredefinedMessage.listFromJson(
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
