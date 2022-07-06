//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation({
    this.outgoing,
    this.incoming,
    this.expireDate,
    this.expireDateSupported,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? outgoing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? incoming;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDateSupported;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation &&
          other.outgoing == outgoing &&
          other.incoming == incoming &&
          other.expireDate == expireDate &&
          other.expireDateSupported == expireDateSupported;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (outgoing == null ? 0 : outgoing!.hashCode) +
      (incoming == null ? 0 : incoming!.hashCode) +
      (expireDate == null ? 0 : expireDate!.hashCode) +
      (expireDateSupported == null ? 0 : expireDateSupported!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation[outgoing=$outgoing, incoming=$incoming, expireDate=$expireDate, expireDateSupported=$expireDateSupported]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (outgoing != null) {
      _json[r'outgoing'] = outgoing;
    }
    if (incoming != null) {
      _json[r'incoming'] = incoming;
    }
    if (expireDate != null) {
      _json[r'expire_date'] = expireDate;
    }
    if (expireDateSupported != null) {
      _json[r'expire_date_supported'] = expireDateSupported;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation(
        outgoing: mapValueOfType<bool>(json, r'outgoing'),
        incoming: mapValueOfType<bool>(json, r'incoming'),
        expireDate:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(json[r'expire_date']),
        expireDateSupported: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(
            json[r'expire_date_supported']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.listFromJson(
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
