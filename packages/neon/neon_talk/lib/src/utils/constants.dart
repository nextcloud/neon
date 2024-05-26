/// `systemMessage` of chat messages that are hidden and only need to be processed internally.
/// They modify the state of messages, but should not be displayed to the user.
// Keep this in sync with https://github.com/nextcloud/spreed/blob/ada70487a306751accb280a475b1f123a56d4e74/src/store/conversationsStore.js#L689
const hiddenMessages = <String>{
  'reaction',
  'reaction_revoked',
  'reaction_deleted',
  'message_deleted',
  'message_edited',
  'poll_voted',
};
