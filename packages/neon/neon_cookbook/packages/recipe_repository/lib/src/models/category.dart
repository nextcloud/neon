import 'package:built_value/built_value.dart';

part 'category.g.dart';

/// The model of a Category.
///
/// This class is closely related to the one from the cookbook api.
/// It contains further information like the thumbnail url.
abstract class Category implements Built<Category, CategoryBuilder> {
  /// Creates a new category.
  factory Category([void Function(CategoryBuilder) updates]) = _$Category;
  Category._();

  /// The id of the main recipe.
  ///
  /// This recipe can be used to fetch the category cover image.
  String get mainRecipeId;

  /// The name of the category.
  String get name;

  /// The number of recipes in the category.
  int get recipeCount;

  /// The name of the category containing all recipes.
  static const String all = '_';

  /// The name of the category containing uncategorized images.
  static const String uncategorized = '*';
}
