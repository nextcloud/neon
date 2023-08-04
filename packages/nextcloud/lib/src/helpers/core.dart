// ignore_for_file: public_member_api_docs

enum ShareType {
  user,
  group,
  usergroup,
  link,
  email,
  @Deprecated('No longer used')
  contact,
  remote,
  circle,
  guest,
  remoteGroup,
  room,
  @Deprecated('Only used internally')
  userroom,
  deck,
  deckUser,
}
