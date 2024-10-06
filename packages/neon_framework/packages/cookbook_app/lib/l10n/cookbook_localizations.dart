import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'cookbook_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CookbookLocalizations
/// returned by `CookbookLocalizations.of(context)`.
///
/// Applications need to include `CookbookLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/cookbook_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CookbookLocalizations.localizationsDelegates,
///   supportedLocales: CookbookLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CookbookLocalizations.supportedLocales
/// property.
abstract class CookbookLocalizations {
  CookbookLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CookbookLocalizations of(BuildContext context) {
    return Localizations.of<CookbookLocalizations>(context, CookbookLocalizations)!;
  }

  static const LocalizationsDelegate<CookbookLocalizations> delegate = _CookbookLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Button to open the create recipe screen
  ///
  /// In en, this message translates to:
  /// **'Create Recipe'**
  String get recipeCreateButton;

  /// Title of the category view.
  ///
  /// In en, this message translates to:
  /// **'Category: {name}'**
  String recipeListTitle(String name);

  /// No description provided for @noRecipes.
  ///
  /// In en, this message translates to:
  /// **'No recipes available.'**
  String get noRecipes;

  /// Error message when fetching the recipes failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load Recipe!'**
  String get errorLoadFailed;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All Recipes'**
  String get categoryAll;

  /// No description provided for @categoryUncategorized.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get categoryUncategorized;

  /// Number of recipes in a category.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no items} =1 {1 item} other {{count} items}}'**
  String categoryItems(int count);
}

class _CookbookLocalizationsDelegate extends LocalizationsDelegate<CookbookLocalizations> {
  const _CookbookLocalizationsDelegate();

  @override
  Future<CookbookLocalizations> load(Locale locale) {
    return SynchronousFuture<CookbookLocalizations>(lookupCookbookLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_CookbookLocalizationsDelegate old) => false;
}

CookbookLocalizations lookupCookbookLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CookbookLocalizationsEn();
  }

  throw FlutterError('CookbookLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
