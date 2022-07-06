//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup({
    this.enabled,
    this.expireDate,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup &&
          other.enabled == enabled &&
          other.expireDate == expireDate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enabled == null ? 0 : enabled!.hashCode) + (expireDate == null ? 0 : expireDate!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup[enabled=$enabled, expireDate=$expireDate]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (enabled != null) {
      _json[r'enabled'] = enabled;
    }
    if (expireDate != null) {
      _json[r'expire_date'] = expireDate;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        expireDate:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(json[r'expire_date']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.listFromJson(
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
