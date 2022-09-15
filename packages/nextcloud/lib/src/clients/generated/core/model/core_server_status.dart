//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerStatus {
  /// Returns a new [CoreServerStatus] instance.
  CoreServerStatus({
    this.installed,
    this.maintenance,
    this.needsDbUpgrade,
    this.version,
    this.versionstring,
    this.edition,
    this.productname,
    this.extendedSupport,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? installed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? maintenance;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? needsDbUpgrade;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? versionstring;

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
  String? productname;

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
      other is CoreServerStatus &&
          other.installed == installed &&
          other.maintenance == maintenance &&
          other.needsDbUpgrade == needsDbUpgrade &&
          other.version == version &&
          other.versionstring == versionstring &&
          other.edition == edition &&
          other.productname == productname &&
          other.extendedSupport == extendedSupport;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (installed == null ? 0 : installed!.hashCode) +
      (maintenance == null ? 0 : maintenance!.hashCode) +
      (needsDbUpgrade == null ? 0 : needsDbUpgrade!.hashCode) +
      (version == null ? 0 : version!.hashCode) +
      (versionstring == null ? 0 : versionstring!.hashCode) +
      (edition == null ? 0 : edition!.hashCode) +
      (productname == null ? 0 : productname!.hashCode) +
      (extendedSupport == null ? 0 : extendedSupport!.hashCode);

  @override
  String toString() =>
      'CoreServerStatus[installed=$installed, maintenance=$maintenance, needsDbUpgrade=$needsDbUpgrade, version=$version, versionstring=$versionstring, edition=$edition, productname=$productname, extendedSupport=$extendedSupport]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.installed != null) {
      json[r'installed'] = this.installed;
    } else {
      json[r'installed'] = null;
    }
    if (this.maintenance != null) {
      json[r'maintenance'] = this.maintenance;
    } else {
      json[r'maintenance'] = null;
    }
    if (this.needsDbUpgrade != null) {
      json[r'needsDbUpgrade'] = this.needsDbUpgrade;
    } else {
      json[r'needsDbUpgrade'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    if (this.versionstring != null) {
      json[r'versionstring'] = this.versionstring;
    } else {
      json[r'versionstring'] = null;
    }
    if (this.edition != null) {
      json[r'edition'] = this.edition;
    } else {
      json[r'edition'] = null;
    }
    if (this.productname != null) {
      json[r'productname'] = this.productname;
    } else {
      json[r'productname'] = null;
    }
    if (this.extendedSupport != null) {
      json[r'extendedSupport'] = this.extendedSupport;
    } else {
      json[r'extendedSupport'] = null;
    }
    return json;
  }

  /// Returns a new [CoreServerStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreServerStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreServerStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerStatus(
        installed: mapValueOfType<bool>(json, r'installed'),
        maintenance: mapValueOfType<bool>(json, r'maintenance'),
        needsDbUpgrade: mapValueOfType<bool>(json, r'needsDbUpgrade'),
        version: mapValueOfType<String>(json, r'version'),
        versionstring: mapValueOfType<String>(json, r'versionstring'),
        edition: mapValueOfType<String>(json, r'edition'),
        productname: mapValueOfType<String>(json, r'productname'),
        extendedSupport: mapValueOfType<bool>(json, r'extendedSupport'),
      );
    }
    return null;
  }

  static List<CoreServerStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerStatus> mapFromJson(dynamic json) {
    final map = <String, CoreServerStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerStatus-objects as value to a dart map
  static Map<String, List<CoreServerStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerStatus.listFromJson(
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
