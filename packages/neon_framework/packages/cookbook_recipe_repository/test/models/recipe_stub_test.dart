import 'package:built_collection/built_collection.dart';
import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('RecipeStub', () {
    RecipeStub createRecipeStub({
      tz.TZDateTime? dateCreated,
      tz.TZDateTime? dateModified,
      String id = 'id',
      Uri? imagePlaceholderUrl,
      Uri? imageUrl,
      Set<String> keywords = const {},
      String name = 'name',
    }) {
      return RecipeStub((b) {
        b
          ..dateCreated = dateCreated ?? tz.TZDateTime(tz.UTC, 2024)
          ..dateModified = dateModified ?? tz.TZDateTime(tz.UTC, 2024)
          ..id = id
          ..imagePlaceholderUrl = imagePlaceholderUrl ?? Uri.https('imagePlaceholderUrl')
          ..imageUrl = imageUrl ?? Uri.https('imageUrl')
          ..keywords = BuiltSet(keywords)
          ..name = name;
      });
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createRecipeStub,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createRecipeStub(),
        equalsBuilt(createRecipeStub()),
      );

      expect(
        createRecipeStub().hashCode,
        equals(createRecipeStub().hashCode),
      );

      expect(
        createRecipeStub(),
        isNot(equals(createRecipeStub(name: 'other name'))),
      );
    });

    group('rebuild', () {
      test('returns the same object if not attributes are changed', () {
        expect(
          createRecipeStub().rebuild((_) {}),
          equalsBuilt(createRecipeStub()),
        );
      });

      test('replaces every attribute', () {
        expect(
          createRecipeStub().rebuild((b) {
            b
              ..dateCreated = tz.TZDateTime(tz.UTC, 2025)
              ..dateModified = tz.TZDateTime(tz.UTC, 2025)
              ..id = 'new id'
              ..imagePlaceholderUrl = Uri.https('new-imagePlaceholderUrl')
              ..imageUrl = Uri.https('new-imageUrl')
              ..keywords = BuiltSet({'keyword'})
              ..name = 'new name';
          }),
          equalsBuilt(
            createRecipeStub(
              dateCreated: tz.TZDateTime(tz.UTC, 2025),
              dateModified: tz.TZDateTime(tz.UTC, 2025),
              id: 'new id',
              imagePlaceholderUrl: Uri.https('new-imagePlaceholderUrl'),
              imageUrl: Uri.https('new-imageUrl'),
              keywords: {'keyword'},
              name: 'new name',
            ),
          ),
        );
      });
    });

    test('to string', () {
      expect(
        createRecipeStub().toString(),
        equals('''
RecipeStub {
  dateCreated=2024-01-01 00:00:00.000Z,
  dateModified=2024-01-01 00:00:00.000Z,
  id=id,
  imagePlaceholderUrl=https://imageplaceholderurl,
  imageUrl=https://imageurl,
  keywords={},
  name=name,
}'''),
      );
    });
  });
}
