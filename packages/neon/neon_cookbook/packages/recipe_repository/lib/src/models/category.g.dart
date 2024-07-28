// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Category extends Category {
  @override
  final String mainRecipeId;
  @override
  final String name;
  @override
  final int recipeCount;

  factory _$Category([void Function(CategoryBuilder)? updates]) => (CategoryBuilder()..update(updates))._build();

  _$Category._({required this.mainRecipeId, required this.name, required this.recipeCount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mainRecipeId, r'Category', 'mainRecipeId');
    BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name');
    BuiltValueNullFieldError.checkNotNull(recipeCount, r'Category', 'recipeCount');
  }

  @override
  Category rebuild(void Function(CategoryBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
        mainRecipeId == other.mainRecipeId &&
        name == other.name &&
        recipeCount == other.recipeCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mainRecipeId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, recipeCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Category')
          ..add('mainRecipeId', mainRecipeId)
          ..add('name', name)
          ..add('recipeCount', recipeCount))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category? _$v;

  String? _mainRecipeId;
  String? get mainRecipeId => _$this._mainRecipeId;
  set mainRecipeId(String? mainRecipeId) => _$this._mainRecipeId = mainRecipeId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _recipeCount;
  int? get recipeCount => _$this._recipeCount;
  set recipeCount(int? recipeCount) => _$this._recipeCount = recipeCount;

  CategoryBuilder();

  CategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mainRecipeId = $v.mainRecipeId;
      _name = $v.name;
      _recipeCount = $v.recipeCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Category;
  }

  @override
  void update(void Function(CategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Category build() => _build();

  _$Category _build() {
    final _$result = _$v ??
        _$Category._(
            mainRecipeId: BuiltValueNullFieldError.checkNotNull(mainRecipeId, r'Category', 'mainRecipeId'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name'),
            recipeCount: BuiltValueNullFieldError.checkNotNull(recipeCount, r'Category', 'recipeCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
