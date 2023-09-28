import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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

  /// No description provided for @actionYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get actionYes;

  /// No description provided for @actionNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get actionNo;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get actionRename;

  /// No description provided for @actionMove.
  ///
  /// In en, this message translates to:
  /// **'Move'**
  String get actionMove;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @actionSync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get actionSync;

  /// No description provided for @actionShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// No description provided for @errorUnableToOpenFile.
  ///
  /// In en, this message translates to:
  /// **'Unable to open the file'**
  String get errorUnableToOpenFile;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @goToPath.
  ///
  /// In en, this message translates to:
  /// **'Go to /{path}'**
  String goToPath(String path);

  /// No description provided for @uploadFiles.
  ///
  /// In en, this message translates to:
  /// **'Upload files'**
  String get uploadFiles;

  /// No description provided for @uploadImages.
  ///
  /// In en, this message translates to:
  /// **'Upload images'**
  String get uploadImages;

  /// No description provided for @uploadCamera.
  ///
  /// In en, this message translates to:
  /// **'Upload from camera'**
  String get uploadCamera;

  /// No description provided for @uploadConfirmSizeWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to upload a file that is bigger than {warningSize} ({actualSize})?'**
  String uploadConfirmSizeWarning(String warningSize, String actualSize);

  /// No description provided for @downloadConfirmSizeWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to download a file that is bigger than {warningSize} ({actualSize})?'**
  String downloadConfirmSizeWarning(String warningSize, String actualSize);

  /// No description provided for @folderCreate.
  ///
  /// In en, this message translates to:
  /// **'Create folder'**
  String get folderCreate;

  /// No description provided for @folderName.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get folderName;

  /// No description provided for @folderRename.
  ///
  /// In en, this message translates to:
  /// **'Rename folder'**
  String get folderRename;

  /// No description provided for @folderChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose folder'**
  String get folderChoose;

  /// No description provided for @folderDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the folder \'{name}\'?'**
  String folderDeleteConfirm(String name);

  /// No description provided for @fileRename.
  ///
  /// In en, this message translates to:
  /// **'Rename file'**
  String get fileRename;

  /// No description provided for @fileDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the file \'{name}\'?'**
  String fileDeleteConfirm(String name);

  /// No description provided for @addToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @detailsFileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get detailsFileName;

  /// No description provided for @detailsFolderName.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get detailsFolderName;

  /// No description provided for @detailsParentFolder.
  ///
  /// In en, this message translates to:
  /// **'Parent folder'**
  String get detailsParentFolder;

  /// No description provided for @detailsFileSize.
  ///
  /// In en, this message translates to:
  /// **'File size'**
  String get detailsFileSize;

  /// No description provided for @detailsFolderSize.
  ///
  /// In en, this message translates to:
  /// **'Folder size'**
  String get detailsFolderSize;

  /// No description provided for @detailsLastModified.
  ///
  /// In en, this message translates to:
  /// **'Last modified'**
  String get detailsLastModified;

  /// No description provided for @detailsIsFavorite.
  ///
  /// In en, this message translates to:
  /// **'Is favorite'**
  String get detailsIsFavorite;

  /// No description provided for @optionsFilesSortProperty.
  ///
  /// In en, this message translates to:
  /// **'How to sort files'**
  String get optionsFilesSortProperty;

  /// No description provided for @optionsFilesSortPropertyName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get optionsFilesSortPropertyName;

  /// No description provided for @optionsFilesSortPropertyModifiedDate.
  ///
  /// In en, this message translates to:
  /// **'Last modified'**
  String get optionsFilesSortPropertyModifiedDate;

  /// No description provided for @optionsFilesSortPropertySize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get optionsFilesSortPropertySize;

  /// No description provided for @optionsFilesSortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort order of files'**
  String get optionsFilesSortOrder;

  /// No description provided for @optionsShowHiddenFiles.
  ///
  /// In en, this message translates to:
  /// **'Show hidden files'**
  String get optionsShowHiddenFiles;

  /// No description provided for @optionsShowPreviews.
  ///
  /// In en, this message translates to:
  /// **'Show previews for files'**
  String get optionsShowPreviews;

  /// No description provided for @optionsUploadQueueParallelism.
  ///
  /// In en, this message translates to:
  /// **'Upload queue parallelism'**
  String get optionsUploadQueueParallelism;

  /// No description provided for @optionsDownloadQueueParallelism.
  ///
  /// In en, this message translates to:
  /// **'Download queue parallelism'**
  String get optionsDownloadQueueParallelism;

  /// No description provided for @optionsUploadSizeWarning.
  ///
  /// In en, this message translates to:
  /// **'Upload size warning'**
  String get optionsUploadSizeWarning;

  /// No description provided for @optionsDownloadSizeWarning.
  ///
  /// In en, this message translates to:
  /// **'Download size warning'**
  String get optionsDownloadSizeWarning;

  /// No description provided for @optionsSizeWarningDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get optionsSizeWarningDisabled;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
