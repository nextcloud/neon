// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Recipe extends Recipe {
  @override
  final Duration? cookTime;
  @override
  final tz.TZDateTime dateCreated;
  @override
  final tz.TZDateTime? dateModified;
  @override
  final String description;
  @override
  final String? id;
  @override
  final Uri? image;
  @override
  final Uri? imagePlaceholderUrl;
  @override
  final Uri? imageUrl;
  @override
  final BuiltSet<String> keywords;
  @override
  final Duration? prepTime;
  @override
  final String name;
  @override
  final Nutrition nutrition;
  @override
  final String recipeCategory;
  @override
  final BuiltList<String> recipeIngredient;
  @override
  final BuiltList<String> recipeInstructions;
  @override
  final int recipeYield;
  @override
  final Duration? totalTime;
  @override
  final BuiltList<String> tool;
  @override
  final Uri? url;

  factory _$Recipe([void Function(RecipeBuilder)? updates]) => (RecipeBuilder()..update(updates))._build();

  _$Recipe._(
      {this.cookTime,
      required this.dateCreated,
      this.dateModified,
      required this.description,
      this.id,
      this.image,
      this.imagePlaceholderUrl,
      this.imageUrl,
      required this.keywords,
      this.prepTime,
      required this.name,
      required this.nutrition,
      required this.recipeCategory,
      required this.recipeIngredient,
      required this.recipeInstructions,
      required this.recipeYield,
      this.totalTime,
      required this.tool,
      this.url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dateCreated, r'Recipe', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(description, r'Recipe', 'description');
    BuiltValueNullFieldError.checkNotNull(keywords, r'Recipe', 'keywords');
    BuiltValueNullFieldError.checkNotNull(name, r'Recipe', 'name');
    BuiltValueNullFieldError.checkNotNull(nutrition, r'Recipe', 'nutrition');
    BuiltValueNullFieldError.checkNotNull(recipeCategory, r'Recipe', 'recipeCategory');
    BuiltValueNullFieldError.checkNotNull(recipeIngredient, r'Recipe', 'recipeIngredient');
    BuiltValueNullFieldError.checkNotNull(recipeInstructions, r'Recipe', 'recipeInstructions');
    BuiltValueNullFieldError.checkNotNull(recipeYield, r'Recipe', 'recipeYield');
    BuiltValueNullFieldError.checkNotNull(tool, r'Recipe', 'tool');
  }

  @override
  Recipe rebuild(void Function(RecipeBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  RecipeBuilder toBuilder() => RecipeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Recipe &&
        cookTime == other.cookTime &&
        dateCreated == other.dateCreated &&
        dateModified == other.dateModified &&
        description == other.description &&
        id == other.id &&
        image == other.image &&
        imagePlaceholderUrl == other.imagePlaceholderUrl &&
        imageUrl == other.imageUrl &&
        keywords == other.keywords &&
        prepTime == other.prepTime &&
        name == other.name &&
        nutrition == other.nutrition &&
        recipeCategory == other.recipeCategory &&
        recipeIngredient == other.recipeIngredient &&
        recipeInstructions == other.recipeInstructions &&
        recipeYield == other.recipeYield &&
        totalTime == other.totalTime &&
        tool == other.tool &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cookTime.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, dateModified.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, imagePlaceholderUrl.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, prepTime.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nutrition.hashCode);
    _$hash = $jc(_$hash, recipeCategory.hashCode);
    _$hash = $jc(_$hash, recipeIngredient.hashCode);
    _$hash = $jc(_$hash, recipeInstructions.hashCode);
    _$hash = $jc(_$hash, recipeYield.hashCode);
    _$hash = $jc(_$hash, totalTime.hashCode);
    _$hash = $jc(_$hash, tool.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Recipe')
          ..add('cookTime', cookTime)
          ..add('dateCreated', dateCreated)
          ..add('dateModified', dateModified)
          ..add('description', description)
          ..add('id', id)
          ..add('image', image)
          ..add('imagePlaceholderUrl', imagePlaceholderUrl)
          ..add('imageUrl', imageUrl)
          ..add('keywords', keywords)
          ..add('prepTime', prepTime)
          ..add('name', name)
          ..add('nutrition', nutrition)
          ..add('recipeCategory', recipeCategory)
          ..add('recipeIngredient', recipeIngredient)
          ..add('recipeInstructions', recipeInstructions)
          ..add('recipeYield', recipeYield)
          ..add('totalTime', totalTime)
          ..add('tool', tool)
          ..add('url', url))
        .toString();
  }
}

class RecipeBuilder implements Builder<Recipe, RecipeBuilder> {
  _$Recipe? _$v;

  Duration? _cookTime;
  Duration? get cookTime => _$this._cookTime;
  set cookTime(Duration? cookTime) => _$this._cookTime = cookTime;

  tz.TZDateTime? _dateCreated;
  tz.TZDateTime? get dateCreated => _$this._dateCreated;
  set dateCreated(tz.TZDateTime? dateCreated) => _$this._dateCreated = dateCreated;

  tz.TZDateTime? _dateModified;
  tz.TZDateTime? get dateModified => _$this._dateModified;
  set dateModified(tz.TZDateTime? dateModified) => _$this._dateModified = dateModified;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  Uri? _image;
  Uri? get image => _$this._image;
  set image(Uri? image) => _$this._image = image;

  Uri? _imagePlaceholderUrl;
  Uri? get imagePlaceholderUrl => _$this._imagePlaceholderUrl;
  set imagePlaceholderUrl(Uri? imagePlaceholderUrl) => _$this._imagePlaceholderUrl = imagePlaceholderUrl;

  Uri? _imageUrl;
  Uri? get imageUrl => _$this._imageUrl;
  set imageUrl(Uri? imageUrl) => _$this._imageUrl = imageUrl;

  BuiltSet<String>? _keywords;
  BuiltSet<String>? get keywords => _$this._keywords;
  set keywords(BuiltSet<String>? keywords) => _$this._keywords = keywords;

  Duration? _prepTime;
  Duration? get prepTime => _$this._prepTime;
  set prepTime(Duration? prepTime) => _$this._prepTime = prepTime;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Nutrition? _nutrition;
  Nutrition? get nutrition => _$this._nutrition;
  set nutrition(Nutrition? nutrition) => _$this._nutrition = nutrition;

  String? _recipeCategory;
  String? get recipeCategory => _$this._recipeCategory;
  set recipeCategory(String? recipeCategory) => _$this._recipeCategory = recipeCategory;

  BuiltList<String>? _recipeIngredient;
  BuiltList<String>? get recipeIngredient => _$this._recipeIngredient;
  set recipeIngredient(BuiltList<String>? recipeIngredient) => _$this._recipeIngredient = recipeIngredient;

  BuiltList<String>? _recipeInstructions;
  BuiltList<String>? get recipeInstructions => _$this._recipeInstructions;
  set recipeInstructions(BuiltList<String>? recipeInstructions) => _$this._recipeInstructions = recipeInstructions;

  int? _recipeYield;
  int? get recipeYield => _$this._recipeYield;
  set recipeYield(int? recipeYield) => _$this._recipeYield = recipeYield;

  Duration? _totalTime;
  Duration? get totalTime => _$this._totalTime;
  set totalTime(Duration? totalTime) => _$this._totalTime = totalTime;

  BuiltList<String>? _tool;
  BuiltList<String>? get tool => _$this._tool;
  set tool(BuiltList<String>? tool) => _$this._tool = tool;

  Uri? _url;
  Uri? get url => _$this._url;
  set url(Uri? url) => _$this._url = url;

  RecipeBuilder();

  RecipeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cookTime = $v.cookTime;
      _dateCreated = $v.dateCreated;
      _dateModified = $v.dateModified;
      _description = $v.description;
      _id = $v.id;
      _image = $v.image;
      _imagePlaceholderUrl = $v.imagePlaceholderUrl;
      _imageUrl = $v.imageUrl;
      _keywords = $v.keywords;
      _prepTime = $v.prepTime;
      _name = $v.name;
      _nutrition = $v.nutrition;
      _recipeCategory = $v.recipeCategory;
      _recipeIngredient = $v.recipeIngredient;
      _recipeInstructions = $v.recipeInstructions;
      _recipeYield = $v.recipeYield;
      _totalTime = $v.totalTime;
      _tool = $v.tool;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Recipe other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Recipe;
  }

  @override
  void update(void Function(RecipeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Recipe build() => _build();

  _$Recipe _build() {
    Recipe._defaults(this);
    final _$result = _$v ??
        _$Recipe._(
            cookTime: cookTime,
            dateCreated: BuiltValueNullFieldError.checkNotNull(dateCreated, r'Recipe', 'dateCreated'),
            dateModified: dateModified,
            description: BuiltValueNullFieldError.checkNotNull(description, r'Recipe', 'description'),
            id: id,
            image: image,
            imagePlaceholderUrl: imagePlaceholderUrl,
            imageUrl: imageUrl,
            keywords: BuiltValueNullFieldError.checkNotNull(keywords, r'Recipe', 'keywords'),
            prepTime: prepTime,
            name: BuiltValueNullFieldError.checkNotNull(name, r'Recipe', 'name'),
            nutrition: BuiltValueNullFieldError.checkNotNull(nutrition, r'Recipe', 'nutrition'),
            recipeCategory: BuiltValueNullFieldError.checkNotNull(recipeCategory, r'Recipe', 'recipeCategory'),
            recipeIngredient: BuiltValueNullFieldError.checkNotNull(recipeIngredient, r'Recipe', 'recipeIngredient'),
            recipeInstructions:
                BuiltValueNullFieldError.checkNotNull(recipeInstructions, r'Recipe', 'recipeInstructions'),
            recipeYield: BuiltValueNullFieldError.checkNotNull(recipeYield, r'Recipe', 'recipeYield'),
            totalTime: totalTime,
            tool: BuiltValueNullFieldError.checkNotNull(tool, r'Recipe', 'tool'),
            url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
