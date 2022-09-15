//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesNotifications {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesNotifications] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesNotifications({
    this.ocsEndpoints = const [],
    this.push = const [],
    this.adminNotifications = const [],
  });

  List<String> ocsEndpoints;

  List<String> push;

  List<String> adminNotifications;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesNotifications &&
          other.ocsEndpoints == ocsEndpoints &&
          other.push == push &&
          other.adminNotifications == adminNotifications;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ocsEndpoints.hashCode) + (push.hashCode) + (adminNotifications.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesNotifications[ocsEndpoints=$ocsEndpoints, push=$push, adminNotifications=$adminNotifications]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'ocs-endpoints'] = this.ocsEndpoints;
    json[r'push'] = this.push;
    json[r'admin-notifications'] = this.adminNotifications;
    return json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesNotifications] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesNotifications? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesNotifications[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesNotifications[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesNotifications(
        ocsEndpoints: json[r'ocs-endpoints'] is List ? (json[r'ocs-endpoints'] as List).cast<String>() : const [],
        push: json[r'push'] is List ? (json[r'push'] as List).cast<String>() : const [],
        adminNotifications:
            json[r'admin-notifications'] is List ? (json[r'admin-notifications'] as List).cast<String>() : const [],
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesNotifications>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesNotifications> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesNotifications>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesNotifications-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesNotifications.listFromJson(
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
