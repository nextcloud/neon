//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsPushServerDevice {
  /// Returns a new [NotificationsPushServerDevice] instance.
  NotificationsPushServerDevice({
    this.pushTokenHash,
    this.devicePublicKey,
    this.proxyServer,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pushTokenHash;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? devicePublicKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? proxyServer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsPushServerDevice &&
          other.pushTokenHash == pushTokenHash &&
          other.devicePublicKey == devicePublicKey &&
          other.proxyServer == proxyServer;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (pushTokenHash == null ? 0 : pushTokenHash!.hashCode) +
      (devicePublicKey == null ? 0 : devicePublicKey!.hashCode) +
      (proxyServer == null ? 0 : proxyServer!.hashCode);

  @override
  String toString() =>
      'NotificationsPushServerDevice[pushTokenHash=$pushTokenHash, devicePublicKey=$devicePublicKey, proxyServer=$proxyServer]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (pushTokenHash != null) {
      _json[r'pushTokenHash'] = pushTokenHash;
    } else {
      _json[r'pushTokenHash'] = null;
    }
    if (devicePublicKey != null) {
      _json[r'devicePublicKey'] = devicePublicKey;
    } else {
      _json[r'devicePublicKey'] = null;
    }
    if (proxyServer != null) {
      _json[r'proxyServer'] = proxyServer;
    } else {
      _json[r'proxyServer'] = null;
    }
    return _json;
  }

  /// Returns a new [NotificationsPushServerDevice] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsPushServerDevice? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotificationsPushServerDevice[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotificationsPushServerDevice[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsPushServerDevice(
        pushTokenHash: mapValueOfType<String>(json, r'pushTokenHash'),
        devicePublicKey: mapValueOfType<String>(json, r'devicePublicKey'),
        proxyServer: mapValueOfType<String>(json, r'proxyServer'),
      );
    }
    return null;
  }

  static List<NotificationsPushServerDevice>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsPushServerDevice>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsPushServerDevice.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsPushServerDevice> mapFromJson(dynamic json) {
    final map = <String, NotificationsPushServerDevice>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushServerDevice.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsPushServerDevice-objects as value to a dart map
  static Map<String, List<NotificationsPushServerDevice>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsPushServerDevice>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushServerDevice.listFromJson(
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
