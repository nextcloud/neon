//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProvisioningApiUserDetails {
  /// Returns a new [ProvisioningApiUserDetails] instance.
  ProvisioningApiUserDetails({
    this.storageLocation,
    this.id,
    this.lastLogin,
    this.backend,
    this.subadmin = const [],
    this.quota,
    this.avatarScope,
    this.email,
    this.emailScope,
    this.additionalMail = const [],
    this.additionalMailScope = const [],
    this.displayname,
    this.displaynameScope,
    this.phone,
    this.phoneScope,
    this.address,
    this.addressScope,
    this.website,
    this.websiteScope,
    this.twitter,
    this.twitterScope,
    this.organisation,
    this.organisationScope,
    this.role,
    this.roleScope,
    this.headline,
    this.headlineScope,
    this.biography,
    this.biographyScope,
    this.profileEnabled,
    this.profileEnabledScope,
    this.groups = const [],
    this.language,
    this.locale,
    this.notifyEmail,
    this.backendCapabilities,
    this.displayName,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageLocation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lastLogin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? backend;

  List<String> subadmin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProvisioningApiUserDetailsQuota? quota;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailScope;

  List<String> additionalMail;

  List<String> additionalMailScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayname;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displaynameScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phoneScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? addressScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? website;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? websiteScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? twitter;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? twitterScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organisation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? organisationScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? roleScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? headline;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? headlineScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? biography;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? biographyScope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? profileEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? profileEnabledScope;

  List<String> groups;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? language;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? locale;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notifyEmail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProvisioningApiUserDetailsBackendCapabilities? backendCapabilities;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvisioningApiUserDetails &&
          other.storageLocation == storageLocation &&
          other.id == id &&
          other.lastLogin == lastLogin &&
          other.backend == backend &&
          other.subadmin == subadmin &&
          other.quota == quota &&
          other.avatarScope == avatarScope &&
          other.email == email &&
          other.emailScope == emailScope &&
          other.additionalMail == additionalMail &&
          other.additionalMailScope == additionalMailScope &&
          other.displayname == displayname &&
          other.displaynameScope == displaynameScope &&
          other.phone == phone &&
          other.phoneScope == phoneScope &&
          other.address == address &&
          other.addressScope == addressScope &&
          other.website == website &&
          other.websiteScope == websiteScope &&
          other.twitter == twitter &&
          other.twitterScope == twitterScope &&
          other.organisation == organisation &&
          other.organisationScope == organisationScope &&
          other.role == role &&
          other.roleScope == roleScope &&
          other.headline == headline &&
          other.headlineScope == headlineScope &&
          other.biography == biography &&
          other.biographyScope == biographyScope &&
          other.profileEnabled == profileEnabled &&
          other.profileEnabledScope == profileEnabledScope &&
          other.groups == groups &&
          other.language == language &&
          other.locale == locale &&
          other.notifyEmail == notifyEmail &&
          other.backendCapabilities == backendCapabilities &&
          other.displayName == displayName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (storageLocation == null ? 0 : storageLocation!.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (lastLogin == null ? 0 : lastLogin!.hashCode) +
      (backend == null ? 0 : backend!.hashCode) +
      (subadmin.hashCode) +
      (quota == null ? 0 : quota!.hashCode) +
      (avatarScope == null ? 0 : avatarScope!.hashCode) +
      (email == null ? 0 : email!.hashCode) +
      (emailScope == null ? 0 : emailScope!.hashCode) +
      (additionalMail.hashCode) +
      (additionalMailScope.hashCode) +
      (displayname == null ? 0 : displayname!.hashCode) +
      (displaynameScope == null ? 0 : displaynameScope!.hashCode) +
      (phone == null ? 0 : phone!.hashCode) +
      (phoneScope == null ? 0 : phoneScope!.hashCode) +
      (address == null ? 0 : address!.hashCode) +
      (addressScope == null ? 0 : addressScope!.hashCode) +
      (website == null ? 0 : website!.hashCode) +
      (websiteScope == null ? 0 : websiteScope!.hashCode) +
      (twitter == null ? 0 : twitter!.hashCode) +
      (twitterScope == null ? 0 : twitterScope!.hashCode) +
      (organisation == null ? 0 : organisation!.hashCode) +
      (organisationScope == null ? 0 : organisationScope!.hashCode) +
      (role == null ? 0 : role!.hashCode) +
      (roleScope == null ? 0 : roleScope!.hashCode) +
      (headline == null ? 0 : headline!.hashCode) +
      (headlineScope == null ? 0 : headlineScope!.hashCode) +
      (biography == null ? 0 : biography!.hashCode) +
      (biographyScope == null ? 0 : biographyScope!.hashCode) +
      (profileEnabled == null ? 0 : profileEnabled!.hashCode) +
      (profileEnabledScope == null ? 0 : profileEnabledScope!.hashCode) +
      (groups.hashCode) +
      (language == null ? 0 : language!.hashCode) +
      (locale == null ? 0 : locale!.hashCode) +
      (notifyEmail == null ? 0 : notifyEmail!.hashCode) +
      (backendCapabilities == null ? 0 : backendCapabilities!.hashCode) +
      (displayName == null ? 0 : displayName!.hashCode);

  @override
  String toString() =>
      'ProvisioningApiUserDetails[storageLocation=$storageLocation, id=$id, lastLogin=$lastLogin, backend=$backend, subadmin=$subadmin, quota=$quota, avatarScope=$avatarScope, email=$email, emailScope=$emailScope, additionalMail=$additionalMail, additionalMailScope=$additionalMailScope, displayname=$displayname, displaynameScope=$displaynameScope, phone=$phone, phoneScope=$phoneScope, address=$address, addressScope=$addressScope, website=$website, websiteScope=$websiteScope, twitter=$twitter, twitterScope=$twitterScope, organisation=$organisation, organisationScope=$organisationScope, role=$role, roleScope=$roleScope, headline=$headline, headlineScope=$headlineScope, biography=$biography, biographyScope=$biographyScope, profileEnabled=$profileEnabled, profileEnabledScope=$profileEnabledScope, groups=$groups, language=$language, locale=$locale, notifyEmail=$notifyEmail, backendCapabilities=$backendCapabilities, displayName=$displayName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.storageLocation != null) {
      json[r'storageLocation'] = this.storageLocation;
    } else {
      json[r'storageLocation'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.lastLogin != null) {
      json[r'lastLogin'] = this.lastLogin;
    } else {
      json[r'lastLogin'] = null;
    }
    if (this.backend != null) {
      json[r'backend'] = this.backend;
    } else {
      json[r'backend'] = null;
    }
    json[r'subadmin'] = this.subadmin;
    if (this.quota != null) {
      json[r'quota'] = this.quota;
    } else {
      json[r'quota'] = null;
    }
    if (this.avatarScope != null) {
      json[r'avatarScope'] = this.avatarScope;
    } else {
      json[r'avatarScope'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.emailScope != null) {
      json[r'emailScope'] = this.emailScope;
    } else {
      json[r'emailScope'] = null;
    }
    json[r'additional_mail'] = this.additionalMail;
    json[r'additional_mailScope'] = this.additionalMailScope;
    if (this.displayname != null) {
      json[r'displayname'] = this.displayname;
    } else {
      json[r'displayname'] = null;
    }
    if (this.displaynameScope != null) {
      json[r'displaynameScope'] = this.displaynameScope;
    } else {
      json[r'displaynameScope'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.phoneScope != null) {
      json[r'phoneScope'] = this.phoneScope;
    } else {
      json[r'phoneScope'] = null;
    }
    if (this.address != null) {
      json[r'address'] = this.address;
    } else {
      json[r'address'] = null;
    }
    if (this.addressScope != null) {
      json[r'addressScope'] = this.addressScope;
    } else {
      json[r'addressScope'] = null;
    }
    if (this.website != null) {
      json[r'website'] = this.website;
    } else {
      json[r'website'] = null;
    }
    if (this.websiteScope != null) {
      json[r'websiteScope'] = this.websiteScope;
    } else {
      json[r'websiteScope'] = null;
    }
    if (this.twitter != null) {
      json[r'twitter'] = this.twitter;
    } else {
      json[r'twitter'] = null;
    }
    if (this.twitterScope != null) {
      json[r'twitterScope'] = this.twitterScope;
    } else {
      json[r'twitterScope'] = null;
    }
    if (this.organisation != null) {
      json[r'organisation'] = this.organisation;
    } else {
      json[r'organisation'] = null;
    }
    if (this.organisationScope != null) {
      json[r'organisationScope'] = this.organisationScope;
    } else {
      json[r'organisationScope'] = null;
    }
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.roleScope != null) {
      json[r'roleScope'] = this.roleScope;
    } else {
      json[r'roleScope'] = null;
    }
    if (this.headline != null) {
      json[r'headline'] = this.headline;
    } else {
      json[r'headline'] = null;
    }
    if (this.headlineScope != null) {
      json[r'headlineScope'] = this.headlineScope;
    } else {
      json[r'headlineScope'] = null;
    }
    if (this.biography != null) {
      json[r'biography'] = this.biography;
    } else {
      json[r'biography'] = null;
    }
    if (this.biographyScope != null) {
      json[r'biographyScope'] = this.biographyScope;
    } else {
      json[r'biographyScope'] = null;
    }
    if (this.profileEnabled != null) {
      json[r'profile_enabled'] = this.profileEnabled;
    } else {
      json[r'profile_enabled'] = null;
    }
    if (this.profileEnabledScope != null) {
      json[r'profile_enabledScope'] = this.profileEnabledScope;
    } else {
      json[r'profile_enabledScope'] = null;
    }
    json[r'groups'] = this.groups;
    if (this.language != null) {
      json[r'language'] = this.language;
    } else {
      json[r'language'] = null;
    }
    if (this.locale != null) {
      json[r'locale'] = this.locale;
    } else {
      json[r'locale'] = null;
    }
    if (this.notifyEmail != null) {
      json[r'notify_email'] = this.notifyEmail;
    } else {
      json[r'notify_email'] = null;
    }
    if (this.backendCapabilities != null) {
      json[r'backendCapabilities'] = this.backendCapabilities;
    } else {
      json[r'backendCapabilities'] = null;
    }
    if (this.displayName != null) {
      json[r'display-name'] = this.displayName;
    } else {
      json[r'display-name'] = null;
    }
    return json;
  }

  /// Returns a new [ProvisioningApiUserDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProvisioningApiUserDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProvisioningApiUserDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProvisioningApiUserDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProvisioningApiUserDetails(
        storageLocation: mapValueOfType<String>(json, r'storageLocation'),
        id: mapValueOfType<String>(json, r'id'),
        lastLogin: mapValueOfType<int>(json, r'lastLogin'),
        backend: mapValueOfType<String>(json, r'backend'),
        subadmin: json[r'subadmin'] is List ? (json[r'subadmin'] as List).cast<String>() : const [],
        quota: ProvisioningApiUserDetailsQuota.fromJson(json[r'quota']),
        avatarScope: mapValueOfType<String>(json, r'avatarScope'),
        email: mapValueOfType<String>(json, r'email'),
        emailScope: mapValueOfType<String>(json, r'emailScope'),
        additionalMail: json[r'additional_mail'] is List ? (json[r'additional_mail'] as List).cast<String>() : const [],
        additionalMailScope:
            json[r'additional_mailScope'] is List ? (json[r'additional_mailScope'] as List).cast<String>() : const [],
        displayname: mapValueOfType<String>(json, r'displayname'),
        displaynameScope: mapValueOfType<String>(json, r'displaynameScope'),
        phone: mapValueOfType<String>(json, r'phone'),
        phoneScope: mapValueOfType<String>(json, r'phoneScope'),
        address: mapValueOfType<String>(json, r'address'),
        addressScope: mapValueOfType<String>(json, r'addressScope'),
        website: mapValueOfType<String>(json, r'website'),
        websiteScope: mapValueOfType<String>(json, r'websiteScope'),
        twitter: mapValueOfType<String>(json, r'twitter'),
        twitterScope: mapValueOfType<String>(json, r'twitterScope'),
        organisation: mapValueOfType<String>(json, r'organisation'),
        organisationScope: mapValueOfType<String>(json, r'organisationScope'),
        role: mapValueOfType<String>(json, r'role'),
        roleScope: mapValueOfType<String>(json, r'roleScope'),
        headline: mapValueOfType<String>(json, r'headline'),
        headlineScope: mapValueOfType<String>(json, r'headlineScope'),
        biography: mapValueOfType<String>(json, r'biography'),
        biographyScope: mapValueOfType<String>(json, r'biographyScope'),
        profileEnabled: mapValueOfType<String>(json, r'profile_enabled'),
        profileEnabledScope: mapValueOfType<String>(json, r'profile_enabledScope'),
        groups: json[r'groups'] is List ? (json[r'groups'] as List).cast<String>() : const [],
        language: mapValueOfType<String>(json, r'language'),
        locale: mapValueOfType<String>(json, r'locale'),
        notifyEmail: mapValueOfType<String>(json, r'notify_email'),
        backendCapabilities: ProvisioningApiUserDetailsBackendCapabilities.fromJson(json[r'backendCapabilities']),
        displayName: mapValueOfType<String>(json, r'display-name'),
      );
    }
    return null;
  }

  static List<ProvisioningApiUserDetails>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProvisioningApiUserDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProvisioningApiUserDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProvisioningApiUserDetails> mapFromJson(dynamic json) {
    final map = <String, ProvisioningApiUserDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProvisioningApiUserDetails-objects as value to a dart map
  static Map<String, List<ProvisioningApiUserDetails>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProvisioningApiUserDetails>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetails.listFromJson(
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
