import 'package:built_collection/built_collection.dart';
import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  final repositoryRecipe = Recipe((b) {
    b
      ..cookTime = Duration.zero
      ..dateCreated = tz.TZDateTime(tz.UTC, 2024)
      ..dateModified = tz.TZDateTime(tz.UTC, 2024)
      ..description = 'description'
      ..id = 'id'
      ..image = Uri.https('image')
      ..imagePlaceholderUrl = Uri.https('imagePlaceholderUrl')
      ..imageUrl = Uri.https('imageUrl')
      ..keywords = BuiltSet({'keyword', 'keyword2'})
      ..prepTime = const Duration(hours: 1)
      ..name = 'name'
      ..nutrition = Nutrition()
      ..recipeCategory = 'recipeCategory'
      ..recipeIngredient = BuiltList(['recipeIngredient'])
      ..recipeInstructions = BuiltList(['recipeInstructions'])
      ..recipeYield = 1
      ..totalTime = const Duration(minutes: 1)
      ..tool = BuiltList(['tool', 'tool2'])
      ..url = Uri.https('url');
  });

  final apiRecipe = cookbook.Recipe((b) {
    b
      ..cookTime = null
      ..dateCreated = '2024-01-01T00:00:00.000Z'
      ..dateModified = '2024-01-01T00:00:00.000Z'
      ..description = 'description'
      ..id = 'id'
      ..image = 'https://image'
      ..imagePlaceholderUrl = 'https://imageplaceholderurl'
      ..imageUrl = 'https://imageurl'
      ..keywords = 'keyword,keyword2'
      ..prepTime = 'PT1H'
      ..name = 'name'
      ..recipeCategory = 'recipeCategory'
      ..recipeIngredient = ListBuilder(['recipeIngredient'])
      ..recipeInstructions = ListBuilder(['recipeInstructions'])
      ..recipeYield = 1
      ..totalTime = 'PT1M'
      ..tool = ListBuilder(['tool', 'tool2'])
      ..url = 'https://url';
  });

  test('RecipeToApiConverter converts from repository to api', () {
    const converter = RecipeToApiConverter();

    expect(
      converter.convert(repositoryRecipe),
      equalsBuilt(apiRecipe),
    );
  });

  test('RecipeToApiConverter converts from api to repository ', () {
    const converter = ApiToRecipeConverter();

    expect(
      converter.convert(apiRecipe),
      equalsBuilt(repositoryRecipe),
    );
  });
}
