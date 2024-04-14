import 'package:intl/intl.dart' as intl;

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
  String roomType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'oneToOne': 'Private',
        'group': 'Group',
        'public': 'Public',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get roomSendMessage => 'Send a message...';
}
