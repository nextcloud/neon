//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PushNotificationDecryptedSubject {
  /// Returns a new [PushNotificationDecryptedSubject] instance.
  PushNotificationDecryptedSubject({
    this.nid,
    this.app,
    this.subject,
    this.type,
    this.id,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nid;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? app;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushNotificationDecryptedSubject &&
          other.nid == nid &&
          other.app == app &&
          other.subject == subject &&
          other.type == type &&
          other.id == id;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nid == null ? 0 : nid!.hashCode) +
      (app == null ? 0 : app!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'PushNotificationDecryptedSubject[nid=$nid, app=$app, subject=$subject, type=$type, id=$id]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (nid != null) {
      _json[r'nid'] = nid;
    }
    if (app != null) {
      _json[r'app'] = app;
    }
    if (subject != null) {
      _json[r'subject'] = subject;
    }
    if (type != null) {
      _json[r'type'] = type;
    }
    if (id != null) {
      _json[r'id'] = id;
    }
    return _json;
  }

  /// Returns a new [PushNotificationDecryptedSubject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PushNotificationDecryptedSubject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PushNotificationDecryptedSubject[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PushNotificationDecryptedSubject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PushNotificationDecryptedSubject(
        nid: mapValueOfType<int>(json, r'nid'),
        app: mapValueOfType<String>(json, r'app'),
        subject: mapValueOfType<String>(json, r'subject'),
        type: mapValueOfType<String>(json, r'type'),
        id: mapValueOfType<String>(json, r'id'),
      );
    }
    return null;
  }

  static List<PushNotificationDecryptedSubject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PushNotificationDecryptedSubject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PushNotificationDecryptedSubject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PushNotificationDecryptedSubject> mapFromJson(dynamic json) {
    final map = <String, PushNotificationDecryptedSubject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PushNotificationDecryptedSubject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PushNotificationDecryptedSubject-objects as value to a dart map
  static Map<String, List<PushNotificationDecryptedSubject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PushNotificationDecryptedSubject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PushNotificationDecryptedSubject.listFromJson(
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
