//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi({
    this.version,
    this.accountPropertyScopesVersion,
    this.accountPropertyScopesFederatedEnabled,
    this.accountPropertyScopesPublishedEnabled,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? accountPropertyScopesVersion;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? accountPropertyScopesFederatedEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? accountPropertyScopesPublishedEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi &&
          other.version == version &&
          other.accountPropertyScopesVersion == accountPropertyScopesVersion &&
          other.accountPropertyScopesFederatedEnabled == accountPropertyScopesFederatedEnabled &&
          other.accountPropertyScopesPublishedEnabled == accountPropertyScopesPublishedEnabled;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (version == null ? 0 : version!.hashCode) +
      (accountPropertyScopesVersion == null ? 0 : accountPropertyScopesVersion!.hashCode) +
      (accountPropertyScopesFederatedEnabled == null ? 0 : accountPropertyScopesFederatedEnabled!.hashCode) +
      (accountPropertyScopesPublishedEnabled == null ? 0 : accountPropertyScopesPublishedEnabled!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi[version=$version, accountPropertyScopesVersion=$accountPropertyScopesVersion, accountPropertyScopesFederatedEnabled=$accountPropertyScopesFederatedEnabled, accountPropertyScopesPublishedEnabled=$accountPropertyScopesPublishedEnabled]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (version != null) {
      _json[r'version'] = version;
    } else {
      _json[r'version'] = null;
    }
    if (accountPropertyScopesVersion != null) {
      _json[r'AccountPropertyScopesVersion'] = accountPropertyScopesVersion;
    } else {
      _json[r'AccountPropertyScopesVersion'] = null;
    }
    if (accountPropertyScopesFederatedEnabled != null) {
      _json[r'AccountPropertyScopesFederatedEnabled'] = accountPropertyScopesFederatedEnabled;
    } else {
      _json[r'AccountPropertyScopesFederatedEnabled'] = null;
    }
    if (accountPropertyScopesPublishedEnabled != null) {
      _json[r'AccountPropertyScopesPublishedEnabled'] = accountPropertyScopesPublishedEnabled;
    } else {
      _json[r'AccountPropertyScopesPublishedEnabled'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi(
        version: mapValueOfType<String>(json, r'version'),
        accountPropertyScopesVersion: mapValueOfType<int>(json, r'AccountPropertyScopesVersion'),
        accountPropertyScopesFederatedEnabled: mapValueOfType<bool>(json, r'AccountPropertyScopesFederatedEnabled'),
        accountPropertyScopesPublishedEnabled: mapValueOfType<bool>(json, r'AccountPropertyScopesPublishedEnabled'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.listFromJson(
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
