import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:timezone/timezone.dart' as tz;

part 'recipe.g.dart';

// TODO: only one image url is really needed.

/// The model of a Recipe.
///
/// This class is closely related to the one from the cookbook api.
/// It deserializes the time, duration and uri fields.
@BuiltValue(nestedBuilders: false)
abstract class Recipe implements Built<Recipe, RecipeBuilder> {
  /// Creates a new recipe.
  factory Recipe([void Function(RecipeBuilder) updates]) = _$Recipe;
  Recipe._();

  /// The time required for cooking in ISO8601 format.
  Duration? get cookTime;

  /// The date the recipe was created in the app.
  tz.TZDateTime get dateCreated;

  /// The date the recipe was modified lastly in the app.
  tz.TZDateTime? get dateModified;

  /// A description of the recipe or the empty string.
  String get description;

  /// The index of the recipe. Note the representation as a string as the representation might change in the future.
  String? get id;

  /// The URL of the original recipe.
  Uri? get image;

  /// The URL of the placeholder of the recipe image.
  Uri? get imagePlaceholderUrl;

  /// The URL of the recipe image.
  Uri? get imageUrl;

  /// A comma-separated list of recipe keywords, can be empty string.
  BuiltSet<String> get keywords;

  /// The time required for preparation in ISO8601 format.
  Duration? get prepTime;

  /// The name of the recipe.
  String get name;

  /// Nutritional information about the recipe.
  Nutrition get nutrition;

  /// The category of the recipe.
  String get recipeCategory;

  /// A list of ingredients used in the recipe.
  BuiltList<String> get recipeIngredient;

  /// An ordered list with steps in making the recipe.
  BuiltList<String> get recipeInstructions;

  /// Number of servings in recipe.
  int get recipeYield;

  /// The time required for the complete processing in ISO8601 format.
  Duration? get totalTime;

  /// A list of objects used (but not consumed) when performing instructions or a direction.
  BuiltList<String> get tool;

  /// The URL the recipe was found at or the empty string.
  Uri? get url;

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(RecipeBuilder b) {
    b
      ..recipeYield ??= 1
      ..recipeCategory ??= Category.uncategorized;

    if (b.id?.isEmpty ?? false) {
      b.id = null;
    }

    if (b.cookTime == Duration.zero) {
      b.cookTime = null;
    }

    if (b.totalTime == Duration.zero) {
      b.totalTime = null;
    }

    if (b.prepTime == Duration.zero) {
      b.prepTime = null;
    }
  }
}
