//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols({
    this.webdav,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? webdav;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols && other.webdav == webdav;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (webdav == null ? 0 : webdav!.hashCode);

  @override
  String toString() => 'CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols[webdav=$webdav]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (webdav != null) {
      _json[r'webdav'] = webdav;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols(
        webdav: mapValueOfType<String>(json, r'webdav'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols> mapFromJson(
      dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesInnerProtocols.listFromJson(
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
