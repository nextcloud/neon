import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/src/api/core.openapi.dart' as core;
import 'package:nextcloud/src/api/spreed.openapi.dart' as spreed;
import 'package:version/version.dart';

/// The version of the spreed app that is supported.
const supportedVersion = 17;

/// Extension for checking whether spreed is supported.
extension SpreedVersionSupported on spreed.Client {
  /// Checks whether the spreed app installed on the server is supported by this client.
  ///
  /// Also returns the supported version number.
  VersionSupported<int> isSupported(final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) {
    final version = capabilities.capabilities.spreedPublicCapabilities?.spreedPublicCapabilities0?.spreed.version;
    return (
      isSupported: version != null && Version.parse(version).major == supportedVersion,
      minimumVersion: supportedVersion,
    );
  }
}

/// Conversation types.
///
/// Use [value] to get the integer representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/master/lib/Room.php.
enum RoomType {
  /// Room between two participants.
  oneToOne,

  /// Room with multiple participants.
  group,

  /// Public room with multiple participants.
  public,

  /// Room with the changelog bots that posts a message when a new Talk release was installed.
  changelog,

  /// Room that previously was a [oneToOne]. The user has been deleted on the server or removed from all rooms.
  oneToOneFormer,

  /// Room to send messages to yourself for note keeping.
  noteToSelf;

  /// Integer representation of the [ParticipantType].
  int get value => index + 1;
}

/// Types of chat messages.
///
/// Use [name] to get the string representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/master/lib/Chat/ChatManager.php.
enum MessageType {
  /// Message.
  comment,

  /// Message from the system.
  system,

  /// An object shared to the room.
  // ignore: constant_identifier_names
  object_shared,

  /// Message from a command.
  command,

  /// Deleted message.
  // ignore: constant_identifier_names
  comment_deleted,

  /// Emoji reaction.
  reaction,

  /// Deleted emoji reaction.
  // ignore: constant_identifier_names
  reaction_deleted;
}

/// Actor types of chat messages.
///
/// Use [name] to get the string representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/master/lib/Model/Attendee.php.
enum ActorType {
  /// Logged-in users.
  users,

  /// Groups.
  groups,

  /// Guest users.
  guests,

  /// E-mails.
  emails,

  /// Circles.
  circles,

  /// Users whose messages are bridged in by the Matterbridge integration.
  bridged,

  /// Used by commands and the changelog conversation.
  bots,

  /// Users from other instances.
  // ignore: constant_identifier_names
  federated_users,

  /// Users from SIP.
  phones;
}

/// Participant types.
///
/// Use [value] to get the integer representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/master/lib/Participant.php.
enum ParticipantType {
  /// Owner.
  owner,

  /// Moderator.
  moderator,

  /// User.
  user,

  /// Guest.
  guest,

  /// User following a public link.
  userFollowingPublicLink,

  /// Guest with moderator permissions.
  guestWithModeratorPermissions;

  /// Integer representation of the [ParticipantType].
  int get value => index + 1;
}

/// Attendee permissions.
///
/// Use [fromValue] to convert the integer representation into this enum representation.
/// Use [value] to get the integer representation that is used in the API.
/// Use [ParticipantPermissionsValue.value] to convert multiple [ParticipantPermission] into the integer representation.
///
/// See https://github.com/nextcloud/spreed/blob/master/lib/Model/Attendee.php.
enum ParticipantPermission {
  /// Default permissions.
  $default,

  /// Custom permissions.
  custom,

  /// Start call.
  startCall,

  /// Join call.
  joinCall,

  /// Can ignore lobby.
  canIgnoreLobby,

  /// Can publish audio stream.
  canPublishAudio,

  /// Can publish video stream.
  canPublishVideo,

  /// Can publish screen sharing stream.
  canScreenShare,

  /// Can post chat message, share items and do reactions.
  canSendMessageAndShareAndReact;

  /// Integer representation of the [ParticipantPermission].
  int get value => index == 0 ? 0 : 1 << (index - 1);

  /// Converts the integer representation of multiple [ParticipantPermission]s to the corresponding [ParticipantPermission]s.
  static Set<ParticipantPermission> fromValue(final int value) {
    final permissions = <ParticipantPermission>{};

    var v = value;
    for (var i = 1; i <= ParticipantPermission.values.length - 1; i++) {
      if (v.isOdd) {
        permissions.add(ParticipantPermission.values[i]);
      }
      v = v >> 1;
    }

    if (permissions.isEmpty) {
      permissions.add(ParticipantPermission.$default);
    }

    return permissions;
  }
}

/// Extension for the integer representation of multiple [ParticipantPermission]s.
extension ParticipantPermissionsValue on Set<ParticipantPermission> {
  /// Gets the integer representation of multiple [ParticipantPermission]s.
  int get value => map((final p) => p.value).reduce((final a, final b) => a | b);
}
