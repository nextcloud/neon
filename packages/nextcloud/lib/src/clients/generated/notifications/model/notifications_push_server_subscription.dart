//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsPushServerSubscription {
  /// Returns a new [NotificationsPushServerSubscription] instance.
  NotificationsPushServerSubscription({
    this.publicKey,
    this.deviceIdentifier,
    this.signature,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? publicKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deviceIdentifier;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? signature;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsPushServerSubscription &&
          other.publicKey == publicKey &&
          other.deviceIdentifier == deviceIdentifier &&
          other.signature == signature;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (publicKey == null ? 0 : publicKey!.hashCode) +
      (deviceIdentifier == null ? 0 : deviceIdentifier!.hashCode) +
      (signature == null ? 0 : signature!.hashCode);

  @override
  String toString() =>
      'NotificationsPushServerSubscription[publicKey=$publicKey, deviceIdentifier=$deviceIdentifier, signature=$signature]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.publicKey != null) {
      json[r'publicKey'] = this.publicKey;
    } else {
      json[r'publicKey'] = null;
    }
    if (this.deviceIdentifier != null) {
      json[r'deviceIdentifier'] = this.deviceIdentifier;
    } else {
      json[r'deviceIdentifier'] = null;
    }
    if (this.signature != null) {
      json[r'signature'] = this.signature;
    } else {
      json[r'signature'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationsPushServerSubscription] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsPushServerSubscription? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(
              json.containsKey(key), 'Required key "NotificationsPushServerSubscription[$key]" is missing from JSON.');
          assert(
              json[key] != null, 'Required key "NotificationsPushServerSubscription[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsPushServerSubscription(
        publicKey: mapValueOfType<String>(json, r'publicKey'),
        deviceIdentifier: mapValueOfType<String>(json, r'deviceIdentifier'),
        signature: mapValueOfType<String>(json, r'signature'),
      );
    }
    return null;
  }

  static List<NotificationsPushServerSubscription>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsPushServerSubscription>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsPushServerSubscription.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsPushServerSubscription> mapFromJson(dynamic json) {
    final map = <String, NotificationsPushServerSubscription>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushServerSubscription.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsPushServerSubscription-objects as value to a dart map
  static Map<String, List<NotificationsPushServerSubscription>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsPushServerSubscription>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushServerSubscription.listFromJson(
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
