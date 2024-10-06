import 'package:built_collection/built_collection.dart';
import 'package:cookbook_recipe_repository/src/models/models.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;

/// {@template recipe_failure}
/// A base failure for the recipe repository failures.
/// {@endtemplate}
abstract class RecipeFailure with EquatableMixin implements Exception {
  /// {@macro recipe_failure}
  const RecipeFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// {@template create_recipe_failure}
/// Thrown when creating a recipe fails.
/// {@endtemplate}
class CreateRecipeFailure extends RecipeFailure {
  /// {@macro create_recipe_failure}
  const CreateRecipeFailure(super.error);
}

/// {@template read_recipe_failure}
/// Thrown when fetching a recipe fails.
/// {@endtemplate}
class ReadRecipeFailure extends RecipeFailure {
  /// {@macro read_recipe_failure}
  const ReadRecipeFailure(super.error);
}

/// {@template update_recipe_failure}
/// Thrown when updating a recipe fails.
/// {@endtemplate}
class UpdateRecipeFailure extends RecipeFailure {
  /// {@macro update_recipe_failure}
  const UpdateRecipeFailure(super.error);
}

/// {@template delete_recipe_failure}
/// Thrown when deleting a recipe fails.
/// {@endtemplate}
class DeleteRecipeFailure extends RecipeFailure {
  /// {@macro delete_recipe_failure}
  const DeleteRecipeFailure(super.error);
}

/// {@template import_recipe_failure}
/// Thrown when importing a recipe fails.
/// {@endtemplate}
class ImportRecipeFailure extends RecipeFailure {
  /// {@macro import_recipe_failure}
  const ImportRecipeFailure(super.error);
}

/// {@template read_categories_failure}
/// Thrown when reading the categories fails.
/// {@endtemplate}
class ReadCategoriesFailure extends RecipeFailure {
  /// {@macro read_categories_failure}
  const ReadCategoriesFailure(super.error);
}

/// {@template read_category_failure}
/// Thrown when reading a single category fails.
/// {@endtemplate}
class ReadCategoryFailure extends RecipeFailure {
  /// {@macro read_category_failure}
  const ReadCategoryFailure(super.error);
}

/// {@template recipe_repository}
/// A repository that manages recipe data.
/// {@endtemplate}
final class RecipeRepository {
  /// {@macro recipe_repository}
  RecipeRepository({
    required cookbook.$CategoriesClient categoriesProvider,
    required cookbook.$RecipesClient recipesProvider,
  })  : _recipes = recipesProvider,
        _categories = categoriesProvider;

  /// Access to the categories of the recipes.
  final cookbook.$CategoriesClient _categories;

  /// Everything related to recipes and their usage.
  final cookbook.$RecipesClient _recipes;

  /// Creates a new recipe.
  ///
  /// The `id` value must be `null`.
  Future<void> createRecipe(Recipe recipe) async {
    final id = recipe.id;
    if (id != null) {
      throw ArgumentError.value(recipe, 'recipe', 'must have a null id');
    }

    try {
      const converter = RecipeToApiConverter();

      await _recipes.newRecipe($body: converter.convert(recipe));
    } catch (error) {
      throw CreateRecipeFailure(error);
    }
  }

  /// Reads the recipe with the given [id].
  Future<Recipe> readRecipe(String id) async {
    try {
      const converter = ApiToRecipeConverter();

      final response = await _recipes.recipeDetails(id: id);
      return converter.convert(response.body);
    } catch (error) {
      throw ReadRecipeFailure(error);
    }
  }

  /// Updates the given [recipe].
  ///
  /// The `id` value must not be null.
  Future<void> updateRecipe(Recipe recipe) async {
    final id = recipe.id;
    if (id == null) {
      throw ArgumentError.value(recipe, 'recipe', 'must have a non null id');
    }

    try {
      const converter = RecipeToApiConverter();

      await _recipes.updateRecipe(id: id, $body: converter.convert(recipe));
    } catch (error) {
      throw UpdateRecipeFailure(error);
    }
  }

  /// Deletes the given [recipe].
  ///
  /// The `id` value must not be null.
  Future<void> deleteRecipe(Recipe recipe) async {
    final id = recipe.id;
    if (id == null) {
      throw ArgumentError.value(recipe, 'recipe', 'must have a non null id');
    }

    try {
      await _recipes.deleteRecipe(id: id);
    } catch (error) {
      throw DeleteRecipeFailure(error);
    }
  }

  /// Imports the recipe at the given [url].
  Future<void> importRecipe(Uri url) async {
    try {
      final requestUrl = cookbook.Url((b) {
        b.url = url.toString();
      });

      await _recipes.$import($body: requestUrl);
    } catch (error) {
      throw ImportRecipeFailure(error);
    }
  }

  /// Reads all available categories.
  Future<BuiltList<Category>> readCategories() async {
    try {
      final allRecipes = await _readAllStubs();
      if (allRecipes.isEmpty) {
        return BuiltList();
      }

      final categories = ListBuilder<Category>();
      final allCategory = Category((b) {
        b
          ..name = Category.all
          ..recipeCount = allRecipes.length
          ..mainRecipeId = allRecipes.first.id;
      });

      categories.add(allCategory);

      final response = await _categories.listCategories();

      final categoriesWithRecipe = response.body.where((r) => r.recipeCount > 0);
      final mainRecipes = await Future.wait(
        categoriesWithRecipe.map(_fetchCategoryMainRecipe),
      );

      for (final element in categoriesWithRecipe.indexed) {
        final category = Category((b) {
          b
            ..name = element.$2.name
            ..recipeCount = element.$2.recipeCount
            ..mainRecipeId = mainRecipes[element.$1].id;
        });

        categories.add(category);
      }

      return categories.build();
    } catch (error) {
      throw ReadCategoriesFailure(error);
    }
  }

  /// Reads the category identified by the given [name].
  Future<BuiltList<RecipeStub>> readCategory({required String name}) async {
    const converter = RecipeStubConverter();

    try {
      switch (name) {
        case Category.all:
          return await _readAllStubs();

        case Category.uncategorized:
          final response = await _categories.recipesInCategory(category: '_');
          return response.body.map(converter.convert).toBuiltList();

        default:
          final response = await _categories.recipesInCategory(category: name);
          return response.body.map(converter.convert).toBuiltList();
      }
    } catch (error) {
      throw ReadCategoryFailure(error);
    }
  }

  /// Primitive function to get the cover recipe for a [category].
  ///
  /// The cover recipe must not contain a custom image.
  Future<RecipeStub> _fetchCategoryMainRecipe(cookbook.Category category) async {
    assert(category.recipeCount > 0, 'category must contain at least one recipe.');

    final categoryRecipes = await readCategory(name: category.name);
    return categoryRecipes.first;
  }

  /// Reads all recipe stubs.
  Future<BuiltList<RecipeStub>> _readAllStubs() async {
    const converter = RecipeStubConverter();

    final response = await _recipes.listRecipes();
    return response.body.map(converter.convert).toBuiltList();
  }
}
