//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsFeed {
  /// Returns a new [NewsFeed] instance.
  NewsFeed({
    this.id,
    this.url,
    this.title,
    this.faviconLink,
    this.added,
    this.folderId,
    this.unreadCount,
    this.ordering,
    this.link,
    this.pinned,
    this.updateErrorCount,
    this.lastUpdateError,
    this.items = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? faviconLink;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? added;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? folderId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? unreadCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ordering;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? link;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? pinned;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updateErrorCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastUpdateError;

  List<NewsArticle> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsFeed &&
          other.id == id &&
          other.url == url &&
          other.title == title &&
          other.faviconLink == faviconLink &&
          other.added == added &&
          other.folderId == folderId &&
          other.unreadCount == unreadCount &&
          other.ordering == ordering &&
          other.link == link &&
          other.pinned == pinned &&
          other.updateErrorCount == updateErrorCount &&
          other.lastUpdateError == lastUpdateError &&
          other.items == items;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (url == null ? 0 : url!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (faviconLink == null ? 0 : faviconLink!.hashCode) +
      (added == null ? 0 : added!.hashCode) +
      (folderId == null ? 0 : folderId!.hashCode) +
      (unreadCount == null ? 0 : unreadCount!.hashCode) +
      (ordering == null ? 0 : ordering!.hashCode) +
      (link == null ? 0 : link!.hashCode) +
      (pinned == null ? 0 : pinned!.hashCode) +
      (updateErrorCount == null ? 0 : updateErrorCount!.hashCode) +
      (lastUpdateError == null ? 0 : lastUpdateError!.hashCode) +
      (items.hashCode);

  @override
  String toString() =>
      'NewsFeed[id=$id, url=$url, title=$title, faviconLink=$faviconLink, added=$added, folderId=$folderId, unreadCount=$unreadCount, ordering=$ordering, link=$link, pinned=$pinned, updateErrorCount=$updateErrorCount, lastUpdateError=$lastUpdateError, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.faviconLink != null) {
      json[r'faviconLink'] = this.faviconLink;
    } else {
      json[r'faviconLink'] = null;
    }
    if (this.added != null) {
      json[r'added'] = this.added;
    } else {
      json[r'added'] = null;
    }
    if (this.folderId != null) {
      json[r'folderId'] = this.folderId;
    } else {
      json[r'folderId'] = null;
    }
    if (this.unreadCount != null) {
      json[r'unreadCount'] = this.unreadCount;
    } else {
      json[r'unreadCount'] = null;
    }
    if (this.ordering != null) {
      json[r'ordering'] = this.ordering;
    } else {
      json[r'ordering'] = null;
    }
    if (this.link != null) {
      json[r'link'] = this.link;
    } else {
      json[r'link'] = null;
    }
    if (this.pinned != null) {
      json[r'pinned'] = this.pinned;
    } else {
      json[r'pinned'] = null;
    }
    if (this.updateErrorCount != null) {
      json[r'updateErrorCount'] = this.updateErrorCount;
    } else {
      json[r'updateErrorCount'] = null;
    }
    if (this.lastUpdateError != null) {
      json[r'lastUpdateError'] = this.lastUpdateError;
    } else {
      json[r'lastUpdateError'] = null;
    }
    json[r'items'] = this.items;
    return json;
  }

  /// Returns a new [NewsFeed] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsFeed? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsFeed[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsFeed[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsFeed(
        id: mapValueOfType<int>(json, r'id'),
        url: mapValueOfType<String>(json, r'url'),
        title: mapValueOfType<String>(json, r'title'),
        faviconLink: mapValueOfType<String>(json, r'faviconLink'),
        added: mapValueOfType<int>(json, r'added'),
        folderId: mapValueOfType<int>(json, r'folderId'),
        unreadCount: mapValueOfType<int>(json, r'unreadCount'),
        ordering: mapValueOfType<int>(json, r'ordering'),
        link: mapValueOfType<String>(json, r'link'),
        pinned: mapValueOfType<bool>(json, r'pinned'),
        updateErrorCount: mapValueOfType<int>(json, r'updateErrorCount'),
        lastUpdateError: mapValueOfType<String>(json, r'lastUpdateError'),
        items: NewsArticle.listFromJson(json[r'items']) ?? const [],
      );
    }
    return null;
  }

  static List<NewsFeed>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsFeed>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsFeed.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsFeed> mapFromJson(dynamic json) {
    final map = <String, NewsFeed>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsFeed.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsFeed-objects as value to a dart map
  static Map<String, List<NewsFeed>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsFeed>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsFeed.listFromJson(
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
