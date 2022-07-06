//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsListFeeds {
  /// Returns a new [NewsListFeeds] instance.
  NewsListFeeds({
    this.starredCount,
    this.newestItemId,
    this.feeds = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? starredCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? newestItemId;

  List<NewsFeed> feeds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsListFeeds &&
          other.starredCount == starredCount &&
          other.newestItemId == newestItemId &&
          other.feeds == feeds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (starredCount == null ? 0 : starredCount!.hashCode) +
      (newestItemId == null ? 0 : newestItemId!.hashCode) +
      (feeds.hashCode);

  @override
  String toString() => 'NewsListFeeds[starredCount=$starredCount, newestItemId=$newestItemId, feeds=$feeds]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (starredCount != null) {
      _json[r'starredCount'] = starredCount;
    }
    if (newestItemId != null) {
      _json[r'newestItemId'] = newestItemId;
    }
    _json[r'feeds'] = feeds;
    return _json;
  }

  /// Returns a new [NewsListFeeds] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsListFeeds? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsListFeeds[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsListFeeds[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsListFeeds(
        starredCount: mapValueOfType<int>(json, r'starredCount'),
        newestItemId: mapValueOfType<int>(json, r'newestItemId'),
        feeds: NewsFeed.listFromJson(json[r'feeds']) ?? const [],
      );
    }
    return null;
  }

  static List<NewsListFeeds>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsListFeeds>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsListFeeds.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsListFeeds> mapFromJson(dynamic json) {
    final map = <String, NewsListFeeds>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListFeeds.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsListFeeds-objects as value to a dart map
  static Map<String, List<NewsListFeeds>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsListFeeds>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListFeeds.listFromJson(
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
