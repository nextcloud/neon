import 'package:intl/intl.dart' as intl;

import 'cookbook_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CookbookLocalizationsEn extends CookbookLocalizations {
  CookbookLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get recipeCreateButton => 'Create Recipe';

  @override
  String recipeListTitle(String name) {
    return 'Category: $name';
  }

  @override
  String get noRecipes => 'No recipes available.';

  @override
  String get errorLoadFailed => 'Failed to load Recipe!';

  @override
  String get categoryAll => 'All Recipes';

  @override
  String get categoryUncategorized => 'Uncategorized';

  @override
  String categoryItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'no items',
    );
    return '$_temp0';
  }
}
