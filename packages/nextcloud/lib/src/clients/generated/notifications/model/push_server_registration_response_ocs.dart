//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PushServerRegistrationResponseOcs {
  /// Returns a new [PushServerRegistrationResponseOcs] instance.
  PushServerRegistrationResponseOcs({
    this.meta,
    this.data,
  });

  /// Stub
  Object? meta;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PushServerSubscription? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PushServerRegistrationResponseOcs && other.meta == meta && other.data == data;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (meta == null ? 0 : meta!.hashCode) + (data == null ? 0 : data!.hashCode);

  @override
  String toString() => 'PushServerRegistrationResponseOcs[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (meta != null) {
      _json[r'meta'] = meta;
    }
    if (data != null) {
      _json[r'data'] = data;
    }
    return _json;
  }

  /// Returns a new [PushServerRegistrationResponseOcs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PushServerRegistrationResponseOcs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PushServerRegistrationResponseOcs[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PushServerRegistrationResponseOcs[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PushServerRegistrationResponseOcs(
        meta: mapValueOfType<Object>(json, r'meta'),
        data: PushServerSubscription.fromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<PushServerRegistrationResponseOcs>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PushServerRegistrationResponseOcs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PushServerRegistrationResponseOcs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PushServerRegistrationResponseOcs> mapFromJson(dynamic json) {
    final map = <String, PushServerRegistrationResponseOcs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PushServerRegistrationResponseOcs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PushServerRegistrationResponseOcs-objects as value to a dart map
  static Map<String, List<PushServerRegistrationResponseOcs>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PushServerRegistrationResponseOcs>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PushServerRegistrationResponseOcs.listFromJson(
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
