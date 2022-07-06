//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource({
    this.core,
    this.extra,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? core;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? extra;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource &&
          other.core == core &&
          other.extra == extra;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (core == null ? 0 : core!.hashCode) + (extra == null ? 0 : extra!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource[core=$core, extra=$extra]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (core != null) {
      _json[r'core'] = core;
    }
    if (extra != null) {
      _json[r'extra'] = extra;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource(
        core: mapValueOfType<Object>(json, r'core'),
        extra: mapValueOfType<Object>(json, r'extra'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.listFromJson(
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
