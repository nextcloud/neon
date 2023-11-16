// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class SupportedAPIVersionsInterfaceBuilder {
  void replace(SupportedAPIVersionsInterface other);
  void update(void Function(SupportedAPIVersionsInterfaceBuilder) updates);
  ListBuilder<String> get apiLevels;
  set apiLevels(ListBuilder<String>? apiLevels);
}

class _$SupportedAPIVersions extends SupportedAPIVersions {
  @override
  final BuiltList<String>? apiLevels;

  factory _$SupportedAPIVersions([void Function(SupportedAPIVersionsBuilder)? updates]) =>
      (SupportedAPIVersionsBuilder()..update(updates))._build();

  _$SupportedAPIVersions._({this.apiLevels}) : super._();

  @override
  SupportedAPIVersions rebuild(void Function(SupportedAPIVersionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportedAPIVersionsBuilder toBuilder() => SupportedAPIVersionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupportedAPIVersions && apiLevels == other.apiLevels;
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
    return (newBuiltValueToStringHelper(r'SupportedAPIVersions')..add('apiLevels', apiLevels)).toString();
  }
}

class SupportedAPIVersionsBuilder
    implements Builder<SupportedAPIVersions, SupportedAPIVersionsBuilder>, SupportedAPIVersionsInterfaceBuilder {
  _$SupportedAPIVersions? _$v;

  ListBuilder<String>? _apiLevels;
  ListBuilder<String> get apiLevels => _$this._apiLevels ??= ListBuilder<String>();
  set apiLevels(covariant ListBuilder<String>? apiLevels) => _$this._apiLevels = apiLevels;

  SupportedAPIVersionsBuilder();

  SupportedAPIVersionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiLevels = $v.apiLevels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SupportedAPIVersions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupportedAPIVersions;
  }

  @override
  void update(void Function(SupportedAPIVersionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupportedAPIVersions build() => _build();

  _$SupportedAPIVersions _build() {
    _$SupportedAPIVersions _$result;
    try {
      _$result = _$v ?? _$SupportedAPIVersions._(apiLevels: _apiLevels?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiLevels';
        _apiLevels?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SupportedAPIVersions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ArticleInterfaceBuilder {
  void replace(ArticleInterface other);
  void update(void Function(ArticleInterfaceBuilder) updates);
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

class _$Article extends Article {
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

  factory _$Article([void Function(ArticleBuilder)? updates]) => (ArticleBuilder()..update(updates))._build();

  _$Article._(
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
    BuiltValueNullFieldError.checkNotNull(id, r'Article', 'id');
    BuiltValueNullFieldError.checkNotNull(guid, r'Article', 'guid');
    BuiltValueNullFieldError.checkNotNull(guidHash, r'Article', 'guidHash');
    BuiltValueNullFieldError.checkNotNull(title, r'Article', 'title');
    BuiltValueNullFieldError.checkNotNull(pubDate, r'Article', 'pubDate');
    BuiltValueNullFieldError.checkNotNull(body, r'Article', 'body');
    BuiltValueNullFieldError.checkNotNull(feedId, r'Article', 'feedId');
    BuiltValueNullFieldError.checkNotNull(unread, r'Article', 'unread');
    BuiltValueNullFieldError.checkNotNull(starred, r'Article', 'starred');
    BuiltValueNullFieldError.checkNotNull(lastModified, r'Article', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(rtl, r'Article', 'rtl');
    BuiltValueNullFieldError.checkNotNull(fingerprint, r'Article', 'fingerprint');
    BuiltValueNullFieldError.checkNotNull(contentHash, r'Article', 'contentHash');
  }

  @override
  Article rebuild(void Function(ArticleBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
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
    return (newBuiltValueToStringHelper(r'Article')
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

class ArticleBuilder implements Builder<Article, ArticleBuilder>, ArticleInterfaceBuilder {
  _$Article? _$v;

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

  ArticleBuilder();

  ArticleBuilder get _$this {
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
  void replace(covariant Article other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Article;
  }

  @override
  void update(void Function(ArticleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Article build() => _build();

  _$Article _build() {
    final _$result = _$v ??
        _$Article._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Article', 'id'),
            guid: BuiltValueNullFieldError.checkNotNull(guid, r'Article', 'guid'),
            guidHash: BuiltValueNullFieldError.checkNotNull(guidHash, r'Article', 'guidHash'),
            url: url,
            title: BuiltValueNullFieldError.checkNotNull(title, r'Article', 'title'),
            author: author,
            pubDate: BuiltValueNullFieldError.checkNotNull(pubDate, r'Article', 'pubDate'),
            updatedDate: updatedDate,
            body: BuiltValueNullFieldError.checkNotNull(body, r'Article', 'body'),
            enclosureMime: enclosureMime,
            enclosureLink: enclosureLink,
            mediaThumbnail: mediaThumbnail,
            mediaDescription: mediaDescription,
            feedId: BuiltValueNullFieldError.checkNotNull(feedId, r'Article', 'feedId'),
            unread: BuiltValueNullFieldError.checkNotNull(unread, r'Article', 'unread'),
            starred: BuiltValueNullFieldError.checkNotNull(starred, r'Article', 'starred'),
            lastModified: BuiltValueNullFieldError.checkNotNull(lastModified, r'Article', 'lastModified'),
            rtl: BuiltValueNullFieldError.checkNotNull(rtl, r'Article', 'rtl'),
            fingerprint: BuiltValueNullFieldError.checkNotNull(fingerprint, r'Article', 'fingerprint'),
            contentHash: BuiltValueNullFieldError.checkNotNull(contentHash, r'Article', 'contentHash'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FeedInterfaceBuilder {
  void replace(FeedInterface other);
  void update(void Function(FeedInterfaceBuilder) updates);
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

  ListBuilder<Article> get items;
  set items(ListBuilder<Article>? items);
}

class _$Feed extends Feed {
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
  final BuiltList<Article> items;

  factory _$Feed([void Function(FeedBuilder)? updates]) => (FeedBuilder()..update(updates))._build();

  _$Feed._(
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
    BuiltValueNullFieldError.checkNotNull(id, r'Feed', 'id');
    BuiltValueNullFieldError.checkNotNull(url, r'Feed', 'url');
    BuiltValueNullFieldError.checkNotNull(title, r'Feed', 'title');
    BuiltValueNullFieldError.checkNotNull(added, r'Feed', 'added');
    BuiltValueNullFieldError.checkNotNull(ordering, r'Feed', 'ordering');
    BuiltValueNullFieldError.checkNotNull(pinned, r'Feed', 'pinned');
    BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'Feed', 'updateErrorCount');
    BuiltValueNullFieldError.checkNotNull(items, r'Feed', 'items');
  }

  @override
  Feed rebuild(void Function(FeedBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  FeedBuilder toBuilder() => FeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Feed &&
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
    return (newBuiltValueToStringHelper(r'Feed')
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

class FeedBuilder implements Builder<Feed, FeedBuilder>, FeedInterfaceBuilder {
  _$Feed? _$v;

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

  ListBuilder<Article>? _items;
  ListBuilder<Article> get items => _$this._items ??= ListBuilder<Article>();
  set items(covariant ListBuilder<Article>? items) => _$this._items = items;

  FeedBuilder();

  FeedBuilder get _$this {
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
  void replace(covariant Feed other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Feed;
  }

  @override
  void update(void Function(FeedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Feed build() => _build();

  _$Feed _build() {
    _$Feed _$result;
    try {
      _$result = _$v ??
          _$Feed._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Feed', 'id'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'Feed', 'url'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'Feed', 'title'),
              faviconLink: faviconLink,
              added: BuiltValueNullFieldError.checkNotNull(added, r'Feed', 'added'),
              folderId: folderId,
              unreadCount: unreadCount,
              ordering: BuiltValueNullFieldError.checkNotNull(ordering, r'Feed', 'ordering'),
              link: link,
              pinned: BuiltValueNullFieldError.checkNotNull(pinned, r'Feed', 'pinned'),
              updateErrorCount: BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'Feed', 'updateErrorCount'),
              lastUpdateError: lastUpdateError,
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Feed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FolderInterfaceBuilder {
  void replace(FolderInterface other);
  void update(void Function(FolderInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);

  bool? get opened;
  set opened(bool? opened);

  ListBuilder<Feed> get feeds;
  set feeds(ListBuilder<Feed>? feeds);
}

class _$Folder extends Folder {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool opened;
  @override
  final BuiltList<Feed> feeds;

  factory _$Folder([void Function(FolderBuilder)? updates]) => (FolderBuilder()..update(updates))._build();

  _$Folder._({required this.id, required this.name, required this.opened, required this.feeds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Folder', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Folder', 'name');
    BuiltValueNullFieldError.checkNotNull(opened, r'Folder', 'opened');
    BuiltValueNullFieldError.checkNotNull(feeds, r'Folder', 'feeds');
  }

  @override
  Folder rebuild(void Function(FolderBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  FolderBuilder toBuilder() => FolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Folder && id == other.id && name == other.name && opened == other.opened && feeds == other.feeds;
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
    return (newBuiltValueToStringHelper(r'Folder')
          ..add('id', id)
          ..add('name', name)
          ..add('opened', opened)
          ..add('feeds', feeds))
        .toString();
  }
}

class FolderBuilder implements Builder<Folder, FolderBuilder>, FolderInterfaceBuilder {
  _$Folder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  bool? _opened;
  bool? get opened => _$this._opened;
  set opened(covariant bool? opened) => _$this._opened = opened;

  ListBuilder<Feed>? _feeds;
  ListBuilder<Feed> get feeds => _$this._feeds ??= ListBuilder<Feed>();
  set feeds(covariant ListBuilder<Feed>? feeds) => _$this._feeds = feeds;

  FolderBuilder();

  FolderBuilder get _$this {
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
  void replace(covariant Folder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Folder;
  }

  @override
  void update(void Function(FolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Folder build() => _build();

  _$Folder _build() {
    _$Folder _$result;
    try {
      _$result = _$v ??
          _$Folder._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Folder', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'Folder', 'name'),
              opened: BuiltValueNullFieldError.checkNotNull(opened, r'Folder', 'opened'),
              feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Folder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ListFoldersInterfaceBuilder {
  void replace(ListFoldersInterface other);
  void update(void Function(ListFoldersInterfaceBuilder) updates);
  ListBuilder<Folder> get folders;
  set folders(ListBuilder<Folder>? folders);
}

class _$ListFolders extends ListFolders {
  @override
  final BuiltList<Folder> folders;

  factory _$ListFolders([void Function(ListFoldersBuilder)? updates]) =>
      (ListFoldersBuilder()..update(updates))._build();

  _$ListFolders._({required this.folders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(folders, r'ListFolders', 'folders');
  }

  @override
  ListFolders rebuild(void Function(ListFoldersBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ListFoldersBuilder toBuilder() => ListFoldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListFolders && folders == other.folders;
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
    return (newBuiltValueToStringHelper(r'ListFolders')..add('folders', folders)).toString();
  }
}

class ListFoldersBuilder implements Builder<ListFolders, ListFoldersBuilder>, ListFoldersInterfaceBuilder {
  _$ListFolders? _$v;

  ListBuilder<Folder>? _folders;
  ListBuilder<Folder> get folders => _$this._folders ??= ListBuilder<Folder>();
  set folders(covariant ListBuilder<Folder>? folders) => _$this._folders = folders;

  ListFoldersBuilder();

  ListFoldersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folders = $v.folders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ListFolders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListFolders;
  }

  @override
  void update(void Function(ListFoldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListFolders build() => _build();

  _$ListFolders _build() {
    _$ListFolders _$result;
    try {
      _$result = _$v ?? _$ListFolders._(folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ListFolders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ListFeedsInterfaceBuilder {
  void replace(ListFeedsInterface other);
  void update(void Function(ListFeedsInterfaceBuilder) updates);
  int? get starredCount;
  set starredCount(int? starredCount);

  int? get newestItemId;
  set newestItemId(int? newestItemId);

  ListBuilder<Feed> get feeds;
  set feeds(ListBuilder<Feed>? feeds);
}

class _$ListFeeds extends ListFeeds {
  @override
  final int? starredCount;
  @override
  final int? newestItemId;
  @override
  final BuiltList<Feed> feeds;

  factory _$ListFeeds([void Function(ListFeedsBuilder)? updates]) => (ListFeedsBuilder()..update(updates))._build();

  _$ListFeeds._({this.starredCount, this.newestItemId, required this.feeds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(feeds, r'ListFeeds', 'feeds');
  }

  @override
  ListFeeds rebuild(void Function(ListFeedsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ListFeedsBuilder toBuilder() => ListFeedsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListFeeds &&
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
    return (newBuiltValueToStringHelper(r'ListFeeds')
          ..add('starredCount', starredCount)
          ..add('newestItemId', newestItemId)
          ..add('feeds', feeds))
        .toString();
  }
}

class ListFeedsBuilder implements Builder<ListFeeds, ListFeedsBuilder>, ListFeedsInterfaceBuilder {
  _$ListFeeds? _$v;

  int? _starredCount;
  int? get starredCount => _$this._starredCount;
  set starredCount(covariant int? starredCount) => _$this._starredCount = starredCount;

  int? _newestItemId;
  int? get newestItemId => _$this._newestItemId;
  set newestItemId(covariant int? newestItemId) => _$this._newestItemId = newestItemId;

  ListBuilder<Feed>? _feeds;
  ListBuilder<Feed> get feeds => _$this._feeds ??= ListBuilder<Feed>();
  set feeds(covariant ListBuilder<Feed>? feeds) => _$this._feeds = feeds;

  ListFeedsBuilder();

  ListFeedsBuilder get _$this {
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
  void replace(covariant ListFeeds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListFeeds;
  }

  @override
  void update(void Function(ListFeedsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListFeeds build() => _build();

  _$ListFeeds _build() {
    _$ListFeeds _$result;
    try {
      _$result = _$v ?? _$ListFeeds._(starredCount: starredCount, newestItemId: newestItemId, feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ListFeeds', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ListArticlesInterfaceBuilder {
  void replace(ListArticlesInterface other);
  void update(void Function(ListArticlesInterfaceBuilder) updates);
  ListBuilder<Article> get items;
  set items(ListBuilder<Article>? items);
}

class _$ListArticles extends ListArticles {
  @override
  final BuiltList<Article> items;

  factory _$ListArticles([void Function(ListArticlesBuilder)? updates]) =>
      (ListArticlesBuilder()..update(updates))._build();

  _$ListArticles._({required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'ListArticles', 'items');
  }

  @override
  ListArticles rebuild(void Function(ListArticlesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ListArticlesBuilder toBuilder() => ListArticlesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListArticles && items == other.items;
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
    return (newBuiltValueToStringHelper(r'ListArticles')..add('items', items)).toString();
  }
}

class ListArticlesBuilder implements Builder<ListArticles, ListArticlesBuilder>, ListArticlesInterfaceBuilder {
  _$ListArticles? _$v;

  ListBuilder<Article>? _items;
  ListBuilder<Article> get items => _$this._items ??= ListBuilder<Article>();
  set items(covariant ListBuilder<Article>? items) => _$this._items = items;

  ListArticlesBuilder();

  ListArticlesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ListArticles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListArticles;
  }

  @override
  void update(void Function(ListArticlesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListArticles build() => _build();

  _$ListArticles _build() {
    _$ListArticles _$result;
    try {
      _$result = _$v ?? _$ListArticles._(items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ListArticles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OCSMetaInterfaceBuilder {
  void replace(OCSMetaInterface other);
  void update(void Function(OCSMetaInterfaceBuilder) updates);
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

class _$OCSMeta extends OCSMeta {
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

  factory _$OCSMeta([void Function(OCSMetaBuilder)? updates]) => (OCSMetaBuilder()..update(updates))._build();

  _$OCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode');
  }

  @override
  OCSMeta rebuild(void Function(OCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OCSMetaBuilder toBuilder() => OCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OCSMeta &&
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
    return (newBuiltValueToStringHelper(r'OCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class OCSMetaBuilder implements Builder<OCSMeta, OCSMetaBuilder>, OCSMetaInterfaceBuilder {
  _$OCSMeta? _$v;

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

  OCSMetaBuilder();

  OCSMetaBuilder get _$this {
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
  void replace(covariant OCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OCSMeta;
  }

  @override
  void update(void Function(OCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OCSMeta build() => _build();

  _$OCSMeta _build() {
    final _$result = _$v ??
        _$OCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class EmptyOCS_OcsInterfaceBuilder {
  void replace(EmptyOCS_OcsInterface other);
  void update(void Function(EmptyOCS_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<JsonObject> get data;
  set data(ListBuilder<JsonObject>? data);
}

class _$EmptyOCS_Ocs extends EmptyOCS_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$EmptyOCS_Ocs([void Function(EmptyOCS_OcsBuilder)? updates]) =>
      (EmptyOCS_OcsBuilder()..update(updates))._build();

  _$EmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'EmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'EmptyOCS_Ocs', 'data');
  }

  @override
  EmptyOCS_Ocs rebuild(void Function(EmptyOCS_OcsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  EmptyOCS_OcsBuilder toBuilder() => EmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmptyOCS_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'EmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class EmptyOCS_OcsBuilder implements Builder<EmptyOCS_Ocs, EmptyOCS_OcsBuilder>, EmptyOCS_OcsInterfaceBuilder {
  _$EmptyOCS_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(covariant ListBuilder<JsonObject>? data) => _$this._data = data;

  EmptyOCS_OcsBuilder();

  EmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant EmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmptyOCS_Ocs;
  }

  @override
  void update(void Function(EmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmptyOCS_Ocs build() => _build();

  _$EmptyOCS_Ocs _build() {
    _$EmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$EmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'EmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class EmptyOCSInterfaceBuilder {
  void replace(EmptyOCSInterface other);
  void update(void Function(EmptyOCSInterfaceBuilder) updates);
  EmptyOCS_OcsBuilder get ocs;
  set ocs(EmptyOCS_OcsBuilder? ocs);
}

class _$EmptyOCS extends EmptyOCS {
  @override
  final EmptyOCS_Ocs ocs;

  factory _$EmptyOCS([void Function(EmptyOCSBuilder)? updates]) => (EmptyOCSBuilder()..update(updates))._build();

  _$EmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'EmptyOCS', 'ocs');
  }

  @override
  EmptyOCS rebuild(void Function(EmptyOCSBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  EmptyOCSBuilder toBuilder() => EmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmptyOCS && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'EmptyOCS')..add('ocs', ocs)).toString();
  }
}

class EmptyOCSBuilder implements Builder<EmptyOCS, EmptyOCSBuilder>, EmptyOCSInterfaceBuilder {
  _$EmptyOCS? _$v;

  EmptyOCS_OcsBuilder? _ocs;
  EmptyOCS_OcsBuilder get ocs => _$this._ocs ??= EmptyOCS_OcsBuilder();
  set ocs(covariant EmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  EmptyOCSBuilder();

  EmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant EmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmptyOCS;
  }

  @override
  void update(void Function(EmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmptyOCS build() => _build();

  _$EmptyOCS _build() {
    _$EmptyOCS _$result;
    try {
      _$result = _$v ?? _$EmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'EmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
