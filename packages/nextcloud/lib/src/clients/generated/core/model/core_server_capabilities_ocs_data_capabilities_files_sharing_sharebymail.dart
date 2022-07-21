//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail({
    this.enabled,
    this.sendPasswordByMail,
    this.uploadFilesDrop,
    this.password,
    this.expireDate,
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
  bool? sendPasswordByMail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? uploadFilesDrop;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword? password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword? expireDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail &&
          other.enabled == enabled &&
          other.sendPasswordByMail == sendPasswordByMail &&
          other.uploadFilesDrop == uploadFilesDrop &&
          other.password == password &&
          other.expireDate == expireDate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enabled == null ? 0 : enabled!.hashCode) +
      (sendPasswordByMail == null ? 0 : sendPasswordByMail!.hashCode) +
      (uploadFilesDrop == null ? 0 : uploadFilesDrop!.hashCode) +
      (password == null ? 0 : password!.hashCode) +
      (expireDate == null ? 0 : expireDate!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail[enabled=$enabled, sendPasswordByMail=$sendPasswordByMail, uploadFilesDrop=$uploadFilesDrop, password=$password, expireDate=$expireDate]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (enabled != null) {
      _json[r'enabled'] = enabled;
    } else {
      _json[r'enabled'] = null;
    }
    if (sendPasswordByMail != null) {
      _json[r'send_password_by_mail'] = sendPasswordByMail;
    } else {
      _json[r'send_password_by_mail'] = null;
    }
    if (uploadFilesDrop != null) {
      _json[r'upload_files_drop'] = uploadFilesDrop;
    } else {
      _json[r'upload_files_drop'] = null;
    }
    if (password != null) {
      _json[r'password'] = password;
    } else {
      _json[r'password'] = null;
    }
    if (expireDate != null) {
      _json[r'expire_date'] = expireDate;
    } else {
      _json[r'expire_date'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        sendPasswordByMail: mapValueOfType<bool>(json, r'send_password_by_mail'),
        uploadFilesDrop:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(json[r'upload_files_drop']),
        password: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(json[r'password']),
        expireDate:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(json[r'expire_date']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.listFromJson(
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
