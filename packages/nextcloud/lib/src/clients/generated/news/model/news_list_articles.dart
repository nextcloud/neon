//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsListArticles {
  /// Returns a new [NewsListArticles] instance.
  NewsListArticles({
    this.items = const [],
  });

  List<NewsArticle> items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewsListArticles && other.items == items;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (items.hashCode);

  @override
  String toString() => 'NewsListArticles[items=$items]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'items'] = items;
    return _json;
  }

  /// Returns a new [NewsListArticles] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsListArticles? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsListArticles[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsListArticles[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsListArticles(
        items: NewsArticle.listFromJson(json[r'items']) ?? const [],
      );
    }
    return null;
  }

  static List<NewsListArticles>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsListArticles>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsListArticles.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsListArticles> mapFromJson(dynamic json) {
    final map = <String, NewsListArticles>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListArticles.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsListArticles-objects as value to a dart map
  static Map<String, List<NewsListArticles>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsListArticles>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListArticles.listFromJson(
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
