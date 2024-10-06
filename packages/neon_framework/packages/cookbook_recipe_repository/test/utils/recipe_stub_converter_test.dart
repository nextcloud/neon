import 'package:built_collection/built_collection.dart';
import 'package:built_value_test/matcher.dart';
import 'package:cookbook_recipe_repository/recipe_repository.dart';
import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  test('RecipeStubConverter converts from api to repository', () {
    const converter = RecipeStubConverter();

    expect(
      converter.convert(
        cookbook.RecipeStub((b) {
          b
            ..dateCreated = '2024-01-01T00:00:00.000Z'
            ..dateModified = '2024-01-01T00:00:00.000Z'
            ..id = 'id'
            ..recipeId = 0
            ..imagePlaceholderUrl = 'https://imageplaceholderurl'
            ..imageUrl = 'https://imageurl'
            ..keywords = 'keyword,keyword2'
            ..name = 'name';
        }),
      ),
      equalsBuilt(
        RecipeStub((b) {
          b
            ..dateCreated = tz.TZDateTime(tz.UTC, 2024)
            ..dateModified = tz.TZDateTime(tz.UTC, 2024)
            ..id = 'id'
            ..imagePlaceholderUrl = Uri.https('imagePlaceholderUrl')
            ..imageUrl = Uri.https('imageUrl')
            ..keywords = BuiltSet({'keyword', 'keyword2'})
            ..name = 'name';
        }),
      ),
    );
  });
}
