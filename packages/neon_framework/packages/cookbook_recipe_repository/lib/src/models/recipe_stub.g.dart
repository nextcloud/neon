// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_stub.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeStub extends RecipeStub {
  @override
  final tz.TZDateTime dateCreated;
  @override
  final tz.TZDateTime? dateModified;
  @override
  final String id;
  @override
  final Uri? imagePlaceholderUrl;
  @override
  final Uri? imageUrl;
  @override
  final BuiltSet<String> keywords;
  @override
  final String name;

  factory _$RecipeStub([void Function(RecipeStubBuilder)? updates]) => (RecipeStubBuilder()..update(updates))._build();

  _$RecipeStub._(
      {required this.dateCreated,
      this.dateModified,
      required this.id,
      this.imagePlaceholderUrl,
      this.imageUrl,
      required this.keywords,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStub', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(id, r'RecipeStub', 'id');
    BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStub', 'keywords');
    BuiltValueNullFieldError.checkNotNull(name, r'RecipeStub', 'name');
  }

  @override
  RecipeStub rebuild(void Function(RecipeStubBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  RecipeStubBuilder toBuilder() => RecipeStubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeStub &&
        dateCreated == other.dateCreated &&
        dateModified == other.dateModified &&
        id == other.id &&
        imagePlaceholderUrl == other.imagePlaceholderUrl &&
        imageUrl == other.imageUrl &&
        keywords == other.keywords &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, dateModified.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imagePlaceholderUrl.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeStub')
          ..add('dateCreated', dateCreated)
          ..add('dateModified', dateModified)
          ..add('id', id)
          ..add('imagePlaceholderUrl', imagePlaceholderUrl)
          ..add('imageUrl', imageUrl)
          ..add('keywords', keywords)
          ..add('name', name))
        .toString();
  }
}

class RecipeStubBuilder implements Builder<RecipeStub, RecipeStubBuilder> {
  _$RecipeStub? _$v;

  tz.TZDateTime? _dateCreated;
  tz.TZDateTime? get dateCreated => _$this._dateCreated;
  set dateCreated(tz.TZDateTime? dateCreated) => _$this._dateCreated = dateCreated;

  tz.TZDateTime? _dateModified;
  tz.TZDateTime? get dateModified => _$this._dateModified;
  set dateModified(tz.TZDateTime? dateModified) => _$this._dateModified = dateModified;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  Uri? _imagePlaceholderUrl;
  Uri? get imagePlaceholderUrl => _$this._imagePlaceholderUrl;
  set imagePlaceholderUrl(Uri? imagePlaceholderUrl) => _$this._imagePlaceholderUrl = imagePlaceholderUrl;

  Uri? _imageUrl;
  Uri? get imageUrl => _$this._imageUrl;
  set imageUrl(Uri? imageUrl) => _$this._imageUrl = imageUrl;

  BuiltSet<String>? _keywords;
  BuiltSet<String>? get keywords => _$this._keywords;
  set keywords(BuiltSet<String>? keywords) => _$this._keywords = keywords;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RecipeStubBuilder();

  RecipeStubBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateCreated = $v.dateCreated;
      _dateModified = $v.dateModified;
      _id = $v.id;
      _imagePlaceholderUrl = $v.imagePlaceholderUrl;
      _imageUrl = $v.imageUrl;
      _keywords = $v.keywords;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeStub other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeStub;
  }

  @override
  void update(void Function(RecipeStubBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeStub build() => _build();

  _$RecipeStub _build() {
    final _$result = _$v ??
        _$RecipeStub._(
            dateCreated: BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStub', 'dateCreated'),
            dateModified: dateModified,
            id: BuiltValueNullFieldError.checkNotNull(id, r'RecipeStub', 'id'),
            imagePlaceholderUrl: imagePlaceholderUrl,
            imageUrl: imageUrl,
            keywords: BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStub', 'keywords'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'RecipeStub', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
