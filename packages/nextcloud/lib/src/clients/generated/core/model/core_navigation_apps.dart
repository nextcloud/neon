//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreNavigationApps {
  /// Returns a new [CoreNavigationApps] instance.
  CoreNavigationApps({
    this.ocs,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreNavigationAppsOcs? ocs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CoreNavigationApps && other.ocs == ocs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ocs == null ? 0 : ocs!.hashCode);

  @override
  String toString() => 'CoreNavigationApps[ocs=$ocs]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (ocs != null) {
      _json[r'ocs'] = ocs;
    }
    return _json;
  }

  /// Returns a new [CoreNavigationApps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreNavigationApps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreNavigationApps[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreNavigationApps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreNavigationApps(
        ocs: CoreNavigationAppsOcs.fromJson(json[r'ocs']),
      );
    }
    return null;
  }

  static List<CoreNavigationApps>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreNavigationApps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreNavigationApps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreNavigationApps> mapFromJson(dynamic json) {
    final map = <String, CoreNavigationApps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreNavigationApps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreNavigationApps-objects as value to a dart map
  static Map<String, List<CoreNavigationApps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreNavigationApps>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreNavigationApps.listFromJson(
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
