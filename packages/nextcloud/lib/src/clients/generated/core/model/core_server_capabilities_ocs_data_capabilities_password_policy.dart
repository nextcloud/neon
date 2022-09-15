//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy({
    this.minLength,
    this.enforceNonCommonPassword,
    this.enforceNumericCharacters,
    this.enforceSpecialCharacters,
    this.enforceUpperLowerCase,
    this.api,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minLength;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enforceNonCommonPassword;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enforceNumericCharacters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enforceSpecialCharacters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enforceUpperLowerCase;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi? api;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy &&
          other.minLength == minLength &&
          other.enforceNonCommonPassword == enforceNonCommonPassword &&
          other.enforceNumericCharacters == enforceNumericCharacters &&
          other.enforceSpecialCharacters == enforceSpecialCharacters &&
          other.enforceUpperLowerCase == enforceUpperLowerCase &&
          other.api == api;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minLength == null ? 0 : minLength!.hashCode) +
      (enforceNonCommonPassword == null ? 0 : enforceNonCommonPassword!.hashCode) +
      (enforceNumericCharacters == null ? 0 : enforceNumericCharacters!.hashCode) +
      (enforceSpecialCharacters == null ? 0 : enforceSpecialCharacters!.hashCode) +
      (enforceUpperLowerCase == null ? 0 : enforceUpperLowerCase!.hashCode) +
      (api == null ? 0 : api!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy[minLength=$minLength, enforceNonCommonPassword=$enforceNonCommonPassword, enforceNumericCharacters=$enforceNumericCharacters, enforceSpecialCharacters=$enforceSpecialCharacters, enforceUpperLowerCase=$enforceUpperLowerCase, api=$api]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.minLength != null) {
      json[r'minLength'] = this.minLength;
    } else {
      json[r'minLength'] = null;
    }
    if (this.enforceNonCommonPassword != null) {
      json[r'enforceNonCommonPassword'] = this.enforceNonCommonPassword;
    } else {
      json[r'enforceNonCommonPassword'] = null;
    }
    if (this.enforceNumericCharacters != null) {
      json[r'enforceNumericCharacters'] = this.enforceNumericCharacters;
    } else {
      json[r'enforceNumericCharacters'] = null;
    }
    if (this.enforceSpecialCharacters != null) {
      json[r'enforceSpecialCharacters'] = this.enforceSpecialCharacters;
    } else {
      json[r'enforceSpecialCharacters'] = null;
    }
    if (this.enforceUpperLowerCase != null) {
      json[r'enforceUpperLowerCase'] = this.enforceUpperLowerCase;
    } else {
      json[r'enforceUpperLowerCase'] = null;
    }
    if (this.api != null) {
      json[r'api'] = this.api;
    } else {
      json[r'api'] = null;
    }
    return json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy(
        minLength: mapValueOfType<int>(json, r'minLength'),
        enforceNonCommonPassword: mapValueOfType<bool>(json, r'enforceNonCommonPassword'),
        enforceNumericCharacters: mapValueOfType<bool>(json, r'enforceNumericCharacters'),
        enforceSpecialCharacters: mapValueOfType<bool>(json, r'enforceSpecialCharacters'),
        enforceUpperLowerCase: mapValueOfType<bool>(json, r'enforceUpperLowerCase'),
        api: CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi.fromJson(json[r'api']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.listFromJson(
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
