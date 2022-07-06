//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants({
    this.flags,
    this.source_,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? flags;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource? source_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants &&
          other.flags == flags &&
          other.source_ == source_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (flags == null ? 0 : flags!.hashCode) + (source_ == null ? 0 : source_!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants[flags=$flags, source_=$source_]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (flags != null) {
      _json[r'flags'] = flags;
    }
    if (source_ != null) {
      _json[r'source'] = source_;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants(
        flags: mapValueOfType<Object>(json, r'flags'),
        source_: CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(json[r'source']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.listFromJson(
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
