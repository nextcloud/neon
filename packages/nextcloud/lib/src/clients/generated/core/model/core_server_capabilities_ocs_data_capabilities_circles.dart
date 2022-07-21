//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesCircles {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCircles] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesCircles({
    this.version,
    this.status,
    this.settings,
    this.circle,
    this.member,
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
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings? settings;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle? circle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember? member;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesCircles &&
          other.version == version &&
          other.status == status &&
          other.settings == settings &&
          other.circle == circle &&
          other.member == member;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (version == null ? 0 : version!.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (settings == null ? 0 : settings!.hashCode) +
      (circle == null ? 0 : circle!.hashCode) +
      (member == null ? 0 : member!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesCircles[version=$version, status=$status, settings=$settings, circle=$circle, member=$member]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (version != null) {
      _json[r'version'] = version;
    } else {
      _json[r'version'] = null;
    }
    if (status != null) {
      _json[r'status'] = status;
    } else {
      _json[r'status'] = null;
    }
    if (settings != null) {
      _json[r'settings'] = settings;
    } else {
      _json[r'settings'] = null;
    }
    if (circle != null) {
      _json[r'circle'] = circle;
    } else {
      _json[r'circle'] = null;
    }
    if (member != null) {
      _json[r'member'] = member;
    } else {
      _json[r'member'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesCircles] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesCircles? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCircles[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesCircles[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesCircles(
        version: mapValueOfType<String>(json, r'version'),
        status: CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus.fromJson(json[r'status']),
        settings: CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings.fromJson(json[r'settings']),
        circle: CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle.fromJson(json[r'circle']),
        member: CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember.fromJson(json[r'member']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesCircles>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesCircles> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesCircles>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesCircles-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesCircles.listFromJson(
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
