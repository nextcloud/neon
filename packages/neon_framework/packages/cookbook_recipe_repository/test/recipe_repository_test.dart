import 'package:built_collection/built_collection.dart';
import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

class _MockCategoriesClient extends Mock implements cookbook.$CategoriesClient {}

class _MockRecipesClient extends Mock implements cookbook.$RecipesClient {}

class _FakeApiRecipe extends Fake implements cookbook.Recipe {}

class _FakeUrl extends Fake implements cookbook.Url {}

const _recipeConverter = RecipeToApiConverter();
const _stubConverter = RecipeStubConverter();

void main() {
  late cookbook.$CategoriesClient categoriesClient;
  late cookbook.$RecipesClient recipesClient;

  late RecipeRepository repository;

  setUpAll(() {
    registerFallbackValue(_FakeApiRecipe());
    registerFallbackValue(_FakeUrl());
  });

  setUp(() {
    categoriesClient = _MockCategoriesClient();
    recipesClient = _MockRecipesClient();

    repository = RecipeRepository(
      categoriesProvider: categoriesClient,
      recipesProvider: recipesClient,
    );
  });

  Recipe createRecipe({
    Duration? cookTime = const Duration(minutes: 1),
    tz.TZDateTime? dateCreated,
    tz.TZDateTime? dateModified,
    String description = 'description',
    String? id,
    Uri? image,
    Uri? imagePlaceholderUrl,
    Uri? imageUrl,
    Set<String> keywords = const {'keyword'},
    Duration? prepTime = const Duration(minutes: 1),
    String name = 'name',
    Nutrition? nutrition,
    String recipeCategory = 'recipeCategory',
    List<String> recipeIngredient = const [],
    List<String> recipeInstructions = const [],
    int recipeYield = 1,
    Duration? totalTime = const Duration(minutes: 1),
    List<String> tool = const [],
    Uri? url,
  }) {
    return Recipe((b) {
      b
        ..cookTime = cookTime
        ..dateCreated = dateCreated ?? tz.TZDateTime(tz.UTC, 2024)
        ..dateModified = dateModified ?? tz.TZDateTime(tz.UTC, 2024)
        ..description = description
        ..id = id
        ..image = image ?? Uri.https('image')
        ..imagePlaceholderUrl = imagePlaceholderUrl ?? Uri.https('imagePlaceholderUrl')
        ..imageUrl = imageUrl ?? Uri.https('imageUrl')
        ..keywords = BuiltSet(keywords)
        ..prepTime = prepTime
        ..name = name
        ..nutrition = nutrition ?? Nutrition()
        ..recipeCategory = recipeCategory
        ..recipeIngredient = BuiltList(recipeIngredient)
        ..recipeInstructions = BuiltList(recipeInstructions)
        ..recipeYield = recipeYield
        ..totalTime = totalTime
        ..tool = BuiltList(tool)
        ..url = url ?? Uri.https('url');
    });
  }

  group('RecipeRepository', () {
    final defaultRecipe = createRecipe(id: 'id');
    final defaultApiRecipe = _recipeConverter.convert(defaultRecipe);

    final apiStubs = List.generate(10, (i) {
      return cookbook.RecipeStub((b) {
        b
          ..dateCreated = '2024-07-14T10:25:58.204680Z'
          ..dateModified = '2024-07-14T10:25:58.i.toString()'
          ..id = i.toString()
          ..recipeId = 0
          ..imagePlaceholderUrl = 'https://imageplaceholderurl'
          ..imageUrl = 'https://imageurl'
          ..keywords = 'keywords'
          ..name = 'name';
      });
    }).toBuiltList();

    final stubs = apiStubs.map(_stubConverter.convert).toBuiltList();

    test('RecipeFailure equality', () {
      expect(
        const CreateRecipeFailure(''),
        // ignore: prefer_const_constructors
        equals(CreateRecipeFailure('')),
      );
    });

    group('createRecipe', () {
      test('throws with id set', () async {
        expect(
          repository.createRecipe(defaultRecipe),
          throwsArgumentError,
        );

        verifyNever(
          () => recipesClient.newRecipe(
            $body: any(named: r'$body', that: equalsBuilt(defaultApiRecipe)),
          ),
        );
      });

      test('rethrows errors as a CreateRecipeFailure', () async {
        when(() => recipesClient.newRecipe($body: any(named: r'$body'))).thenThrow(
          'failed to create recipe',
        );

        expect(
          repository.createRecipe(createRecipe()),
          throwsA(
            isA<CreateRecipeFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to create recipe'),
            ),
          ),
        );

        verify(
          () => recipesClient.newRecipe(
            $body: any(named: r'$body', that: equalsBuilt(_recipeConverter.convert(createRecipe()))),
          ),
        ).called(1);
      });

      test('creates a new recipe', () async {
        when(() => recipesClient.newRecipe($body: any(named: r'$body')))
            .thenAnswer((_) async => const DynamiteResponse(200, 1, null));

        expect(
          repository.createRecipe(createRecipe()),
          completes,
        );

        verify(
          () => recipesClient.newRecipe(
            $body: any(named: r'$body', that: equalsBuilt(_recipeConverter.convert(createRecipe()))),
          ),
        ).called(1);
      });
    });

    group('readRecipe', () {
      test('rethrows errors as a ReadRecipeFailure', () async {
        when(() => recipesClient.recipeDetails(id: any(named: 'id'))).thenThrow(
          'failed to read recipe',
        );

        expect(
          repository.readRecipe('id'),
          throwsA(
            isA<ReadRecipeFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to read recipe'),
            ),
          ),
        );

        verify(
          () => recipesClient.recipeDetails(id: any(named: 'id', that: equals('id'))),
        ).called(1);
      });

      test('reads recipe from the provider', () async {
        when(() => recipesClient.recipeDetails(id: any(named: 'id')))
            .thenAnswer((_) async => DynamiteResponse(200, defaultApiRecipe, null));

        expect(
          repository.readRecipe('id'),
          completion(equalsBuilt(defaultRecipe)),
        );

        verify(
          () => recipesClient.recipeDetails(id: any(named: 'id', that: equals('id'))),
        ).called(1);
      });
    });

    group('updateRecipe', () {
      test('throws with no id set', () async {
        expect(
          repository.updateRecipe(createRecipe()),
          throwsArgumentError,
        );

        verifyNever(
          () => recipesClient.updateRecipe(
            id: any(named: 'id', that: equals('id')),
            $body: any(named: r'$body', that: equalsBuilt(_recipeConverter.convert(createRecipe()))),
          ),
        );
      });

      test('rethrows errors as a UpdateRecipeFailure', () async {
        when(() => recipesClient.updateRecipe(id: any(named: 'id'), $body: any(named: r'$body'))).thenThrow(
          'failed to update recipe',
        );

        expect(
          repository.updateRecipe(defaultRecipe),
          throwsA(
            isA<UpdateRecipeFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to update recipe'),
            ),
          ),
        );

        verify(
          () => recipesClient.updateRecipe(
            id: any(named: 'id', that: equals('id')),
            $body: any(named: r'$body', that: equalsBuilt(defaultApiRecipe)),
          ),
        ).called(1);
      });

      test('updates the recipe', () async {
        when(() => recipesClient.updateRecipe(id: any(named: 'id'), $body: any(named: r'$body')))
            .thenAnswer((_) async => const DynamiteResponse(200, 1, null));

        expect(
          repository.updateRecipe(defaultRecipe),
          completes,
        );

        verify(
          () => recipesClient.updateRecipe(
            id: any(named: 'id', that: equals('id')),
            $body: any(named: r'$body', that: equalsBuilt(defaultApiRecipe)),
          ),
        ).called(1);
      });
    });

    group('deleteRecipe', () {
      test('throws with no id set', () async {
        expect(
          repository.deleteRecipe(createRecipe()),
          throwsArgumentError,
        );

        verifyNever(
          () => recipesClient.deleteRecipe(id: any(named: 'id', that: equals('id'))),
        );
      });

      test('rethrows errors as a DeleteRecipeFailure', () async {
        when(() => recipesClient.deleteRecipe(id: any(named: 'id'))).thenThrow(
          'failed to delete recipe',
        );

        expect(
          repository.deleteRecipe(defaultRecipe),
          throwsA(
            isA<DeleteRecipeFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to delete recipe'),
            ),
          ),
        );

        verify(
          () => recipesClient.deleteRecipe(id: any(named: 'id', that: equals('id'))),
        ).called(1);
      });

      test('deletes the recipe', () async {
        when(() => recipesClient.deleteRecipe(id: any(named: 'id')))
            .thenAnswer((_) async => const DynamiteResponse(200, 'id', null));

        expect(
          repository.deleteRecipe(defaultRecipe),
          completes,
        );

        verify(
          () => recipesClient.deleteRecipe(id: any(named: 'id', that: equals('id'))),
        ).called(1);
      });
    });

    group('importRecipe', () {
      final url = Uri.https('localhost');

      test('rethrows errors as a ImportRecipeFailure', () async {
        when(() => recipesClient.$import($body: any(named: r'$body'))).thenThrow(
          'failed to import recipe',
        );

        expect(
          repository.importRecipe(url),
          throwsA(
            isA<ImportRecipeFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to import recipe'),
            ),
          ),
        );

        verify(
          () => recipesClient.$import(
            $body: any(
              named: r'$body',
              that: predicate<cookbook.Url>((e) => e.url == url.toString()),
            ),
          ),
        ).called(1);
      });

      test('imports the recipe', () async {
        when(() => recipesClient.$import($body: any(named: r'$body')))
            .thenAnswer((_) async => DynamiteResponse(200, defaultApiRecipe, null));

        expect(
          repository.importRecipe(url),
          completes,
        );

        verify(
          () => recipesClient.$import(
            $body: any(
              named: r'$body',
              that: predicate<cookbook.Url>((e) => e.url == url.toString()),
            ),
          ),
        ).called(1);
      });
    });

    group('readCategories', () {
      final apiCategories = List.generate(10, (i) {
        return cookbook.Category((b) {
          b
            ..name = 'name'
            ..recipeCount = i % 2;
        });
      }).toBuiltList();

      test('returns empty list when no recipes exist', () async {
        when(() => recipesClient.listRecipes()).thenAnswer((_) async => DynamiteResponse(200, BuiltList(), null));

        expect(
          repository.readCategories(),
          completion(isEmpty),
        );

        verify(() => recipesClient.listRecipes()).called(1);
      });

      test('returns non empty categories with image url', () async {
        when(() => recipesClient.listRecipes()).thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));
        when(() => categoriesClient.listCategories())
            .thenAnswer((_) async => DynamiteResponse(200, apiCategories, null));
        when(() => categoriesClient.recipesInCategory(category: any(named: 'category')))
            .thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));

        await expectLater(
          repository.readCategories(),
          completion(
            predicate<BuiltList<Category>>((c) {
              if (c.first.name != Category.all) {
                return false;
              }

              for (final category in c) {
                if (category.recipeCount == 0) {
                  return false;
                }
              }

              return c.length == 6;
            }),
          ),
        );

        verify(() => recipesClient.listRecipes()).called(1);
        verify(() => categoriesClient.listCategories()).called(1);
        verify(
          () => categoriesClient.recipesInCategory(category: any(named: 'category')),
        ).called(5);
      });

      test('rethrows errors as a ReadCategoriesFailure', () async {
        when(() => recipesClient.listRecipes()).thenThrow('failed to read categories');
        when(() => categoriesClient.listCategories())
            .thenAnswer((_) async => DynamiteResponse(200, apiCategories, null));
        when(() => categoriesClient.recipesInCategory(category: any(named: 'category')))
            .thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));

        expect(
          repository.readCategories(),
          throwsA(
            isA<ReadCategoriesFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to read categories'),
            ),
          ),
        );
        verify(() => recipesClient.listRecipes()).called(1);
        verifyNever(() => categoriesClient.listCategories());
        verifyNever(
          () => categoriesClient.recipesInCategory(category: any(named: 'category')),
        );
      });
    });

    group('readCategory', () {
      test('can read category', () async {
        when(() => categoriesClient.recipesInCategory(category: any(named: 'category')))
            .thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));

        expect(
          repository.readCategory(name: 'Category'),
          completion(stubs),
        );

        verify(
          () => categoriesClient.recipesInCategory(
            category: any(named: 'category', that: matches('Category')),
          ),
        ).called(1);
      });

      test('can read uncategorized recipes', () async {
        when(() => categoriesClient.recipesInCategory(category: any(named: 'category')))
            .thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));

        expect(
          repository.readCategory(name: Category.uncategorized),
          completion(stubs),
        );

        verify(
          () => categoriesClient.recipesInCategory(
            category: any(named: 'category', that: matches('_')),
          ),
        ).called(1);
      });

      test('can read all recipes', () async {
        when(() => recipesClient.listRecipes()).thenAnswer((_) async => DynamiteResponse(200, apiStubs, null));

        expect(
          repository.readCategory(name: Category.all),
          completion(stubs),
        );

        verify(() => recipesClient.listRecipes()).called(1);
      });

      test('rethrows errors as a ReadCategoryFailure', () async {
        when(() => categoriesClient.recipesInCategory(category: any(named: 'category')))
            .thenThrow('failed to read category');
        when(() => recipesClient.listRecipes()).thenThrow('failed to read category');

        expect(
          repository.readCategory(name: 'Category'),
          throwsA(
            isA<ReadCategoryFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to read category'),
            ),
          ),
        );
        verify(
          () => categoriesClient.recipesInCategory(
            category: any(named: 'category', that: matches('Category')),
          ),
        ).called(1);

        expect(
          repository.readCategory(name: Category.uncategorized),
          throwsA(
            isA<ReadCategoryFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to read category'),
            ),
          ),
        );

        verify(
          () => categoriesClient.recipesInCategory(
            category: any(named: 'category', that: matches('_')),
          ),
        ).called(1);

        expect(
          repository.readCategory(name: Category.all),
          throwsA(
            isA<ReadCategoryFailure>().having(
              (f) => f.error,
              'error',
              equals('failed to read category'),
            ),
          ),
        );

        verify(() => recipesClient.listRecipes()).called(1);
      });
    });
  });
}
