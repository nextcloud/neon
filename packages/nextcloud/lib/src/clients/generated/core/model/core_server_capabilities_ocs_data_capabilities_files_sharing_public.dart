//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic({
    this.enabled,
    this.password,
    this.expireDate,
    this.multipleLinks,
    this.expireDateInternal,
    this.expireDateRemote,
    this.sendMail,
    this.upload,
    this.uploadFilesDrop,
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
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword? password;

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
  bool? multipleLinks;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDateInternal;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDateRemote;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? sendMail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? upload;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? uploadFilesDrop;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic &&
          other.enabled == enabled &&
          other.password == password &&
          other.expireDate == expireDate &&
          other.multipleLinks == multipleLinks &&
          other.expireDateInternal == expireDateInternal &&
          other.expireDateRemote == expireDateRemote &&
          other.sendMail == sendMail &&
          other.upload == upload &&
          other.uploadFilesDrop == uploadFilesDrop;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enabled == null ? 0 : enabled!.hashCode) +
      (password == null ? 0 : password!.hashCode) +
      (expireDate == null ? 0 : expireDate!.hashCode) +
      (multipleLinks == null ? 0 : multipleLinks!.hashCode) +
      (expireDateInternal == null ? 0 : expireDateInternal!.hashCode) +
      (expireDateRemote == null ? 0 : expireDateRemote!.hashCode) +
      (sendMail == null ? 0 : sendMail!.hashCode) +
      (upload == null ? 0 : upload!.hashCode) +
      (uploadFilesDrop == null ? 0 : uploadFilesDrop!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic[enabled=$enabled, password=$password, expireDate=$expireDate, multipleLinks=$multipleLinks, expireDateInternal=$expireDateInternal, expireDateRemote=$expireDateRemote, sendMail=$sendMail, upload=$upload, uploadFilesDrop=$uploadFilesDrop]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.enabled != null) {
      json[r'enabled'] = this.enabled;
    } else {
      json[r'enabled'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.expireDate != null) {
      json[r'expire_date'] = this.expireDate;
    } else {
      json[r'expire_date'] = null;
    }
    if (this.multipleLinks != null) {
      json[r'multiple_links'] = this.multipleLinks;
    } else {
      json[r'multiple_links'] = null;
    }
    if (this.expireDateInternal != null) {
      json[r'expire_date_internal'] = this.expireDateInternal;
    } else {
      json[r'expire_date_internal'] = null;
    }
    if (this.expireDateRemote != null) {
      json[r'expire_date_remote'] = this.expireDateRemote;
    } else {
      json[r'expire_date_remote'] = null;
    }
    if (this.sendMail != null) {
      json[r'send_mail'] = this.sendMail;
    } else {
      json[r'send_mail'] = null;
    }
    if (this.upload != null) {
      json[r'upload'] = this.upload;
    } else {
      json[r'upload'] = null;
    }
    if (this.uploadFilesDrop != null) {
      json[r'upload_files_drop'] = this.uploadFilesDrop;
    } else {
      json[r'upload_files_drop'] = null;
    }
    return json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        password: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword.fromJson(json[r'password']),
        expireDate:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(json[r'expire_date']),
        multipleLinks: mapValueOfType<bool>(json, r'multiple_links'),
        expireDateInternal: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(
            json[r'expire_date_internal']),
        expireDateRemote:
            CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(json[r'expire_date_remote']),
        sendMail: mapValueOfType<bool>(json, r'send_mail'),
        upload: mapValueOfType<bool>(json, r'upload'),
        uploadFilesDrop: mapValueOfType<bool>(json, r'upload_files_drop'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.listFromJson(
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
