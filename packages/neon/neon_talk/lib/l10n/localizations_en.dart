import 'localizations.dart';

/// The translations for English (`en`).
class TalkLocalizationsEn extends TalkLocalizations {
  TalkLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get actorSelf => 'You';

  @override
  String get actorGuest => 'Guest';

  @override
  String get roomCreate => 'Create room';

  @override
  String get roomCreateUserName => 'User name';

  @override
  String get roomCreateGroupName => 'Group name';

  @override
  String get roomCreateRoomName => 'Room name';

  @override
  String get roomTypeOneToOne => 'Private';

  @override
  String get roomTypeGroup => 'Group';

  @override
  String get roomTypePublic => 'Public';

  @override
  String get callStart => 'Start call';

  @override
  String get callJoin => 'Join call';

  @override
  String get callLeave => 'Leave call';

  @override
  String get screenSharingSelectScreen => 'Select screen';

  @override
  String get screenSharingSelectScreenScreens => 'Screens';

  @override
  String get screenSharingSelectScreenWindows => 'Windows';
}
