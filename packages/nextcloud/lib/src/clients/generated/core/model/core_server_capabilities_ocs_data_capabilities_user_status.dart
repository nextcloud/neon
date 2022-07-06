//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesUserStatus {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesUserStatus] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesUserStatus({
    this.enabled,
    this.supportsEmoji,
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
  bool? supportsEmoji;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesUserStatus &&
          other.enabled == enabled &&
          other.supportsEmoji == supportsEmoji;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enabled == null ? 0 : enabled!.hashCode) + (supportsEmoji == null ? 0 : supportsEmoji!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesUserStatus[enabled=$enabled, supportsEmoji=$supportsEmoji]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (enabled != null) {
      _json[r'enabled'] = enabled;
    }
    if (supportsEmoji != null) {
      _json[r'supports_emoji'] = supportsEmoji;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesUserStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesUserStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesUserStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesUserStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesUserStatus(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        supportsEmoji: mapValueOfType<bool>(json, r'supports_emoji'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesUserStatus> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesUserStatus-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.listFromJson(
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
