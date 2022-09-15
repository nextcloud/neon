//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OCSMeta {
  /// Returns a new [OCSMeta] instance.
  OCSMeta({
    this.status,
    this.statuscode,
    this.message,
    this.totalitems,
    this.itemsperpage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? statuscode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalitems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? itemsperpage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OCSMeta &&
          other.status == status &&
          other.statuscode == statuscode &&
          other.message == message &&
          other.totalitems == totalitems &&
          other.itemsperpage == itemsperpage;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (status == null ? 0 : status!.hashCode) +
      (statuscode == null ? 0 : statuscode!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (totalitems == null ? 0 : totalitems!.hashCode) +
      (itemsperpage == null ? 0 : itemsperpage!.hashCode);

  @override
  String toString() =>
      'OCSMeta[status=$status, statuscode=$statuscode, message=$message, totalitems=$totalitems, itemsperpage=$itemsperpage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.statuscode != null) {
      json[r'statuscode'] = this.statuscode;
    } else {
      json[r'statuscode'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.totalitems != null) {
      json[r'totalitems'] = this.totalitems;
    } else {
      json[r'totalitems'] = null;
    }
    if (this.itemsperpage != null) {
      json[r'itemsperpage'] = this.itemsperpage;
    } else {
      json[r'itemsperpage'] = null;
    }
    return json;
  }

  /// Returns a new [OCSMeta] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OCSMeta? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OCSMeta[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OCSMeta[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OCSMeta(
        status: mapValueOfType<String>(json, r'status'),
        statuscode: mapValueOfType<int>(json, r'statuscode'),
        message: mapValueOfType<String>(json, r'message'),
        totalitems: mapValueOfType<int>(json, r'totalitems'),
        itemsperpage: mapValueOfType<int>(json, r'itemsperpage'),
      );
    }
    return null;
  }

  static List<OCSMeta>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <OCSMeta>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OCSMeta.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OCSMeta> mapFromJson(dynamic json) {
    final map = <String, OCSMeta>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OCSMeta.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OCSMeta-objects as value to a dart map
  static Map<String, List<OCSMeta>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<OCSMeta>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OCSMeta.listFromJson(
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
