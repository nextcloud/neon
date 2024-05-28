import 'package:nextcloud/spreed.dart' as spreed;

/// `systemMessage` of chat messages that are hidden and only need to be processed internally.
/// They modify the state of other messages, but should not be displayed to the user.
// Keep this in sync with https://github.com/nextcloud/spreed/blob/ada70487a306751accb280a475b1f123a56d4e74/src/store/conversationsStore.js#L689
const _hiddenMessages = <String>{
  'reaction',
  'reaction_revoked',
  'reaction_deleted',
  'message_deleted',
  'message_edited',
  'poll_voted',
};

/// Extension for querying if a chat message is hidden.
extension ChatMessageHidden on spreed.$ChatMessageInterface {
  /// Chat message is hidden for the user and only needs to be processed internally.
  bool get isHidden => _hiddenMessages.contains(systemMessage);
}
