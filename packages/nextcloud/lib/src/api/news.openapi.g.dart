// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsSupportedAPIVersions> _$newsSupportedAPIVersionsSerializer = _$NewsSupportedAPIVersionsSerializer();
Serializer<NewsArticle> _$newsArticleSerializer = _$NewsArticleSerializer();
Serializer<NewsFeed> _$newsFeedSerializer = _$NewsFeedSerializer();
Serializer<NewsFolder> _$newsFolderSerializer = _$NewsFolderSerializer();
Serializer<NewsListFolders> _$newsListFoldersSerializer = _$NewsListFoldersSerializer();
Serializer<NewsListFeeds> _$newsListFeedsSerializer = _$NewsListFeedsSerializer();
Serializer<NewsListArticles> _$newsListArticlesSerializer = _$NewsListArticlesSerializer();
Serializer<NewsOCSMeta> _$newsOCSMetaSerializer = _$NewsOCSMetaSerializer();
Serializer<NewsEmptyOCS_Ocs> _$newsEmptyOCSOcsSerializer = _$NewsEmptyOCS_OcsSerializer();
Serializer<NewsEmptyOCS> _$newsEmptyOCSSerializer = _$NewsEmptyOCSSerializer();

class _$NewsSupportedAPIVersionsSerializer implements StructuredSerializer<NewsSupportedAPIVersions> {
  @override
  final Iterable<Type> types = const [NewsSupportedAPIVersions, _$NewsSupportedAPIVersions];
  @override
  final String wireName = 'NewsSupportedAPIVersions';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsSupportedAPIVersions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiLevels;
    if (value != null) {
      result
        ..add('apiLevels')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NewsSupportedAPIVersions deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsSupportedAPIVersionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apiLevels':
          result.apiLevels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsArticleSerializer implements StructuredSerializer<NewsArticle> {
  @override
  final Iterable<Type> types = const [NewsArticle, _$NewsArticle];
  @override
  final String wireName = 'NewsArticle';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsArticle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'guid',
      serializers.serialize(object.guid, specifiedType: const FullType(String)),
      'guidHash',
      serializers.serialize(object.guidHash, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'pubDate',
      serializers.serialize(object.pubDate, specifiedType: const FullType(int)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'feedId',
      serializers.serialize(object.feedId, specifiedType: const FullType(int)),
      'unread',
      serializers.serialize(object.unread, specifiedType: const FullType(bool)),
      'starred',
      serializers.serialize(object.starred, specifiedType: const FullType(bool)),
      'lastModified',
      serializers.serialize(object.lastModified, specifiedType: const FullType(int)),
      'rtl',
      serializers.serialize(object.rtl, specifiedType: const FullType(bool)),
      'fingerprint',
      serializers.serialize(object.fingerprint, specifiedType: const FullType(String)),
      'contentHash',
      serializers.serialize(object.contentHash, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updatedDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enclosureMime;
    if (value != null) {
      result
        ..add('enclosureMime')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.enclosureLink;
    if (value != null) {
      result
        ..add('enclosureLink')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.mediaThumbnail;
    if (value != null) {
      result
        ..add('mediaThumbnail')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.mediaDescription;
    if (value != null) {
      result
        ..add('mediaDescription')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NewsArticle deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'guid':
          result.guid = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'guidHash':
          result.guidHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'pubDate':
          result.pubDate = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'updatedDate':
          result.updatedDate = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'body':
          result.body = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'enclosureMime':
          result.enclosureMime = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'enclosureLink':
          result.enclosureLink = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'mediaThumbnail':
          result.mediaThumbnail = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'mediaDescription':
          result.mediaDescription = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'feedId':
          result.feedId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'unread':
          result.unread = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'starred':
          result.starred = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'rtl':
          result.rtl = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'fingerprint':
          result.fingerprint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'contentHash':
          result.contentHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsFeedSerializer implements StructuredSerializer<NewsFeed> {
  @override
  final Iterable<Type> types = const [NewsFeed, _$NewsFeed];
  @override
  final String wireName = 'NewsFeed';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsFeed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'added',
      serializers.serialize(object.added, specifiedType: const FullType(int)),
      'ordering',
      serializers.serialize(object.ordering, specifiedType: const FullType(int)),
      'pinned',
      serializers.serialize(object.pinned, specifiedType: const FullType(bool)),
      'updateErrorCount',
      serializers.serialize(object.updateErrorCount, specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(NewsArticle)])),
    ];
    Object? value;
    value = object.faviconLink;
    if (value != null) {
      result
        ..add('faviconLink')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.folderId;
    if (value != null) {
      result
        ..add('folderId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.unreadCount;
    if (value != null) {
      result
        ..add('unreadCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lastUpdateError;
    if (value != null) {
      result
        ..add('lastUpdateError')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NewsFeed deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsFeedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'faviconLink':
          result.faviconLink = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'added':
          result.added = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'folderId':
          result.folderId = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'unreadCount':
          result.unreadCount = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'ordering':
          result.ordering = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'pinned':
          result.pinned = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'updateErrorCount':
          result.updateErrorCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'lastUpdateError':
          result.lastUpdateError = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NewsArticle)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsFolderSerializer implements StructuredSerializer<NewsFolder> {
  @override
  final Iterable<Type> types = const [NewsFolder, _$NewsFolder];
  @override
  final String wireName = 'NewsFolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsFolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'opened',
      serializers.serialize(object.opened, specifiedType: const FullType(bool)),
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(NewsFeed)])),
    ];

    return result;
  }

  @override
  NewsFolder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsFolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'opened':
          result.opened = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'feeds':
          result.feeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NewsFeed)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsListFoldersSerializer implements StructuredSerializer<NewsListFolders> {
  @override
  final Iterable<Type> types = const [NewsListFolders, _$NewsListFolders];
  @override
  final String wireName = 'NewsListFolders';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsListFolders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'folders',
      serializers.serialize(object.folders, specifiedType: const FullType(BuiltList, [FullType(NewsFolder)])),
    ];

    return result;
  }

  @override
  NewsListFolders deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsListFoldersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folders':
          result.folders.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NewsFolder)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsListFeedsSerializer implements StructuredSerializer<NewsListFeeds> {
  @override
  final Iterable<Type> types = const [NewsListFeeds, _$NewsListFeeds];
  @override
  final String wireName = 'NewsListFeeds';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsListFeeds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(NewsFeed)])),
    ];
    Object? value;
    value = object.starredCount;
    if (value != null) {
      result
        ..add('starredCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.newestItemId;
    if (value != null) {
      result
        ..add('newestItemId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NewsListFeeds deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsListFeedsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'starredCount':
          result.starredCount = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'newestItemId':
          result.newestItemId = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'feeds':
          result.feeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NewsFeed)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsListArticlesSerializer implements StructuredSerializer<NewsListArticles> {
  @override
  final Iterable<Type> types = const [NewsListArticles, _$NewsListArticles];
  @override
  final String wireName = 'NewsListArticles';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsListArticles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(NewsArticle)])),
    ];

    return result;
  }

  @override
  NewsListArticles deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsListArticlesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NewsArticle)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsOCSMetaSerializer implements StructuredSerializer<NewsOCSMeta> {
  @override
  final Iterable<Type> types = const [NewsOCSMeta, _$NewsOCSMeta];
  @override
  final String wireName = 'NewsOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsOCSMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NewsOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsOCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsEmptyOCS_OcsSerializer implements StructuredSerializer<NewsEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [NewsEmptyOCS_Ocs, _$NewsEmptyOCS_Ocs];
  @override
  final String wireName = 'NewsEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NewsOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  NewsEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta
              .replace(serializers.deserialize(value, specifiedType: const FullType(NewsOCSMeta))! as NewsOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsEmptyOCSSerializer implements StructuredSerializer<NewsEmptyOCS> {
  @override
  final Iterable<Type> types = const [NewsEmptyOCS, _$NewsEmptyOCS];
  @override
  final String wireName = 'NewsEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NewsEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  NewsEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NewsEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NewsEmptyOCS_Ocs))! as NewsEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class NewsSupportedAPIVersionsInterfaceBuilder {
  void replace(NewsSupportedAPIVersionsInterface other);
  void update(void Function(NewsSupportedAPIVersionsInterfaceBuilder) updates);
  ListBuilder<String> get apiLevels;
  set apiLevels(ListBuilder<String>? apiLevels);
}

class _$NewsSupportedAPIVersions extends NewsSupportedAPIVersions {
  @override
  final BuiltList<String>? apiLevels;

  factory _$NewsSupportedAPIVersions([void Function(NewsSupportedAPIVersionsBuilder)? updates]) =>
      (NewsSupportedAPIVersionsBuilder()..update(updates))._build();

  _$NewsSupportedAPIVersions._({this.apiLevels}) : super._();

  @override
  NewsSupportedAPIVersions rebuild(void Function(NewsSupportedAPIVersionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsSupportedAPIVersionsBuilder toBuilder() => NewsSupportedAPIVersionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsSupportedAPIVersions && apiLevels == other.apiLevels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiLevels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsSupportedAPIVersions')..add('apiLevels', apiLevels)).toString();
  }
}

class NewsSupportedAPIVersionsBuilder
    implements
        Builder<NewsSupportedAPIVersions, NewsSupportedAPIVersionsBuilder>,
        NewsSupportedAPIVersionsInterfaceBuilder {
  _$NewsSupportedAPIVersions? _$v;

  ListBuilder<String>? _apiLevels;
  ListBuilder<String> get apiLevels => _$this._apiLevels ??= ListBuilder<String>();
  set apiLevels(covariant ListBuilder<String>? apiLevels) => _$this._apiLevels = apiLevels;

  NewsSupportedAPIVersionsBuilder();

  NewsSupportedAPIVersionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiLevels = $v.apiLevels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsSupportedAPIVersions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsSupportedAPIVersions;
  }

  @override
  void update(void Function(NewsSupportedAPIVersionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsSupportedAPIVersions build() => _build();

  _$NewsSupportedAPIVersions _build() {
    _$NewsSupportedAPIVersions _$result;
    try {
      _$result = _$v ?? _$NewsSupportedAPIVersions._(apiLevels: _apiLevels?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiLevels';
        _apiLevels?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsSupportedAPIVersions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsArticleInterfaceBuilder {
  void replace(NewsArticleInterface other);
  void update(void Function(NewsArticleInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get guid;
  set guid(String? guid);

  String? get guidHash;
  set guidHash(String? guidHash);

  String? get url;
  set url(String? url);

  String? get title;
  set title(String? title);

  String? get author;
  set author(String? author);

  int? get pubDate;
  set pubDate(int? pubDate);

  int? get updatedDate;
  set updatedDate(int? updatedDate);

  String? get body;
  set body(String? body);

  String? get enclosureMime;
  set enclosureMime(String? enclosureMime);

  String? get enclosureLink;
  set enclosureLink(String? enclosureLink);

  String? get mediaThumbnail;
  set mediaThumbnail(String? mediaThumbnail);

  String? get mediaDescription;
  set mediaDescription(String? mediaDescription);

  int? get feedId;
  set feedId(int? feedId);

  bool? get unread;
  set unread(bool? unread);

  bool? get starred;
  set starred(bool? starred);

  int? get lastModified;
  set lastModified(int? lastModified);

  bool? get rtl;
  set rtl(bool? rtl);

  String? get fingerprint;
  set fingerprint(String? fingerprint);

  String? get contentHash;
  set contentHash(String? contentHash);
}

class _$NewsArticle extends NewsArticle {
  @override
  final int id;
  @override
  final String guid;
  @override
  final String guidHash;
  @override
  final String? url;
  @override
  final String title;
  @override
  final String? author;
  @override
  final int pubDate;
  @override
  final int? updatedDate;
  @override
  final String body;
  @override
  final String? enclosureMime;
  @override
  final String? enclosureLink;
  @override
  final String? mediaThumbnail;
  @override
  final String? mediaDescription;
  @override
  final int feedId;
  @override
  final bool unread;
  @override
  final bool starred;
  @override
  final int lastModified;
  @override
  final bool rtl;
  @override
  final String fingerprint;
  @override
  final String contentHash;

  factory _$NewsArticle([void Function(NewsArticleBuilder)? updates]) =>
      (NewsArticleBuilder()..update(updates))._build();

  _$NewsArticle._(
      {required this.id,
      required this.guid,
      required this.guidHash,
      this.url,
      required this.title,
      this.author,
      required this.pubDate,
      this.updatedDate,
      required this.body,
      this.enclosureMime,
      this.enclosureLink,
      this.mediaThumbnail,
      this.mediaDescription,
      required this.feedId,
      required this.unread,
      required this.starred,
      required this.lastModified,
      required this.rtl,
      required this.fingerprint,
      required this.contentHash})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsArticle', 'id');
    BuiltValueNullFieldError.checkNotNull(guid, r'NewsArticle', 'guid');
    BuiltValueNullFieldError.checkNotNull(guidHash, r'NewsArticle', 'guidHash');
    BuiltValueNullFieldError.checkNotNull(title, r'NewsArticle', 'title');
    BuiltValueNullFieldError.checkNotNull(pubDate, r'NewsArticle', 'pubDate');
    BuiltValueNullFieldError.checkNotNull(body, r'NewsArticle', 'body');
    BuiltValueNullFieldError.checkNotNull(feedId, r'NewsArticle', 'feedId');
    BuiltValueNullFieldError.checkNotNull(unread, r'NewsArticle', 'unread');
    BuiltValueNullFieldError.checkNotNull(starred, r'NewsArticle', 'starred');
    BuiltValueNullFieldError.checkNotNull(lastModified, r'NewsArticle', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(rtl, r'NewsArticle', 'rtl');
    BuiltValueNullFieldError.checkNotNull(fingerprint, r'NewsArticle', 'fingerprint');
    BuiltValueNullFieldError.checkNotNull(contentHash, r'NewsArticle', 'contentHash');
  }

  @override
  NewsArticle rebuild(void Function(NewsArticleBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsArticleBuilder toBuilder() => NewsArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsArticle &&
        id == other.id &&
        guid == other.guid &&
        guidHash == other.guidHash &&
        url == other.url &&
        title == other.title &&
        author == other.author &&
        pubDate == other.pubDate &&
        updatedDate == other.updatedDate &&
        body == other.body &&
        enclosureMime == other.enclosureMime &&
        enclosureLink == other.enclosureLink &&
        mediaThumbnail == other.mediaThumbnail &&
        mediaDescription == other.mediaDescription &&
        feedId == other.feedId &&
        unread == other.unread &&
        starred == other.starred &&
        lastModified == other.lastModified &&
        rtl == other.rtl &&
        fingerprint == other.fingerprint &&
        contentHash == other.contentHash;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, guid.hashCode);
    _$hash = $jc(_$hash, guidHash.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, pubDate.hashCode);
    _$hash = $jc(_$hash, updatedDate.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, enclosureMime.hashCode);
    _$hash = $jc(_$hash, enclosureLink.hashCode);
    _$hash = $jc(_$hash, mediaThumbnail.hashCode);
    _$hash = $jc(_$hash, mediaDescription.hashCode);
    _$hash = $jc(_$hash, feedId.hashCode);
    _$hash = $jc(_$hash, unread.hashCode);
    _$hash = $jc(_$hash, starred.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, rtl.hashCode);
    _$hash = $jc(_$hash, fingerprint.hashCode);
    _$hash = $jc(_$hash, contentHash.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsArticle')
          ..add('id', id)
          ..add('guid', guid)
          ..add('guidHash', guidHash)
          ..add('url', url)
          ..add('title', title)
          ..add('author', author)
          ..add('pubDate', pubDate)
          ..add('updatedDate', updatedDate)
          ..add('body', body)
          ..add('enclosureMime', enclosureMime)
          ..add('enclosureLink', enclosureLink)
          ..add('mediaThumbnail', mediaThumbnail)
          ..add('mediaDescription', mediaDescription)
          ..add('feedId', feedId)
          ..add('unread', unread)
          ..add('starred', starred)
          ..add('lastModified', lastModified)
          ..add('rtl', rtl)
          ..add('fingerprint', fingerprint)
          ..add('contentHash', contentHash))
        .toString();
  }
}

class NewsArticleBuilder implements Builder<NewsArticle, NewsArticleBuilder>, NewsArticleInterfaceBuilder {
  _$NewsArticle? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _guid;
  String? get guid => _$this._guid;
  set guid(covariant String? guid) => _$this._guid = guid;

  String? _guidHash;
  String? get guidHash => _$this._guidHash;
  set guidHash(covariant String? guidHash) => _$this._guidHash = guidHash;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _author;
  String? get author => _$this._author;
  set author(covariant String? author) => _$this._author = author;

  int? _pubDate;
  int? get pubDate => _$this._pubDate;
  set pubDate(covariant int? pubDate) => _$this._pubDate = pubDate;

  int? _updatedDate;
  int? get updatedDate => _$this._updatedDate;
  set updatedDate(covariant int? updatedDate) => _$this._updatedDate = updatedDate;

  String? _body;
  String? get body => _$this._body;
  set body(covariant String? body) => _$this._body = body;

  String? _enclosureMime;
  String? get enclosureMime => _$this._enclosureMime;
  set enclosureMime(covariant String? enclosureMime) => _$this._enclosureMime = enclosureMime;

  String? _enclosureLink;
  String? get enclosureLink => _$this._enclosureLink;
  set enclosureLink(covariant String? enclosureLink) => _$this._enclosureLink = enclosureLink;

  String? _mediaThumbnail;
  String? get mediaThumbnail => _$this._mediaThumbnail;
  set mediaThumbnail(covariant String? mediaThumbnail) => _$this._mediaThumbnail = mediaThumbnail;

  String? _mediaDescription;
  String? get mediaDescription => _$this._mediaDescription;
  set mediaDescription(covariant String? mediaDescription) => _$this._mediaDescription = mediaDescription;

  int? _feedId;
  int? get feedId => _$this._feedId;
  set feedId(covariant int? feedId) => _$this._feedId = feedId;

  bool? _unread;
  bool? get unread => _$this._unread;
  set unread(covariant bool? unread) => _$this._unread = unread;

  bool? _starred;
  bool? get starred => _$this._starred;
  set starred(covariant bool? starred) => _$this._starred = starred;

  int? _lastModified;
  int? get lastModified => _$this._lastModified;
  set lastModified(covariant int? lastModified) => _$this._lastModified = lastModified;

  bool? _rtl;
  bool? get rtl => _$this._rtl;
  set rtl(covariant bool? rtl) => _$this._rtl = rtl;

  String? _fingerprint;
  String? get fingerprint => _$this._fingerprint;
  set fingerprint(covariant String? fingerprint) => _$this._fingerprint = fingerprint;

  String? _contentHash;
  String? get contentHash => _$this._contentHash;
  set contentHash(covariant String? contentHash) => _$this._contentHash = contentHash;

  NewsArticleBuilder();

  NewsArticleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _guid = $v.guid;
      _guidHash = $v.guidHash;
      _url = $v.url;
      _title = $v.title;
      _author = $v.author;
      _pubDate = $v.pubDate;
      _updatedDate = $v.updatedDate;
      _body = $v.body;
      _enclosureMime = $v.enclosureMime;
      _enclosureLink = $v.enclosureLink;
      _mediaThumbnail = $v.mediaThumbnail;
      _mediaDescription = $v.mediaDescription;
      _feedId = $v.feedId;
      _unread = $v.unread;
      _starred = $v.starred;
      _lastModified = $v.lastModified;
      _rtl = $v.rtl;
      _fingerprint = $v.fingerprint;
      _contentHash = $v.contentHash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsArticle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsArticle;
  }

  @override
  void update(void Function(NewsArticleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsArticle build() => _build();

  _$NewsArticle _build() {
    final _$result = _$v ??
        _$NewsArticle._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'NewsArticle', 'id'),
            guid: BuiltValueNullFieldError.checkNotNull(guid, r'NewsArticle', 'guid'),
            guidHash: BuiltValueNullFieldError.checkNotNull(guidHash, r'NewsArticle', 'guidHash'),
            url: url,
            title: BuiltValueNullFieldError.checkNotNull(title, r'NewsArticle', 'title'),
            author: author,
            pubDate: BuiltValueNullFieldError.checkNotNull(pubDate, r'NewsArticle', 'pubDate'),
            updatedDate: updatedDate,
            body: BuiltValueNullFieldError.checkNotNull(body, r'NewsArticle', 'body'),
            enclosureMime: enclosureMime,
            enclosureLink: enclosureLink,
            mediaThumbnail: mediaThumbnail,
            mediaDescription: mediaDescription,
            feedId: BuiltValueNullFieldError.checkNotNull(feedId, r'NewsArticle', 'feedId'),
            unread: BuiltValueNullFieldError.checkNotNull(unread, r'NewsArticle', 'unread'),
            starred: BuiltValueNullFieldError.checkNotNull(starred, r'NewsArticle', 'starred'),
            lastModified: BuiltValueNullFieldError.checkNotNull(lastModified, r'NewsArticle', 'lastModified'),
            rtl: BuiltValueNullFieldError.checkNotNull(rtl, r'NewsArticle', 'rtl'),
            fingerprint: BuiltValueNullFieldError.checkNotNull(fingerprint, r'NewsArticle', 'fingerprint'),
            contentHash: BuiltValueNullFieldError.checkNotNull(contentHash, r'NewsArticle', 'contentHash'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsFeedInterfaceBuilder {
  void replace(NewsFeedInterface other);
  void update(void Function(NewsFeedInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get url;
  set url(String? url);

  String? get title;
  set title(String? title);

  String? get faviconLink;
  set faviconLink(String? faviconLink);

  int? get added;
  set added(int? added);

  int? get folderId;
  set folderId(int? folderId);

  int? get unreadCount;
  set unreadCount(int? unreadCount);

  int? get ordering;
  set ordering(int? ordering);

  String? get link;
  set link(String? link);

  bool? get pinned;
  set pinned(bool? pinned);

  int? get updateErrorCount;
  set updateErrorCount(int? updateErrorCount);

  String? get lastUpdateError;
  set lastUpdateError(String? lastUpdateError);

  ListBuilder<NewsArticle> get items;
  set items(ListBuilder<NewsArticle>? items);
}

class _$NewsFeed extends NewsFeed {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final String? faviconLink;
  @override
  final int added;
  @override
  final int? folderId;
  @override
  final int? unreadCount;
  @override
  final int ordering;
  @override
  final String? link;
  @override
  final bool pinned;
  @override
  final int updateErrorCount;
  @override
  final String? lastUpdateError;
  @override
  final BuiltList<NewsArticle> items;

  factory _$NewsFeed([void Function(NewsFeedBuilder)? updates]) => (NewsFeedBuilder()..update(updates))._build();

  _$NewsFeed._(
      {required this.id,
      required this.url,
      required this.title,
      this.faviconLink,
      required this.added,
      this.folderId,
      this.unreadCount,
      required this.ordering,
      this.link,
      required this.pinned,
      required this.updateErrorCount,
      this.lastUpdateError,
      required this.items})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsFeed', 'id');
    BuiltValueNullFieldError.checkNotNull(url, r'NewsFeed', 'url');
    BuiltValueNullFieldError.checkNotNull(title, r'NewsFeed', 'title');
    BuiltValueNullFieldError.checkNotNull(added, r'NewsFeed', 'added');
    BuiltValueNullFieldError.checkNotNull(ordering, r'NewsFeed', 'ordering');
    BuiltValueNullFieldError.checkNotNull(pinned, r'NewsFeed', 'pinned');
    BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'NewsFeed', 'updateErrorCount');
    BuiltValueNullFieldError.checkNotNull(items, r'NewsFeed', 'items');
  }

  @override
  NewsFeed rebuild(void Function(NewsFeedBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsFeedBuilder toBuilder() => NewsFeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsFeed &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        faviconLink == other.faviconLink &&
        added == other.added &&
        folderId == other.folderId &&
        unreadCount == other.unreadCount &&
        ordering == other.ordering &&
        link == other.link &&
        pinned == other.pinned &&
        updateErrorCount == other.updateErrorCount &&
        lastUpdateError == other.lastUpdateError &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, faviconLink.hashCode);
    _$hash = $jc(_$hash, added.hashCode);
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jc(_$hash, ordering.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, pinned.hashCode);
    _$hash = $jc(_$hash, updateErrorCount.hashCode);
    _$hash = $jc(_$hash, lastUpdateError.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsFeed')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('faviconLink', faviconLink)
          ..add('added', added)
          ..add('folderId', folderId)
          ..add('unreadCount', unreadCount)
          ..add('ordering', ordering)
          ..add('link', link)
          ..add('pinned', pinned)
          ..add('updateErrorCount', updateErrorCount)
          ..add('lastUpdateError', lastUpdateError)
          ..add('items', items))
        .toString();
  }
}

class NewsFeedBuilder implements Builder<NewsFeed, NewsFeedBuilder>, NewsFeedInterfaceBuilder {
  _$NewsFeed? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _faviconLink;
  String? get faviconLink => _$this._faviconLink;
  set faviconLink(covariant String? faviconLink) => _$this._faviconLink = faviconLink;

  int? _added;
  int? get added => _$this._added;
  set added(covariant int? added) => _$this._added = added;

  int? _folderId;
  int? get folderId => _$this._folderId;
  set folderId(covariant int? folderId) => _$this._folderId = folderId;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(covariant int? unreadCount) => _$this._unreadCount = unreadCount;

  int? _ordering;
  int? get ordering => _$this._ordering;
  set ordering(covariant int? ordering) => _$this._ordering = ordering;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  bool? _pinned;
  bool? get pinned => _$this._pinned;
  set pinned(covariant bool? pinned) => _$this._pinned = pinned;

  int? _updateErrorCount;
  int? get updateErrorCount => _$this._updateErrorCount;
  set updateErrorCount(covariant int? updateErrorCount) => _$this._updateErrorCount = updateErrorCount;

  String? _lastUpdateError;
  String? get lastUpdateError => _$this._lastUpdateError;
  set lastUpdateError(covariant String? lastUpdateError) => _$this._lastUpdateError = lastUpdateError;

  ListBuilder<NewsArticle>? _items;
  ListBuilder<NewsArticle> get items => _$this._items ??= ListBuilder<NewsArticle>();
  set items(covariant ListBuilder<NewsArticle>? items) => _$this._items = items;

  NewsFeedBuilder();

  NewsFeedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _url = $v.url;
      _title = $v.title;
      _faviconLink = $v.faviconLink;
      _added = $v.added;
      _folderId = $v.folderId;
      _unreadCount = $v.unreadCount;
      _ordering = $v.ordering;
      _link = $v.link;
      _pinned = $v.pinned;
      _updateErrorCount = $v.updateErrorCount;
      _lastUpdateError = $v.lastUpdateError;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsFeed other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsFeed;
  }

  @override
  void update(void Function(NewsFeedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsFeed build() => _build();

  _$NewsFeed _build() {
    _$NewsFeed _$result;
    try {
      _$result = _$v ??
          _$NewsFeed._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NewsFeed', 'id'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'NewsFeed', 'url'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'NewsFeed', 'title'),
              faviconLink: faviconLink,
              added: BuiltValueNullFieldError.checkNotNull(added, r'NewsFeed', 'added'),
              folderId: folderId,
              unreadCount: unreadCount,
              ordering: BuiltValueNullFieldError.checkNotNull(ordering, r'NewsFeed', 'ordering'),
              link: link,
              pinned: BuiltValueNullFieldError.checkNotNull(pinned, r'NewsFeed', 'pinned'),
              updateErrorCount:
                  BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'NewsFeed', 'updateErrorCount'),
              lastUpdateError: lastUpdateError,
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsFeed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsFolderInterfaceBuilder {
  void replace(NewsFolderInterface other);
  void update(void Function(NewsFolderInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);

  bool? get opened;
  set opened(bool? opened);

  ListBuilder<NewsFeed> get feeds;
  set feeds(ListBuilder<NewsFeed>? feeds);
}

class _$NewsFolder extends NewsFolder {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool opened;
  @override
  final BuiltList<NewsFeed> feeds;

  factory _$NewsFolder([void Function(NewsFolderBuilder)? updates]) => (NewsFolderBuilder()..update(updates))._build();

  _$NewsFolder._({required this.id, required this.name, required this.opened, required this.feeds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsFolder', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'NewsFolder', 'name');
    BuiltValueNullFieldError.checkNotNull(opened, r'NewsFolder', 'opened');
    BuiltValueNullFieldError.checkNotNull(feeds, r'NewsFolder', 'feeds');
  }

  @override
  NewsFolder rebuild(void Function(NewsFolderBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsFolderBuilder toBuilder() => NewsFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsFolder &&
        id == other.id &&
        name == other.name &&
        opened == other.opened &&
        feeds == other.feeds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, opened.hashCode);
    _$hash = $jc(_$hash, feeds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsFolder')
          ..add('id', id)
          ..add('name', name)
          ..add('opened', opened)
          ..add('feeds', feeds))
        .toString();
  }
}

class NewsFolderBuilder implements Builder<NewsFolder, NewsFolderBuilder>, NewsFolderInterfaceBuilder {
  _$NewsFolder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  bool? _opened;
  bool? get opened => _$this._opened;
  set opened(covariant bool? opened) => _$this._opened = opened;

  ListBuilder<NewsFeed>? _feeds;
  ListBuilder<NewsFeed> get feeds => _$this._feeds ??= ListBuilder<NewsFeed>();
  set feeds(covariant ListBuilder<NewsFeed>? feeds) => _$this._feeds = feeds;

  NewsFolderBuilder();

  NewsFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _opened = $v.opened;
      _feeds = $v.feeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsFolder;
  }

  @override
  void update(void Function(NewsFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsFolder build() => _build();

  _$NewsFolder _build() {
    _$NewsFolder _$result;
    try {
      _$result = _$v ??
          _$NewsFolder._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NewsFolder', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'NewsFolder', 'name'),
              opened: BuiltValueNullFieldError.checkNotNull(opened, r'NewsFolder', 'opened'),
              feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsFolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsListFoldersInterfaceBuilder {
  void replace(NewsListFoldersInterface other);
  void update(void Function(NewsListFoldersInterfaceBuilder) updates);
  ListBuilder<NewsFolder> get folders;
  set folders(ListBuilder<NewsFolder>? folders);
}

class _$NewsListFolders extends NewsListFolders {
  @override
  final BuiltList<NewsFolder> folders;

  factory _$NewsListFolders([void Function(NewsListFoldersBuilder)? updates]) =>
      (NewsListFoldersBuilder()..update(updates))._build();

  _$NewsListFolders._({required this.folders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(folders, r'NewsListFolders', 'folders');
  }

  @override
  NewsListFolders rebuild(void Function(NewsListFoldersBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsListFoldersBuilder toBuilder() => NewsListFoldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsListFolders && folders == other.folders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsListFolders')..add('folders', folders)).toString();
  }
}

class NewsListFoldersBuilder
    implements Builder<NewsListFolders, NewsListFoldersBuilder>, NewsListFoldersInterfaceBuilder {
  _$NewsListFolders? _$v;

  ListBuilder<NewsFolder>? _folders;
  ListBuilder<NewsFolder> get folders => _$this._folders ??= ListBuilder<NewsFolder>();
  set folders(covariant ListBuilder<NewsFolder>? folders) => _$this._folders = folders;

  NewsListFoldersBuilder();

  NewsListFoldersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folders = $v.folders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsListFolders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsListFolders;
  }

  @override
  void update(void Function(NewsListFoldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsListFolders build() => _build();

  _$NewsListFolders _build() {
    _$NewsListFolders _$result;
    try {
      _$result = _$v ?? _$NewsListFolders._(folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsListFolders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsListFeedsInterfaceBuilder {
  void replace(NewsListFeedsInterface other);
  void update(void Function(NewsListFeedsInterfaceBuilder) updates);
  int? get starredCount;
  set starredCount(int? starredCount);

  int? get newestItemId;
  set newestItemId(int? newestItemId);

  ListBuilder<NewsFeed> get feeds;
  set feeds(ListBuilder<NewsFeed>? feeds);
}

class _$NewsListFeeds extends NewsListFeeds {
  @override
  final int? starredCount;
  @override
  final int? newestItemId;
  @override
  final BuiltList<NewsFeed> feeds;

  factory _$NewsListFeeds([void Function(NewsListFeedsBuilder)? updates]) =>
      (NewsListFeedsBuilder()..update(updates))._build();

  _$NewsListFeeds._({this.starredCount, this.newestItemId, required this.feeds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(feeds, r'NewsListFeeds', 'feeds');
  }

  @override
  NewsListFeeds rebuild(void Function(NewsListFeedsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsListFeedsBuilder toBuilder() => NewsListFeedsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsListFeeds &&
        starredCount == other.starredCount &&
        newestItemId == other.newestItemId &&
        feeds == other.feeds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, starredCount.hashCode);
    _$hash = $jc(_$hash, newestItemId.hashCode);
    _$hash = $jc(_$hash, feeds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsListFeeds')
          ..add('starredCount', starredCount)
          ..add('newestItemId', newestItemId)
          ..add('feeds', feeds))
        .toString();
  }
}

class NewsListFeedsBuilder implements Builder<NewsListFeeds, NewsListFeedsBuilder>, NewsListFeedsInterfaceBuilder {
  _$NewsListFeeds? _$v;

  int? _starredCount;
  int? get starredCount => _$this._starredCount;
  set starredCount(covariant int? starredCount) => _$this._starredCount = starredCount;

  int? _newestItemId;
  int? get newestItemId => _$this._newestItemId;
  set newestItemId(covariant int? newestItemId) => _$this._newestItemId = newestItemId;

  ListBuilder<NewsFeed>? _feeds;
  ListBuilder<NewsFeed> get feeds => _$this._feeds ??= ListBuilder<NewsFeed>();
  set feeds(covariant ListBuilder<NewsFeed>? feeds) => _$this._feeds = feeds;

  NewsListFeedsBuilder();

  NewsListFeedsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _starredCount = $v.starredCount;
      _newestItemId = $v.newestItemId;
      _feeds = $v.feeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsListFeeds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsListFeeds;
  }

  @override
  void update(void Function(NewsListFeedsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsListFeeds build() => _build();

  _$NewsListFeeds _build() {
    _$NewsListFeeds _$result;
    try {
      _$result = _$v ?? _$NewsListFeeds._(starredCount: starredCount, newestItemId: newestItemId, feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsListFeeds', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsListArticlesInterfaceBuilder {
  void replace(NewsListArticlesInterface other);
  void update(void Function(NewsListArticlesInterfaceBuilder) updates);
  ListBuilder<NewsArticle> get items;
  set items(ListBuilder<NewsArticle>? items);
}

class _$NewsListArticles extends NewsListArticles {
  @override
  final BuiltList<NewsArticle> items;

  factory _$NewsListArticles([void Function(NewsListArticlesBuilder)? updates]) =>
      (NewsListArticlesBuilder()..update(updates))._build();

  _$NewsListArticles._({required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'NewsListArticles', 'items');
  }

  @override
  NewsListArticles rebuild(void Function(NewsListArticlesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsListArticlesBuilder toBuilder() => NewsListArticlesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsListArticles && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsListArticles')..add('items', items)).toString();
  }
}

class NewsListArticlesBuilder
    implements Builder<NewsListArticles, NewsListArticlesBuilder>, NewsListArticlesInterfaceBuilder {
  _$NewsListArticles? _$v;

  ListBuilder<NewsArticle>? _items;
  ListBuilder<NewsArticle> get items => _$this._items ??= ListBuilder<NewsArticle>();
  set items(covariant ListBuilder<NewsArticle>? items) => _$this._items = items;

  NewsListArticlesBuilder();

  NewsListArticlesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsListArticles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsListArticles;
  }

  @override
  void update(void Function(NewsListArticlesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsListArticles build() => _build();

  _$NewsListArticles _build() {
    _$NewsListArticles _$result;
    try {
      _$result = _$v ?? _$NewsListArticles._(items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsListArticles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsOCSMetaInterfaceBuilder {
  void replace(NewsOCSMetaInterface other);
  void update(void Function(NewsOCSMetaInterfaceBuilder) updates);
  String? get status;
  set status(String? status);

  int? get statuscode;
  set statuscode(int? statuscode);

  String? get message;
  set message(String? message);

  String? get totalitems;
  set totalitems(String? totalitems);

  String? get itemsperpage;
  set itemsperpage(String? itemsperpage);
}

class _$NewsOCSMeta extends NewsOCSMeta {
  @override
  final String status;
  @override
  final int statuscode;
  @override
  final String? message;
  @override
  final String? totalitems;
  @override
  final String? itemsperpage;

  factory _$NewsOCSMeta([void Function(NewsOCSMetaBuilder)? updates]) =>
      (NewsOCSMetaBuilder()..update(updates))._build();

  _$NewsOCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'NewsOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'NewsOCSMeta', 'statuscode');
  }

  @override
  NewsOCSMeta rebuild(void Function(NewsOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsOCSMetaBuilder toBuilder() => NewsOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsOCSMeta &&
        status == other.status &&
        statuscode == other.statuscode &&
        message == other.message &&
        totalitems == other.totalitems &&
        itemsperpage == other.itemsperpage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statuscode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, totalitems.hashCode);
    _$hash = $jc(_$hash, itemsperpage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class NewsOCSMetaBuilder implements Builder<NewsOCSMeta, NewsOCSMetaBuilder>, NewsOCSMetaInterfaceBuilder {
  _$NewsOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(covariant int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(covariant String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(covariant String? itemsperpage) => _$this._itemsperpage = itemsperpage;

  NewsOCSMetaBuilder();

  NewsOCSMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _statuscode = $v.statuscode;
      _message = $v.message;
      _totalitems = $v.totalitems;
      _itemsperpage = $v.itemsperpage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsOCSMeta;
  }

  @override
  void update(void Function(NewsOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsOCSMeta build() => _build();

  _$NewsOCSMeta _build() {
    final _$result = _$v ??
        _$NewsOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'NewsOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'NewsOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsEmptyOCS_OcsInterfaceBuilder {
  void replace(NewsEmptyOCS_OcsInterface other);
  void update(void Function(NewsEmptyOCS_OcsInterfaceBuilder) updates);
  NewsOCSMetaBuilder get meta;
  set meta(NewsOCSMetaBuilder? meta);

  ListBuilder<JsonObject> get data;
  set data(ListBuilder<JsonObject>? data);
}

class _$NewsEmptyOCS_Ocs extends NewsEmptyOCS_Ocs {
  @override
  final NewsOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$NewsEmptyOCS_Ocs([void Function(NewsEmptyOCS_OcsBuilder)? updates]) =>
      (NewsEmptyOCS_OcsBuilder()..update(updates))._build();

  _$NewsEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NewsEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NewsEmptyOCS_Ocs', 'data');
  }

  @override
  NewsEmptyOCS_Ocs rebuild(void Function(NewsEmptyOCS_OcsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsEmptyOCS_OcsBuilder toBuilder() => NewsEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsEmptyOCS_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NewsEmptyOCS_OcsBuilder
    implements Builder<NewsEmptyOCS_Ocs, NewsEmptyOCS_OcsBuilder>, NewsEmptyOCS_OcsInterfaceBuilder {
  _$NewsEmptyOCS_Ocs? _$v;

  NewsOCSMetaBuilder? _meta;
  NewsOCSMetaBuilder get meta => _$this._meta ??= NewsOCSMetaBuilder();
  set meta(covariant NewsOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(covariant ListBuilder<JsonObject>? data) => _$this._data = data;

  NewsEmptyOCS_OcsBuilder();

  NewsEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsEmptyOCS_Ocs;
  }

  @override
  void update(void Function(NewsEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsEmptyOCS_Ocs build() => _build();

  _$NewsEmptyOCS_Ocs _build() {
    _$NewsEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$NewsEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NewsEmptyOCSInterfaceBuilder {
  void replace(NewsEmptyOCSInterface other);
  void update(void Function(NewsEmptyOCSInterfaceBuilder) updates);
  NewsEmptyOCS_OcsBuilder get ocs;
  set ocs(NewsEmptyOCS_OcsBuilder? ocs);
}

class _$NewsEmptyOCS extends NewsEmptyOCS {
  @override
  final NewsEmptyOCS_Ocs ocs;

  factory _$NewsEmptyOCS([void Function(NewsEmptyOCSBuilder)? updates]) =>
      (NewsEmptyOCSBuilder()..update(updates))._build();

  _$NewsEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NewsEmptyOCS', 'ocs');
  }

  @override
  NewsEmptyOCS rebuild(void Function(NewsEmptyOCSBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewsEmptyOCSBuilder toBuilder() => NewsEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsEmptyOCS && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class NewsEmptyOCSBuilder implements Builder<NewsEmptyOCS, NewsEmptyOCSBuilder>, NewsEmptyOCSInterfaceBuilder {
  _$NewsEmptyOCS? _$v;

  NewsEmptyOCS_OcsBuilder? _ocs;
  NewsEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= NewsEmptyOCS_OcsBuilder();
  set ocs(covariant NewsEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  NewsEmptyOCSBuilder();

  NewsEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewsEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsEmptyOCS;
  }

  @override
  void update(void Function(NewsEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsEmptyOCS build() => _build();

  _$NewsEmptyOCS _build() {
    _$NewsEmptyOCS _$result;
    try {
      _$result = _$v ?? _$NewsEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NewsEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
