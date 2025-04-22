import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of NeonLocalizations
/// returned by `NeonLocalizations.of(context)`.
///
/// Applications need to include `NeonLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NeonLocalizations.localizationsDelegates,
///   supportedLocales: NeonLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the NeonLocalizations.supportedLocales
/// property.
abstract class NeonLocalizations {
  NeonLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NeonLocalizations of(BuildContext context) {
    return Localizations.of<NeonLocalizations>(context, NeonLocalizations)!;
  }

  static const LocalizationsDelegate<NeonLocalizations> delegate = _NeonLocalizationsDelegate();

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

  /// No description provided for @nextcloud.
  ///
  /// In en, this message translates to:
  /// **'Nextcloud'**
  String get nextcloud;

  /// No description provided for @nextcloudLogo.
  ///
  /// In en, this message translates to:
  /// **'Nextcloud logo'**
  String get nextcloudLogo;

  /// No description provided for @appImplementationName.
  ///
  /// In en, this message translates to:
  /// **'{app, select, nextcloud{Nextcloud} core{Server} dashboard{Dashboard} files{Files} news{News} notes{Notes} notifications{Notifications} spreed{Talk} talk{Talk} other{}}'**
  String appImplementationName(String app);

  /// No description provided for @loginAgain.
  ///
  /// In en, this message translates to:
  /// **'Login again'**
  String get loginAgain;

  /// No description provided for @loginOpenAgain.
  ///
  /// In en, this message translates to:
  /// **'Open again'**
  String get loginOpenAgain;

  /// No description provided for @loginSwitchToBrowserWindow.
  ///
  /// In en, this message translates to:
  /// **'Please switch to the browser window that just opened and proceed there'**
  String get loginSwitchToBrowserWindow;

  /// No description provided for @loginWorksWith.
  ///
  /// In en, this message translates to:
  /// **'works with'**
  String get loginWorksWith;

  /// No description provided for @loginUsingQRcode.
  ///
  /// In en, this message translates to:
  /// **'Login using a QR code'**
  String get loginUsingQRcode;

  /// No description provided for @loginUsingServerAddress.
  ///
  /// In en, this message translates to:
  /// **'Login using the server address'**
  String get loginUsingServerAddress;

  /// When the server version is checked an not yet known
  ///
  /// In en, this message translates to:
  /// **'Checking server version'**
  String get loginServerVersion;

  /// When the server version is known and supported
  ///
  /// In en, this message translates to:
  /// **'Supported server version: {version}'**
  String loginServerVersionSupported(String version);

  /// When the server version is known but unsupported
  ///
  /// In en, this message translates to:
  /// **'Unsupported server version: {version}}'**
  String loginServerVersionUnsupported(String version);

  /// when the maintenance mode is loaded from the server
  ///
  /// In en, this message translates to:
  /// **'Checking maintenance mode'**
  String get loginMaintenanceMode;

  /// When the maintenance mode is enabled
  ///
  /// In en, this message translates to:
  /// **'Maintenance mode enabled'**
  String get loginMaintenanceModeEnabled;

  /// When the maintenance mode is disabled
  ///
  /// In en, this message translates to:
  /// **'Maintenance mode disabled'**
  String get loginMaintenanceModeDisabled;

  /// No description provided for @loginCheckingAccount.
  ///
  /// In en, this message translates to:
  /// **'Checking account'**
  String get loginCheckingAccount;

  /// No description provided for @errorCredentialsForAccountNoLongerMatch.
  ///
  /// In en, this message translates to:
  /// **'The credentials for this account no longer match'**
  String get errorCredentialsForAccountNoLongerMatch;

  /// No description provided for @errorBruteforceThrottled.
  ///
  /// In en, this message translates to:
  /// **'Your requests are throttled at the moment due to brute force protection'**
  String get errorBruteforceThrottled;

  /// No description provided for @errorServerHadAProblemProcessingYourRequest.
  ///
  /// In en, this message translates to:
  /// **'The server had a problem while processing your request. You might want to try again'**
  String get errorServerHadAProblemProcessingYourRequest;

  /// No description provided for @errorSomethingWentWrongTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later'**
  String get errorSomethingWentWrongTryAgainLater;

  /// No description provided for @errorUnableToReachServer.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server'**
  String get errorUnableToReachServer;

  /// No description provided for @errorUnableToReachServerAt.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server at {url}'**
  String errorUnableToReachServerAt(String url);

  /// No description provided for @errorConnectionTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Connection has timed out'**
  String get errorConnectionTimedOut;

  /// No description provided for @errorNoCompatibleNextcloudAppsFound.
  ///
  /// In en, this message translates to:
  /// **'No compatible Nextcloud apps could be found.\nWe are working hard to implement more and more apps!'**
  String get errorNoCompatibleNextcloudAppsFound;

  /// No description provided for @errorServerInMaintenanceMode.
  ///
  /// In en, this message translates to:
  /// **'The server is in maintenance mode. Please try again later or contact the server admin.'**
  String get errorServerInMaintenanceMode;

  /// No description provided for @errorMissingPermission.
  ///
  /// In en, this message translates to:
  /// **'Permission for {name} is missing'**
  String errorMissingPermission(String name);

  /// No description provided for @errorUnsupportedAppVersions.
  ///
  /// In en, this message translates to:
  /// **'Sorry, the version of the following apps on your Nextcloud instance are not supported. \n {names} \n Please contact your administrator to resolve the issues.'**
  String errorUnsupportedAppVersions(String names);

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'This field can not be empty'**
  String get errorEmptyField;

  /// No description provided for @errorInvalidURL.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL provided'**
  String get errorInvalidURL;

  /// No description provided for @errorInvalidQRcode.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR-Code provided'**
  String get errorInvalidQRcode;

  /// No description provided for @errorRouteNotFound.
  ///
  /// In en, this message translates to:
  /// **'Route not found: {route}'**
  String errorRouteNotFound(String route);

  /// No description provided for @errorDialog.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get errorDialog;

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

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionRetry;

  /// No description provided for @actionShowSlashHide.
  ///
  /// In en, this message translates to:
  /// **'Show/Hide'**
  String get actionShowSlashHide;

  /// No description provided for @actionExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get actionExit;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get actionOpen;

  /// No description provided for @firstLaunchGoToSettingsToEnablePushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Go to the settings to enable push notifications'**
  String get firstLaunchGoToSettingsToEnablePushNotifications;

  /// No description provided for @nextPushSupported.
  ///
  /// In en, this message translates to:
  /// **'NextPush is supported!'**
  String get nextPushSupported;

  /// No description provided for @nextPushSupportedText.
  ///
  /// In en, this message translates to:
  /// **'NextPush is a FOSS way of receiving push notifications using the UnifiedPush protocol via a Nextcloud instance.\nYou can install NextPush from the F-Droid app store.'**
  String get nextPushSupportedText;

  /// No description provided for @nextPushSupportedInstall.
  ///
  /// In en, this message translates to:
  /// **'Install NextPush'**
  String get nextPushSupportedInstall;

  /// No description provided for @searchIn.
  ///
  /// In en, this message translates to:
  /// **'Search in {app}'**
  String searchIn(String app);

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No search results'**
  String get searchNoResults;

  /// No description provided for @searchGlobally.
  ///
  /// In en, this message translates to:
  /// **'Search globally'**
  String get searchGlobally;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsApps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get settingsApps;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsExport.
  ///
  /// In en, this message translates to:
  /// **'Export settings'**
  String get settingsExport;

  /// No description provided for @settingsImport.
  ///
  /// In en, this message translates to:
  /// **'Import settings'**
  String get settingsImport;

  /// No description provided for @settingsReset.
  ///
  /// In en, this message translates to:
  /// **'Reset settings?'**
  String get settingsReset;

  /// No description provided for @settingsImportWrongFileExtension.
  ///
  /// In en, this message translates to:
  /// **'Settings import has wrong file extension (has to be .json.base64)'**
  String get settingsImportWrongFileExtension;

  /// No description provided for @settingsResetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset all settings'**
  String get settingsResetAll;

  /// No description provided for @settingsResetAllConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reset all settings?'**
  String get settingsResetAllConfirmation;

  /// No description provided for @settingsResetAllExplanation.
  ///
  /// In en, this message translates to:
  /// **'This will reset all preferences back to their default settings.'**
  String get settingsResetAllExplanation;

  /// No description provided for @settingsResetFor.
  ///
  /// In en, this message translates to:
  /// **'Reset all settings for {name}'**
  String settingsResetFor(String name);

  /// No description provided for @settingsResetForExplanation.
  ///
  /// In en, this message translates to:
  /// **'This will reset your account preferences back to their default settings.'**
  String get settingsResetForExplanation;

  /// No description provided for @settingsResetForClientExplanation.
  ///
  /// In en, this message translates to:
  /// **'This will reset all preferences for the app back to their default settings.'**
  String get settingsResetForClientExplanation;

  /// No description provided for @settingsResetForConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reset all settings for {name}?'**
  String settingsResetForConfirmation(String name);

  /// No description provided for @optionsCategoryGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get optionsCategoryGeneral;

  /// No description provided for @optionsCategoryTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get optionsCategoryTheme;

  /// No description provided for @optionsCategoryPushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get optionsCategoryPushNotifications;

  /// No description provided for @optionsCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get optionsCategoryOther;

  /// No description provided for @optionsCategoryAccounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get optionsCategoryAccounts;

  /// No description provided for @optionsCategoryStartup.
  ///
  /// In en, this message translates to:
  /// **'Startup'**
  String get optionsCategoryStartup;

  /// No description provided for @optionsCategoryNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get optionsCategoryNavigation;

  /// No description provided for @optionsSortOrderAscending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get optionsSortOrderAscending;

  /// No description provided for @optionsSortOrderDescending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get optionsSortOrderDescending;

  /// No description provided for @globalOptionsThemeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get globalOptionsThemeMode;

  /// No description provided for @globalOptionsThemeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get globalOptionsThemeModeLight;

  /// No description provided for @globalOptionsThemeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get globalOptionsThemeModeDark;

  /// No description provided for @globalOptionsThemeModeAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get globalOptionsThemeModeAutomatic;

  /// No description provided for @globalOptionsThemeOLEDAsDark.
  ///
  /// In en, this message translates to:
  /// **'OLED theme as dark theme'**
  String get globalOptionsThemeOLEDAsDark;

  /// No description provided for @globalOptionsThemeUseNextcloudTheme.
  ///
  /// In en, this message translates to:
  /// **'Use Nextcloud theme'**
  String get globalOptionsThemeUseNextcloudTheme;

  /// No description provided for @globalOptionsThemeCustomBackground.
  ///
  /// In en, this message translates to:
  /// **'Custom background'**
  String get globalOptionsThemeCustomBackground;

  /// No description provided for @globalOptionsPushNotifications.
  ///
  /// In en, this message translates to:
  /// **'UnifiedPush'**
  String get globalOptionsPushNotifications;

  /// No description provided for @globalOptionsPushNotificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get globalOptionsPushNotificationsDisabled;

  /// No description provided for @globalOptionsPushNotificationsDistributorGotifyUP.
  ///
  /// In en, this message translates to:
  /// **'Gotify-UP (FOSS)'**
  String get globalOptionsPushNotificationsDistributorGotifyUP;

  /// No description provided for @globalOptionsPushNotificationsDistributorFirebaseEmbedded.
  ///
  /// In en, this message translates to:
  /// **'Firebase (proprietary)'**
  String get globalOptionsPushNotificationsDistributorFirebaseEmbedded;

  /// No description provided for @globalOptionsPushNotificationsDistributorNtfy.
  ///
  /// In en, this message translates to:
  /// **'ntfy (FOSS)'**
  String get globalOptionsPushNotificationsDistributorNtfy;

  /// No description provided for @globalOptionsPushNotificationsDistributorFCMUP.
  ///
  /// In en, this message translates to:
  /// **'FCM-UP (proprietary)'**
  String get globalOptionsPushNotificationsDistributorFCMUP;

  /// No description provided for @globalOptionsPushNotificationsDistributorNextPush.
  ///
  /// In en, this message translates to:
  /// **'NextPush (FOSS)'**
  String get globalOptionsPushNotificationsDistributorNextPush;

  /// No description provided for @globalOptionsPushNotificationsDistributorNoProvider2Push.
  ///
  /// In en, this message translates to:
  /// **'NoProvider2Push (FOSS)'**
  String get globalOptionsPushNotificationsDistributorNoProvider2Push;

  /// No description provided for @globalOptionsPushNotificationsDistributorConversations.
  ///
  /// In en, this message translates to:
  /// **'Conversations'**
  String get globalOptionsPushNotificationsDistributorConversations;

  /// No description provided for @globalOptionsPushNotificationsDistributorKDE.
  ///
  /// In en, this message translates to:
  /// **'KDE'**
  String get globalOptionsPushNotificationsDistributorKDE;

  /// No description provided for @globalOptionsStartupMinimized.
  ///
  /// In en, this message translates to:
  /// **'Start minimized'**
  String get globalOptionsStartupMinimized;

  /// No description provided for @globalOptionsStartupMinimizeInsteadOfExit.
  ///
  /// In en, this message translates to:
  /// **'Minimize instead of exit'**
  String get globalOptionsStartupMinimizeInsteadOfExit;

  /// No description provided for @globalOptionsAccountsRememberLastUsedAccount.
  ///
  /// In en, this message translates to:
  /// **'Remember last used account'**
  String get globalOptionsAccountsRememberLastUsedAccount;

  /// No description provided for @globalOptionsAccountsInitialAccount.
  ///
  /// In en, this message translates to:
  /// **'Initial account'**
  String get globalOptionsAccountsInitialAccount;

  /// No description provided for @globalOptionsAccountsAdd.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get globalOptionsAccountsAdd;

  /// No description provided for @globalOptionsNavigationMode.
  ///
  /// In en, this message translates to:
  /// **'Navigation mode'**
  String get globalOptionsNavigationMode;

  /// No description provided for @globalOptionsNavigationModeDrawer.
  ///
  /// In en, this message translates to:
  /// **'Drawer'**
  String get globalOptionsNavigationModeDrawer;

  /// No description provided for @globalOptionsNavigationModeDrawerAlwaysVisible.
  ///
  /// In en, this message translates to:
  /// **'Drawer always visible'**
  String get globalOptionsNavigationModeDrawerAlwaysVisible;

  /// No description provided for @accountOptionsDeleteOnServer.
  ///
  /// In en, this message translates to:
  /// **'Delete account on the server'**
  String get accountOptionsDeleteOnServer;

  /// No description provided for @accountOptionsRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove account'**
  String get accountOptionsRemove;

  /// No description provided for @accountOptionsRemoveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the account {id}?'**
  String accountOptionsRemoveConfirm(String id);

  /// No description provided for @accountOptionsRemoveLocal.
  ///
  /// In en, this message translates to:
  /// **'Remove the account from the device'**
  String get accountOptionsRemoveLocal;

  /// No description provided for @accountOptionsRemoveRemote.
  ///
  /// In en, this message translates to:
  /// **'Request deleting the account on the server'**
  String get accountOptionsRemoveRemote;

  /// No description provided for @accountOptionsRemoveRemoteDelay.
  ///
  /// In en, this message translates to:
  /// **'The account will be deleted after {time}'**
  String accountOptionsRemoveRemoteDelay(String time);

  /// No description provided for @accountOptionsCategoryStorageInfo.
  ///
  /// In en, this message translates to:
  /// **'Storage info'**
  String get accountOptionsCategoryStorageInfo;

  /// No description provided for @accountOptionsQuotaUsedOf.
  ///
  /// In en, this message translates to:
  /// **'{used} used of {total} ({relative}%)'**
  String accountOptionsQuotaUsedOf(String used, String total, String relative);

  /// No description provided for @accountOptionsInitialApp.
  ///
  /// In en, this message translates to:
  /// **'App to show initially'**
  String get accountOptionsInitialApp;

  /// No description provided for @accountOptionsAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get accountOptionsAutomatic;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @issueTracker.
  ///
  /// In en, this message translates to:
  /// **'Report a bug or request a feature'**
  String get issueTracker;

  /// No description provided for @relativeTimeNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get relativeTimeNow;

  /// No description provided for @relativeTimePast.
  ///
  /// In en, this message translates to:
  /// **'{time} ago'**
  String relativeTimePast(String time);

  /// No description provided for @relativeTimeFuture.
  ///
  /// In en, this message translates to:
  /// **'in {time}'**
  String relativeTimeFuture(String time);

  /// No description provided for @relativeTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{time}{abbreviation,select, true{m} other{ {time,plural, =1{minute}other{minutes}}}}'**
  String relativeTimeMinutes(int time, String abbreviation);

  /// No description provided for @relativeTimeHours.
  ///
  /// In en, this message translates to:
  /// **'{time}{abbreviation,select, true{h} other{ {time,plural, =1{hour}other{hours}}}}'**
  String relativeTimeHours(int time, String abbreviation);

  /// No description provided for @relativeTimeDays.
  ///
  /// In en, this message translates to:
  /// **'{time}{abbreviation,select, true{d} other{ {time,plural, =1{day}other{days}}}}'**
  String relativeTimeDays(int time, String abbreviation);

  /// No description provided for @relativeTimeYears.
  ///
  /// In en, this message translates to:
  /// **'{time}{abbreviation,select, true{y} other{ {time,plural, =1{year}other{years}}}}'**
  String relativeTimeYears(int time, String abbreviation);

  /// No description provided for @userStatusSetStatus.
  ///
  /// In en, this message translates to:
  /// **'Set status'**
  String get userStatusSetStatus;

  /// No description provided for @userStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get userStatusOnline;

  /// No description provided for @userStatusAway.
  ///
  /// In en, this message translates to:
  /// **'Away'**
  String get userStatusAway;

  /// No description provided for @userStatusDoNotDisturb.
  ///
  /// In en, this message translates to:
  /// **'Do not disturb'**
  String get userStatusDoNotDisturb;

  /// No description provided for @userStatusDoNotDisturbDescription.
  ///
  /// In en, this message translates to:
  /// **'Mute all notifications'**
  String get userStatusDoNotDisturbDescription;

  /// No description provided for @userStatusInvisible.
  ///
  /// In en, this message translates to:
  /// **'Invisible'**
  String get userStatusInvisible;

  /// No description provided for @userStatusInvisibleDescription.
  ///
  /// In en, this message translates to:
  /// **'Appear offline'**
  String get userStatusInvisibleDescription;

  /// No description provided for @userStatusClearAfter.
  ///
  /// In en, this message translates to:
  /// **'Clear status after'**
  String get userStatusClearAfter;

  /// No description provided for @userStatusClearAtDoNotClear.
  ///
  /// In en, this message translates to:
  /// **'Do not clear'**
  String get userStatusClearAtDoNotClear;

  /// No description provided for @userStatusClearAtToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get userStatusClearAtToday;

  /// No description provided for @userStatusClearAtThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get userStatusClearAtThisWeek;

  /// No description provided for @userStatusActionClear.
  ///
  /// In en, this message translates to:
  /// **'Clear status'**
  String get userStatusActionClear;

  /// No description provided for @userStatusStatusMessage.
  ///
  /// In en, this message translates to:
  /// **'Status message'**
  String get userStatusStatusMessage;

  /// No description provided for @userStatusOnlineStatus.
  ///
  /// In en, this message translates to:
  /// **'Online status'**
  String get userStatusOnlineStatus;

  /// No description provided for @emojisCategorySmileysAndEmotions.
  ///
  /// In en, this message translates to:
  /// **'Smileys and emotions'**
  String get emojisCategorySmileysAndEmotions;

  /// No description provided for @emojisCategoryPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get emojisCategoryPeople;

  /// No description provided for @emojisCategoryAnimalsAndNature.
  ///
  /// In en, this message translates to:
  /// **'Animals and nature'**
  String get emojisCategoryAnimalsAndNature;

  /// No description provided for @emojisCategoryFoodAndDrink.
  ///
  /// In en, this message translates to:
  /// **'Food and drink'**
  String get emojisCategoryFoodAndDrink;

  /// No description provided for @emojisCategoryTravelAndPlaces.
  ///
  /// In en, this message translates to:
  /// **'Travel and places'**
  String get emojisCategoryTravelAndPlaces;

  /// No description provided for @emojisCategoryActivitiesAndEvents.
  ///
  /// In en, this message translates to:
  /// **'Activities and events'**
  String get emojisCategoryActivitiesAndEvents;

  /// No description provided for @emojisCategoryObjects.
  ///
  /// In en, this message translates to:
  /// **'Objects'**
  String get emojisCategoryObjects;

  /// No description provided for @emojisCategorySymbols.
  ///
  /// In en, this message translates to:
  /// **'Symbols'**
  String get emojisCategorySymbols;

  /// No description provided for @emojisCategoryFlags.
  ///
  /// In en, this message translates to:
  /// **'Flags'**
  String get emojisCategoryFlags;
}

class _NeonLocalizationsDelegate extends LocalizationsDelegate<NeonLocalizations> {
  const _NeonLocalizationsDelegate();

  @override
  Future<NeonLocalizations> load(Locale locale) {
    return SynchronousFuture<NeonLocalizations>(lookupNeonLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_NeonLocalizationsDelegate old) => false;
}

NeonLocalizations lookupNeonLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NeonLocalizationsEn();
  }

  throw FlutterError('NeonLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
