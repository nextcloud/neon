import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';

/// Callers can lookup localized strings with an instance of TalkLocalizations
/// returned by `TalkLocalizations.of(context)`.
///
/// Applications need to include `TalkLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TalkLocalizations.localizationsDelegates,
///   supportedLocales: TalkLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the TalkLocalizations.supportedLocales
/// property.
abstract class TalkLocalizations {
  TalkLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TalkLocalizations of(BuildContext context) {
    return Localizations.of<TalkLocalizations>(context, TalkLocalizations)!;
  }

  static const LocalizationsDelegate<TalkLocalizations> delegate = _TalkLocalizationsDelegate();

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

  /// No description provided for @actorSelf.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get actorSelf;

  /// No description provided for @actorGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get actorGuest;

  /// No description provided for @roomCreate.
  ///
  /// In en, this message translates to:
  /// **'Create room'**
  String get roomCreate;

  /// No description provided for @roomCreateUserName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get roomCreateUserName;

  /// No description provided for @roomCreateGroupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get roomCreateGroupName;

  /// No description provided for @roomCreateRoomName.
  ///
  /// In en, this message translates to:
  /// **'Room name'**
  String get roomCreateRoomName;

  /// No description provided for @roomType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, oneToOne{Private} group{Group} public{Public} other{}}'**
  String roomType(String type);

  /// No description provided for @roomWriteMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message...'**
  String get roomWriteMessage;

  /// No description provided for @roomMessageAddEmoji.
  ///
  /// In en, this message translates to:
  /// **'Add emoji to message'**
  String get roomMessageAddEmoji;

  /// No description provided for @roomMessageSend.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get roomMessageSend;

  /// No description provided for @roomMessageReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get roomMessageReply;

  /// No description provided for @roomMessageReaction.
  ///
  /// In en, this message translates to:
  /// **'Add reaction'**
  String get roomMessageReaction;

  /// No description provided for @reactionsAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add a new reaction'**
  String get reactionsAddNew;

  /// No description provided for @reactionsLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading reactions'**
  String get reactionsLoading;

  /// No description provided for @roomsCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create new room'**
  String get roomsCreateNew;
}

class _TalkLocalizationsDelegate extends LocalizationsDelegate<TalkLocalizations> {
  const _TalkLocalizationsDelegate();

  @override
  Future<TalkLocalizations> load(Locale locale) {
    return SynchronousFuture<TalkLocalizations>(lookupTalkLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_TalkLocalizationsDelegate old) => false;
}

TalkLocalizations lookupTalkLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return TalkLocalizationsEn();
  }

  throw FlutterError('TalkLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
