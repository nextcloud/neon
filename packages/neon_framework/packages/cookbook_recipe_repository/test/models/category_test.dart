import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Category', () {
    Category createCategory({
      String mainRecipeId = 'id',
      String name = 'name',
      int recipeCount = 0,
    }) {
      return Category((b) {
        b
          ..mainRecipeId = mainRecipeId
          ..name = name
          ..recipeCount = recipeCount;
      });
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createCategory,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createCategory(),
        equalsBuilt(createCategory()),
      );

      expect(
        createCategory().hashCode,
        equals(createCategory().hashCode),
      );

      expect(
        createCategory(),
        isNot(equals(createCategory(recipeCount: 1))),
      );
    });

    group('rebuild', () {
      test('returns the same object if not attributes are changed', () {
        expect(
          createCategory().rebuild((_) {}),
          equalsBuilt(createCategory()),
        );
      });

      test('replaces every attribute', () {
        expect(
          createCategory().rebuild((b) {
            b
              ..mainRecipeId = 'new id'
              ..name = 'new name'
              ..recipeCount = 1;
          }),
          equalsBuilt(
            createCategory(
              mainRecipeId: 'new id',
              name: 'new name',
              recipeCount: 1,
            ),
          ),
        );
      });
    });

    test('to string', () {
      expect(
        createCategory().toString(),
        equals('''
Category {
  mainRecipeId=id,
  name=name,
  recipeCount=0,
}'''),
      );
    });
  });
}
