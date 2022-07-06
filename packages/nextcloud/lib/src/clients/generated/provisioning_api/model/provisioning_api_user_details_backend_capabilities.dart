//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProvisioningApiUserDetailsBackendCapabilities {
  /// Returns a new [ProvisioningApiUserDetailsBackendCapabilities] instance.
  ProvisioningApiUserDetailsBackendCapabilities({
    this.setDisplayName,
    this.setPassword,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? setDisplayName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? setPassword;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvisioningApiUserDetailsBackendCapabilities &&
          other.setDisplayName == setDisplayName &&
          other.setPassword == setPassword;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (setDisplayName == null ? 0 : setDisplayName!.hashCode) + (setPassword == null ? 0 : setPassword!.hashCode);

  @override
  String toString() =>
      'ProvisioningApiUserDetailsBackendCapabilities[setDisplayName=$setDisplayName, setPassword=$setPassword]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (setDisplayName != null) {
      _json[r'setDisplayName'] = setDisplayName;
    }
    if (setPassword != null) {
      _json[r'setPassword'] = setPassword;
    }
    return _json;
  }

  /// Returns a new [ProvisioningApiUserDetailsBackendCapabilities] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProvisioningApiUserDetailsBackendCapabilities? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProvisioningApiUserDetailsBackendCapabilities[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProvisioningApiUserDetailsBackendCapabilities[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProvisioningApiUserDetailsBackendCapabilities(
        setDisplayName: mapValueOfType<bool>(json, r'setDisplayName'),
        setPassword: mapValueOfType<bool>(json, r'setPassword'),
      );
    }
    return null;
  }

  static List<ProvisioningApiUserDetailsBackendCapabilities>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProvisioningApiUserDetailsBackendCapabilities>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProvisioningApiUserDetailsBackendCapabilities.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProvisioningApiUserDetailsBackendCapabilities> mapFromJson(dynamic json) {
    final map = <String, ProvisioningApiUserDetailsBackendCapabilities>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetailsBackendCapabilities.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProvisioningApiUserDetailsBackendCapabilities-objects as value to a dart map
  static Map<String, List<ProvisioningApiUserDetailsBackendCapabilities>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProvisioningApiUserDetailsBackendCapabilities>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetailsBackendCapabilities.listFromJson(
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
