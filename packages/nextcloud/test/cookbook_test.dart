import 'package:built_value/json_object.dart';
import 'package:built_value_test/matcher.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/src/api/cookbook.openapi.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets(
    'cookbook',
    'cookbook',
    (preset) {
      late DockerContainer container;
      late NextcloudClient client;

      setUp(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(container);
      });

      tearDown(() async {
        await container.destroy();
      });

      group('CookbookVersionCheck', () {
        test('Is supported', () async {
          final response = await client.cookbook.getVersionCheck();

          expect(response.isSupported, isTrue);
        });
      });

      group('categories', () {
        test('listCategories', () async {
          final response = await client.cookbook.categories.listCategories();

          expect(response.body, hasLength(7));
        });

        test('recipesInCategory', () async {
          final response = await client.cookbook.categories.recipesInCategory(category: 'Soup');

          expect(response.body, hasLength(2));
        });

        test('renameCategory', () async {
          final request = cookbook.RenameCategoryRequestApplicationJsonBuilder()..name = 'Delicious Soup';

          final response = await client.cookbook.categories.renameCategory(
            category: 'Soup',
            $body: request.build(),
          );

          expect(response.body, request.name);
        });
      });

      group('misc', () {
        test('getConfig', () async {
          final response = await client.cookbook.misc.getConfig();
          final visibleInfoBlocks = cookbook.VisibleInfoBlocksBuilder()
            ..preparationTime = true
            ..cookingTime = true
            ..totalTime = true
            ..nutritionInformation = true
            ..tools = true;
          final expected = cookbook.ConfigBuilder()
            ..folder = '/Recipes'
            ..updateInterval = 5
            ..printImage = true
            ..visibleInfoBlocks = visibleInfoBlocks;

          expect(response.body, equalsBuilt(expected.build()));
        });

        test('reindex', () async {
          final response = await client.cookbook.misc.reindex();

          expect(response.body, 'Search index rebuilt successfully');
        });

        test('setConfig', () async {
          final config = cookbook.ConfigBuilder()..folder = '/';
          final response = await client.cookbook.misc.setConfig($body: config.build());

          expect(response.body, 'OK');
        });

        test('version', () async {
          final response = await client.cookbook.misc.version();

          final cookbookVersion = response.body.cookbookVersion!;
          expect(cookbookVersion[0], JsonObject(preset.version.major));
          expect(cookbookVersion[1], JsonObject(preset.version.minor));
        });
      });

      group('recipes', () {
        test('callImport', () async {
          final url = cookbook.UrlBuilder()..url = 'http://localhost/static/recipe.html';
          final response = await client.cookbook.recipes.$import($body: url.build());

          expect(response.body, isA<Recipe>());
        });

        test('deleteRecipe', () async {
          const id = '0';
          final response = await client.cookbook.recipes.deleteRecipe(id: id);

          expect(response.body, equals('Recipe $id deleted successfully'));
        });

        test('getImage', () async {
          final recipes = await client.cookbook.recipes.listRecipes();
          final recipeWithoutImage = recipes.body.firstWhere((stub) => stub.name == 'Recipe Without an image');
          final response = await client.cookbook.recipes.getImage(
            id: recipeWithoutImage.id,
          );

          expect(response.body, isNotNull);

          final recipeWithImage = recipes.body.firstWhere((stub) => stub.name == "Chef John's Gazpacho");
          final response2 = await client.cookbook.recipes.getImage(
            id: recipeWithImage.id,
            size: GetImageSize.full,
          );

          expect(response2.body, isNotNull);
        });

        test('listRecipes', () async {
          final response = await client.cookbook.recipes.listRecipes();

          expect(response.body, hasLength(19));
        });

        test('newRecipe', () async {
          final recipe = cookbook.RecipeBuilder()
            ..name = 'My super cool recipe'
            ..dateCreated = DateTime.utc(2023).toIso8601String();
          final response = await client.cookbook.recipes.newRecipe($body: recipe.build());

          expect(response.body, isNotNull);
        });

        test('recipeDetails', () async {
          final recipes = await client.cookbook.recipes.listRecipes();

          for (final recipe in recipes.body) {
            final response = await client.cookbook.recipes.recipeDetails(
              id: recipe.id,
            );

            expect(response.body, isNotNull);
          }
        });

        test('search', () async {
          final response = await client.cookbook.recipes.search(query: 'Vegan');

          expect(response.body, hasLength(2));
        });

        test('updateRecipe', () async {
          final recipe = cookbook.RecipeBuilder()
            ..name = 'My super cool recipe'
            ..dateCreated = DateTime.utc(2023).toIso8601String();
          final response = await client.cookbook.recipes.updateRecipe(id: '0', $body: recipe.build());

          expect(response.body, isNotNull);
        });
      });

      group('tags', () {
        test('listKeywords', () async {
          final response = await client.cookbook.tags.listKeywords();

          expect(response.body, hasLength(16));
        });

        test('recipesWithKeyword', () async {
          final response = await client.cookbook.tags.recipesWithKeyword(keywords: 'Desserts');

          expect(response.body, hasLength(0));
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
