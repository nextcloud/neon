// ignore_for_file: public_member_api_docs, constant_identifier_names
enum RecordingCONSENT {
  required_no(0),
  required_yes(1),
  required_optional(2);

  const RecordingCONSENT(this.value);
  final int value;
}

enum AvatarTHEMING {
  placeholder('{{THEMING}}'),
  dark_background('3B3B3B'),
  bright_background('DBDBDB');

  const AvatarTHEMING(this.value);
  final String value;
}

enum ValueDumperMAX {
  string_length(50),
  array_entries(5);

  const ValueDumperMAX(this.value);
  final int value;
}

enum ParticipantFLAG {
  disconnected(0),
  in_call(1),
  with_audio(2),
  with_video(4),
  with_phone(8);

  const ParticipantFLAG(this.value);
  final int value;
}

enum ParticipantNOTIFY {
  default(0),
  always(1),
  mention(2),
  never(3),
  calls_off(0),
  calls_on(1);

  const ParticipantNOTIFY(this.value);
  final int value;
}

enum ParticipantPRIVACY {
  public(0),
  private(1);

  const ParticipantPRIVACY(this.value);
  final int value;
}

enum ChatManagerVERB {
  message('comment'),
  system('system'),
  object_shared('object_shared'),
  command('command'),
  message_deleted('comment_deleted'),
  reaction('reaction'),
  reaction_deleted('reaction_deleted');

  const ChatManagerVERB(this.value);
  final String value;
}

enum ExecutorPLACEHOLDER {
  room('{ROOM}'),
  user('{USER}'),
  arguments('{ARGUMENTS}'),
  arguments_doublequote_escaped('{ARGUMENTS_DOUBLEQUOTE_ESCAPED}');

  const ExecutorPLACEHOLDER(this.value);
  final String value;
}

enum ShellExecutorPLACEHOLDER {
  room('{ROOM}'),
  user('{USER}'),
  arguments('{ARGUMENTS}'),
  arguments_doublequote_escaped('{ARGUMENTS_DOUBLEQUOTE_ESCAPED}');

  const ShellExecutorPLACEHOLDER(this.value);
  final String value;
}

enum WebinaryLOBBY {
  none(0),
  non_moderators(1);

  const WebinaryLOBBY(this.value);
  final int value;
}

enum WebinarySIP {
  disabled(0),
  enabled(1),
  enabled_no_pin(2);

  const WebinarySIP(this.value);
  final int value;
}

enum AttachmentTYPE {
  audio('audio'),
  deck_card('deckcard'),
  file('file'),
  location('location'),
  media('media'),
  other('other'),
  poll('poll'),
  recording('recording'),
  voice('voice');

  const AttachmentTYPE(this.value);
  final String value;
}

enum InvitationSTATE {
  pending(0),
  accepted(1);

  const InvitationSTATE(this.value);
  final int value;
}

enum SessionSTATE {
  inactive(0),
  active(1);

  const SessionSTATE(this.value);
  final int value;
}

enum AttendeeACTOR {
  users('users'),
  groups('groups'),
  guests('guests'),
  emails('emails'),
  circles('circles'),
  bridged('bridged'),
  bots('bots'),
  federated_users('federated_users'),
  phones('phones'),
  bot_prefix('bot-'),
  id_cli('cli'),
  id_system('system'),
  id_changelog('changelog');

  const AttendeeACTOR(this.value);
  final String value;
}

enum AttendeePERMISSIONS {
  default(0),
  custom(1),
  call_start(2),
  call_join(4),
  lobby_ignore(8),
  publish_audio(16),
  publish_video(32),
  publish_screen(64),
  chat(128),
  modify_set('set'),
  modify_remove('remove'),
  modify_add('add');

  const AttendeePERMISSIONS(this.value);
  final int value;
}

enum BotSTATE {
  disabled(0),
  enabled(1),
  no_setup(2);

  const BotSTATE(this.value);
  final int value;
}

enum BotFEATURE {
  none(0),
  webhook(1),
  response(2),
  label_none('none'),
  label_webhook('webhook'),
  label_response('response');

  const BotFEATURE(this.value);
  final int value;
}

enum PollSTATUS {
  open(0),
  closed(1);

  const PollSTATUS(this.value);
  final int value;
}

enum PollMODE {
  public(0),
  hidden(1);

  const PollMODE(this.value);
  final int value;
}

enum CommandRESPONSE {
  none(0),
  user(1),
  all(2);

  const CommandRESPONSE(this.value);
  final int value;
}

enum CommandENABLED {
  off(0),
  moderator(1),
  users(2),
  all(3);

  const CommandENABLED(this.value);
  final int value;
}

enum BreakoutRoomMODE {
  not_configured(0),
  automatic(1),
  manual(2),
  free(3);

  const BreakoutRoomMODE(this.value);
  final int value;
}

enum BreakoutRoomSTATUS {
  stopped(0),
  started(1),
  assistance_reset(0),
  assistance_requested(2);

  const BreakoutRoomSTATUS(this.value);
  final int value;
}

enum RoomTYPE {
  unknown(-1),
  one_to_one(1),
  group(2),
  public(3),
  changelog(4),
  one_to_one_former(5),
  note_to_self(6);

  const RoomTYPE(this.value);
  final int value;
}

enum RoomOBJECT {
  type_email('emails'),
  type_file('file'),
  type_phone('phone'),
  type_video_verification('share:password');

  const RoomOBJECT(this.value);
  final String value;
}

enum RoomRECORDING {
  none(0),
  video(1),
  audio(2),
  video_starting(3),
  audio_starting(4),
  failed(5);

  const RoomRECORDING(this.value);
  final int value;
}

enum RoomREAD {
  write(0),
  only(1);

  const RoomREAD(this.value);
  final int value;
}

enum RoomLISTABLE {
  none(0),
  users(1),
  all(2);

  const RoomLISTABLE(this.value);
  final int value;
}

enum RoomSTART {
  call_everyone(0),
  call_users(1),
  call_moderators(2),
  call_noone(3);

  const RoomSTART(this.value);
  final int value;
}

enum RoomPARTICIPANT {
  removed('remove'),
  removed_all('remove_all'),
  left('leave');

  const RoomPARTICIPANT(this.value);
  final String value;
}

enum CanUseTalkMiddlewareTALK {
  desktop_min_version('0.6.0'),
  desktop_min_version_recording_consent('0.16.0'),
  android_min_version('15.0.0'),
  android_min_version_recording_consent('18.0.0'),
  ios_min_version('15.0.0'),
  ios_min_version_recording_consent('18.0.0');

  const CanUseTalkMiddlewareTALK(this.value);
  final String value;
}

enum ConfigSIGNALING {
  internal('internal'),
  external('external'),
  cluster_conversation('conversation_cluster');

  const ConfigSIGNALING(this.value);
  final String value;
}

enum FederationManagerTALK {
  room_resource('talk-room'),
  protocol_name('nctalk');

  const FederationManagerTALK(this.value);
  final String value;
}

enum FederationManagerNOTIFICATION {
  share_accepted('SHARE_ACCEPTED'),
  share_declined('SHARE_DECLINED'),
  share_unshared('SHARE_UNSHARED'),
  room_modified('ROOM_MODIFIED');

  const FederationManagerNOTIFICATION(this.value);
  final String value;
}

enum RoomShareTALK {
  folder('/Talk'),
  folder_placeholder('/{TALK_PLACEHOLDER}');

  const RoomShareTALK(this.value);
  final String value;
}
