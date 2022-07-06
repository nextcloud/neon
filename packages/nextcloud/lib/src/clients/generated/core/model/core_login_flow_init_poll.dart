//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreLoginFlowInitPoll {
  /// Returns a new [CoreLoginFlowInitPoll] instance.
  CoreLoginFlowInitPoll({
    this.token,
    this.endpoint,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? token;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endpoint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CoreLoginFlowInitPoll && other.token == token && other.endpoint == endpoint;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (token == null ? 0 : token!.hashCode) + (endpoint == null ? 0 : endpoint!.hashCode);

  @override
  String toString() => 'CoreLoginFlowInitPoll[token=$token, endpoint=$endpoint]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (token != null) {
      _json[r'token'] = token;
    }
    if (endpoint != null) {
      _json[r'endpoint'] = endpoint;
    }
    return _json;
  }

  /// Returns a new [CoreLoginFlowInitPoll] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreLoginFlowInitPoll? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreLoginFlowInitPoll[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreLoginFlowInitPoll[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreLoginFlowInitPoll(
        token: mapValueOfType<String>(json, r'token'),
        endpoint: mapValueOfType<String>(json, r'endpoint'),
      );
    }
    return null;
  }

  static List<CoreLoginFlowInitPoll>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreLoginFlowInitPoll>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreLoginFlowInitPoll.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreLoginFlowInitPoll> mapFromJson(dynamic json) {
    final map = <String, CoreLoginFlowInitPoll>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowInitPoll.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreLoginFlowInitPoll-objects as value to a dart map
  static Map<String, List<CoreLoginFlowInitPoll>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreLoginFlowInitPoll>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowInitPoll.listFromJson(
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
