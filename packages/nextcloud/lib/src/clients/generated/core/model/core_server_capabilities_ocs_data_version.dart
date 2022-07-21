//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataVersion {
  /// Returns a new [CoreServerCapabilitiesOcsDataVersion] instance.
  CoreServerCapabilitiesOcsDataVersion({
    this.major,
    this.minor,
    this.micro,
    this.string,
    this.edition,
    this.extendedSupport,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? major;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? micro;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? string;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? edition;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? extendedSupport;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataVersion &&
          other.major == major &&
          other.minor == minor &&
          other.micro == micro &&
          other.string == string &&
          other.edition == edition &&
          other.extendedSupport == extendedSupport;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (major == null ? 0 : major!.hashCode) +
      (minor == null ? 0 : minor!.hashCode) +
      (micro == null ? 0 : micro!.hashCode) +
      (string == null ? 0 : string!.hashCode) +
      (edition == null ? 0 : edition!.hashCode) +
      (extendedSupport == null ? 0 : extendedSupport!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataVersion[major=$major, minor=$minor, micro=$micro, string=$string, edition=$edition, extendedSupport=$extendedSupport]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (major != null) {
      _json[r'major'] = major;
    } else {
      _json[r'major'] = null;
    }
    if (minor != null) {
      _json[r'minor'] = minor;
    } else {
      _json[r'minor'] = null;
    }
    if (micro != null) {
      _json[r'micro'] = micro;
    } else {
      _json[r'micro'] = null;
    }
    if (string != null) {
      _json[r'string'] = string;
    } else {
      _json[r'string'] = null;
    }
    if (edition != null) {
      _json[r'edition'] = edition;
    } else {
      _json[r'edition'] = null;
    }
    if (extendedSupport != null) {
      _json[r'extendedSupport'] = extendedSupport;
    } else {
      _json[r'extendedSupport'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataVersion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataVersion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(
              json.containsKey(key), 'Required key "CoreServerCapabilitiesOcsDataVersion[$key]" is missing from JSON.');
          assert(
              json[key] != null, 'Required key "CoreServerCapabilitiesOcsDataVersion[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataVersion(
        major: mapValueOfType<int>(json, r'major'),
        minor: mapValueOfType<int>(json, r'minor'),
        micro: mapValueOfType<int>(json, r'micro'),
        string: mapValueOfType<String>(json, r'string'),
        edition: mapValueOfType<String>(json, r'edition'),
        extendedSupport: mapValueOfType<bool>(json, r'extendedSupport'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataVersion>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataVersion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataVersion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataVersion> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataVersion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataVersion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataVersion-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataVersion>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataVersion>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataVersion.listFromJson(
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
