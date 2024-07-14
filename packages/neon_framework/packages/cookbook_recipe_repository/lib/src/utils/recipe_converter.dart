import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cookbook_recipe_repository/src/models/models.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:timezone/timezone.dart' as tz;

/// Converter for converting a recipe into the representation used by the nextcloud package.
final class RecipeToApiConverter extends Converter<Recipe, cookbook.Recipe> {
  /// Creates a new recipe converter.
  const RecipeToApiConverter();

  @override
  cookbook.Recipe convert(Recipe input) {
    return cookbook.Recipe((b) {
      b
        ..cookTime = input.cookTime?.toIso8601String()
        ..dateCreated = input.dateCreated.toIso8601String()
        ..dateModified = input.dateModified?.toIso8601String()
        ..description = input.description
        ..id = input.id
        ..image = input.image?.toString()
        ..imagePlaceholderUrl = input.imagePlaceholderUrl?.toString()
        ..imageUrl = input.imageUrl?.toString()
        ..keywords = input.keywords.join(',')
        ..name = input.name
        ..nutrition.replace(input.nutrition)
        ..prepTime = input.prepTime?.toIso8601String()
        ..recipeCategory = input.recipeCategory
        ..recipeIngredient.replace(input.recipeIngredient)
        ..recipeInstructions.replace(input.recipeInstructions)
        ..recipeYield = input.recipeYield
        ..tool.replace(input.tool)
        ..totalTime = input.totalTime?.toIso8601String()
        ..url = input.url?.toString();
    });
  }
}

/// Converter for converting a nextcloud package recipe into the representation used by the repository.
final class ApiToRecipeConverter extends Converter<cookbook.Recipe, Recipe> {
  /// Creates a new recipe converter.
  const ApiToRecipeConverter();

  @override
  Recipe convert(cookbook.Recipe input) {
    return Recipe((b) {
      b
        ..cookTime = Iso8601Duration.tryParse(input.cookTime)
        ..dateCreated = Iso8601DateTime.tryParse(tz.UTC, input.dateCreated)
        ..dateModified = Iso8601DateTime.tryParse(tz.UTC, input.dateModified)
        ..description = input.description
        ..id = input.id
        ..image = Uri.tryParse(input.image)
        ..imagePlaceholderUrl = Uri.tryParse(input.imagePlaceholderUrl)
        ..imageUrl = Uri.tryParse(input.imageUrl)
        ..keywords = input.keywords.split(',').toBuiltSet()
        ..name = input.name
        ..nutrition = input.nutrition
        ..prepTime = Iso8601Duration.tryParse(input.prepTime)
        ..recipeCategory = input.recipeCategory
        ..recipeIngredient = input.recipeIngredient
        ..recipeInstructions = input.recipeInstructions
        ..recipeYield = input.recipeYield
        ..tool = input.tool
        ..totalTime = Iso8601Duration.tryParse(input.totalTime)
        ..url = Uri.tryParse(input.url);
    });
  }
}
