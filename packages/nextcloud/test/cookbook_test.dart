import 'package:built_value/json_object.dart';
import 'package:built_value_test/matcher.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  final targetFactory = TestTargetFactory.instance;

  presets(
    targetFactory,
    'cookbook',
    'cookbook',
    (preset) {
      late TestTargetInstance target;
      late NextcloudClient client;
      setUpAll(() async {
        target = await targetFactory.spawn(preset);
        client = await target.createClient();
      });
      tearDownAll(() async {
        await target.destroy();
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
          final recipe = cookbook.RecipeBuilder()
            ..name = 'My super cool recipe'
            ..dateCreated = DateTime.utc(2023).toIso8601String()
            ..recipeCategory = 'Test';
          final createResponse = await client.cookbook.recipes.newRecipe($body: recipe.build());
          addTearDown(() async {
            closeFixture();
            await client.cookbook.recipes.deleteRecipe(id: createResponse.body.toString());
          });
          expect(createResponse.body, isNotNull);

          final request = cookbook.RenameCategoryRequestApplicationJsonBuilder()..name = 'Delicious Soup';

          final response = await client.cookbook.categories.renameCategory(
            category: 'Test',
            $body: request.build(),
          );

          expect(response.body, request.name);
        });
      });

      group('misc', () {
        final expectedConfig = cookbook.ConfigBuilder()
          ..folder = '/Recipes'
          ..updateInterval = 5
          ..printImage = true
          ..visibleInfoBlocks.update(
            (b) => b
              ..preparationTime = true
              ..cookingTime = true
              ..totalTime = true
              ..nutritionInformation = true
              ..tools = true,
          );

        test('getConfig', () async {
          final response = await client.cookbook.misc.getConfig();

          expect(response.body, equalsBuilt(expectedConfig.build()));
        });

        test('reindex', () async {
          final response = await client.cookbook.misc.reindex();

          expect(response.body, 'Search index rebuilt successfully');
        });

        test('setConfig', () async {
          addTearDown(() async {
            closeFixture();
            await client.cookbook.misc.setConfig($body: expectedConfig.build());
          });

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
          final url = cookbook.UrlBuilder()..url = '${target.targetURL}/static/recipe.html';
          final response = await client.cookbook.recipes.$import($body: url.build());
          addTearDown(() async {
            closeFixture();
            await client.cookbook.recipes.deleteRecipe(id: response.body.id!);
          });

          expect(response.body, isA<cookbook.Recipe>());
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
            size: cookbook.GetImageSize.full,
          );

          expect(response2.body, isNotNull);
        });

        test('listRecipes', () async {
          final response = await client.cookbook.recipes.listRecipes();

          expect(response.body, hasLength(19));
        });

        test('newRecipe and deleteRecipe', () async {
          final recipe = cookbook.RecipeBuilder()
            ..name = 'My super cool recipe'
            ..dateCreated = DateTime.utc(2023).toIso8601String();
          final createResponse = await client.cookbook.recipes.newRecipe($body: recipe.build());
          expect(createResponse.body, isNotNull);

          final deleteResponse = await client.cookbook.recipes.deleteRecipe(id: createResponse.body.toString());
          expect(deleteResponse.body, equals('Recipe ${createResponse.body} deleted successfully'));
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
          final createResponse = await client.cookbook.recipes.newRecipe($body: recipe.build());
          addTearDown(() async {
            closeFixture();
            await client.cookbook.recipes.deleteRecipe(id: createResponse.body.toString());
          });
          expect(createResponse.body, isNotNull);

          recipe
            ..id = createResponse.body.toString()
            ..name = 'My updated super cool recipe';
          final updateResponse =
              await client.cookbook.recipes.updateRecipe(id: createResponse.body.toString(), $body: recipe.build());
          expect(updateResponse.body, isNotNull);
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
