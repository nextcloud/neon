//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing({
    this.apiEnabled,
    this.public,
    this.resharing,
    this.user,
    this.groupSharing,
    this.group,
    this.defaultPermissions,
    this.federation,
    this.sharee,
    this.sharebymail,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? apiEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic? public;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? resharing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? groupSharing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup? group;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultPermissions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation? federation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee? sharee;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail? sharebymail;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing &&
          other.apiEnabled == apiEnabled &&
          other.public == public &&
          other.resharing == resharing &&
          other.user == user &&
          other.groupSharing == groupSharing &&
          other.group == group &&
          other.defaultPermissions == defaultPermissions &&
          other.federation == federation &&
          other.sharee == sharee &&
          other.sharebymail == sharebymail;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiEnabled == null ? 0 : apiEnabled!.hashCode) +
      (public == null ? 0 : public!.hashCode) +
      (resharing == null ? 0 : resharing!.hashCode) +
      (user == null ? 0 : user!.hashCode) +
      (groupSharing == null ? 0 : groupSharing!.hashCode) +
      (group == null ? 0 : group!.hashCode) +
      (defaultPermissions == null ? 0 : defaultPermissions!.hashCode) +
      (federation == null ? 0 : federation!.hashCode) +
      (sharee == null ? 0 : sharee!.hashCode) +
      (sharebymail == null ? 0 : sharebymail!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing[apiEnabled=$apiEnabled, public=$public, resharing=$resharing, user=$user, groupSharing=$groupSharing, group=$group, defaultPermissions=$defaultPermissions, federation=$federation, sharee=$sharee, sharebymail=$sharebymail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiEnabled != null) {
      json[r'api_enabled'] = this.apiEnabled;
    } else {
      json[r'api_enabled'] = null;
    }
    if (this.public != null) {
      json[r'public'] = this.public;
    } else {
      json[r'public'] = null;
    }
    if (this.resharing != null) {
      json[r'resharing'] = this.resharing;
    } else {
      json[r'resharing'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.groupSharing != null) {
      json[r'group_sharing'] = this.groupSharing;
    } else {
      json[r'group_sharing'] = null;
    }
    if (this.group != null) {
      json[r'group'] = this.group;
    } else {
      json[r'group'] = null;
    }
    if (this.defaultPermissions != null) {
      json[r'default_permissions'] = this.defaultPermissions;
    } else {
      json[r'default_permissions'] = null;
    }
    if (this.federation != null) {
      json[r'federation'] = this.federation;
    } else {
      json[r'federation'] = null;
    }
    if (this.sharee != null) {
      json[r'sharee'] = this.sharee;
    } else {
      json[r'sharee'] = null;
    }
    if (this.sharebymail != null) {
      json[r'sharebymail'] = this.sharebymail;
    } else {
      json[r'sharebymail'] = null;
    }
    return json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing(
        apiEnabled: mapValueOfType<bool>(json, r'api_enabled'),
        public: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(json[r'public']),
        resharing: mapValueOfType<bool>(json, r'resharing'),
        user: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser.fromJson(json[r'user']),
        groupSharing: mapValueOfType<bool>(json, r'group_sharing'),
        group: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(json[r'group']),
        defaultPermissions: mapValueOfType<int>(json, r'default_permissions'),
        federation: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(json[r'federation']),
        sharee: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee.fromJson(json[r'sharee']),
        sharebymail: CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(json[r'sharebymail']),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.listFromJson(
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
