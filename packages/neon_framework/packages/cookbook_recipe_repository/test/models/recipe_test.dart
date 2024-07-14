import 'package:built_collection/built_collection.dart';
import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('Recipe', () {
    Recipe createRecipe({
      Duration? cookTime = const Duration(minutes: 1),
      tz.TZDateTime? dateCreated,
      tz.TZDateTime? dateModified,
      String description = 'description',
      String? id,
      Uri? image,
      Uri? imagePlaceholderUrl,
      Uri? imageUrl,
      Set<String> keywords = const {},
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

    group('constructor', () {
      test('works correctly', () {
        expect(
          createRecipe,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createRecipe(),
        equalsBuilt(createRecipe()),
      );

      expect(
        createRecipe().hashCode,
        equals(createRecipe().hashCode),
      );

      expect(
        createRecipe(),
        isNot(equals(createRecipe(url: Uri.https('other-url')))),
      );
    });

    group('rebuild', () {
      test('returns the same object if not attributes are changed', () {
        expect(
          createRecipe().rebuild((_) {}),
          equalsBuilt(createRecipe()),
        );
      });

      test('replaces every attribute', () {
        expect(
          createRecipe().rebuild((b) {
            b
              ..cookTime = const Duration(hours: 1)
              ..dateCreated = tz.TZDateTime(tz.UTC, 2025)
              ..dateModified = tz.TZDateTime(tz.UTC, 2025)
              ..description = 'new description'
              ..id = 'new id'
              ..image = Uri.https('new-image')
              ..imagePlaceholderUrl = Uri.https('new-imagePlaceholderUrl')
              ..imageUrl = Uri.https('new-imageUrl')
              ..keywords = BuiltSet({'keywords'})
              ..prepTime = const Duration(hours: 1)
              ..name = 'new name'
              ..nutrition = Nutrition()
              ..recipeCategory = 'new recipeCategory'
              ..recipeIngredient = BuiltList(['recipeIngredient'])
              ..recipeInstructions = BuiltList(['recipeInstructions'])
              ..recipeYield = 2
              ..totalTime = const Duration(hours: 1)
              ..tool = BuiltList(['tool'])
              ..url = Uri.https('new-url');
          }),
          equalsBuilt(
            createRecipe(
              cookTime: const Duration(hours: 1),
              dateCreated: tz.TZDateTime(tz.UTC, 2025),
              dateModified: tz.TZDateTime(tz.UTC, 2025),
              description: 'new description',
              id: 'new id',
              image: Uri.https('new-image'),
              imagePlaceholderUrl: Uri.https('new-imagePlaceholderUrl'),
              imageUrl: Uri.https('new-imageUrl'),
              keywords: {'keywords'},
              prepTime: const Duration(hours: 1),
              name: 'new name',
              nutrition: Nutrition(),
              recipeCategory: 'new recipeCategory',
              recipeIngredient: ['recipeIngredient'],
              recipeInstructions: ['recipeInstructions'],
              recipeYield: 2,
              totalTime: const Duration(hours: 1),
              tool: ['tool'],
              url: Uri.https('new-url'),
            ),
          ),
        );
      });
    });

    test('normalizes empty strings and zero duration', () {
      expect(
        createRecipe(cookTime: Duration.zero, prepTime: Duration.zero, totalTime: Duration.zero, id: ''),
        predicate<Recipe>((r) {
          return r.cookTime == null && r.prepTime == null && r.totalTime == null && r.id == null;
        }),
      );
    });

    test('to string', () {
      expect(
        createRecipe().toString(),
        equals('''
Recipe {
  cookTime=0:01:00.000000,
  dateCreated=2024-01-01 00:00:00.000Z,
  dateModified=2024-01-01 00:00:00.000Z,
  description=description,
  image=https://image,
  imagePlaceholderUrl=https://imageplaceholderurl,
  imageUrl=https://imageurl,
  keywords={},
  prepTime=0:01:00.000000,
  name=name,
  nutrition=Nutrition {
    type=NutritionInformation,
  },
  recipeCategory=recipeCategory,
  recipeIngredient=[],
  recipeInstructions=[],
  recipeYield=1,
  totalTime=0:01:00.000000,
  tool=[],
  url=https://url,
}'''),
      );
    });
  });
}
