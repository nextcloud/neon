import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/src/api/spreed/spreed.openapi.dart' as spreed;
import 'package:version/version.dart';

/// The minimum version of the spreed app that is supported.
final minVersion = Version(20, 0, 0);

/// Extension for checking whether spreed is supported.
extension SpreedVersionCheck on spreed.$Client {
  /// Checks whether the spreed app installed on the server is supported by this client.
  ///
  /// Also returns the supported version number.
  VersionCheck getVersionCheck(core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) {
    final version = capabilities.capabilities.spreedPublicCapabilities?.spreed?.version;
    return VersionCheck(
      versions: version != null ? BuiltList([Version.parse(version)]) : null,
      minimumVersion: minVersion,
    );
  }
}

/// Conversation types.
///
/// Use [value] to get the integer representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/main/lib/Room.php.
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

  /// Converts the integer [value] representation of a [RoomType] into a [RoomType].
  static RoomType fromValue(int value) => RoomType.values[value - 1];

  /// Whether the room is only with one other user.
  bool get isSingleUser => switch (this) {
        RoomType.oneToOne || RoomType.changelog || RoomType.oneToOneFormer || RoomType.noteToSelf => true,
        _ => false,
      };
}

/// Participant types.
///
/// Use [value] to get the integer representation that is used in the API.
/// See https://github.com/nextcloud/spreed/blob/main/lib/Participant.php.
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

  /// Converts the integer [value] representation of a [ParticipantType] into a [ParticipantType].
  static ParticipantType fromValue(int value) => ParticipantType.values[value - 1];
}

/// Attendee permissions.
///
/// Use [EnumByBinary.byBinary] to convert the binary representation into multiple [ParticipantPermission]s.
/// Use [EnumBinary.binary] to get the binary representation that is used in the API.
/// Use [EnumCollectionBinary.binary] to convert multiple [ParticipantPermission]s into the binary representation.
///
/// See https://github.com/nextcloud/spreed/blob/main/lib/Model/Attendee.php.
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
}

/// Participant in-call flags.
///
/// Use [EnumByBinary.byBinary] to convert the binary representation into multiple [ParticipantInCallFlag]s.
/// Use [EnumBinary.binary] to get the binary representation that is used in the API.
/// Use [EnumCollectionBinary.binary] to convert multiple [ParticipantInCallFlag]s into the binary representation.
///
/// See https://github.com/nextcloud/spreed/blob/main/lib/Participant.php.
enum ParticipantInCallFlag {
  /// Not connected to the call.
  disconnected,

  /// Connected to the call.
  inCall,

  /// Connected to the call with audio.
  providesAudio,

  /// Connected to the call with video.
  providesVideo,

  /// Connected to the call using SIP dial-in.
  sipDialIn;
}

/// An extension to convert the binary representation of an enum into enum values.
///
/// See [EnumBinary.binary] for getting the binary representation of a single enum value.
/// See [EnumCollectionBinary.binary] for getting the binary representation of multiple enum values.
extension EnumByBinary<T extends Enum> on List<T> {
  /// Converts the binary representation of an enum into enum values.
  Set<T> byBinary(int value) {
    RangeError.checkNotNegative(value, 'value');

    final result = <T>{};

    var v = value;
    for (var i = 1; i <= length - 1; i++) {
      if (v.isOdd) {
        result.add(this[i]);
      }
      v = v >> 1;
    }

    if (result.isEmpty) {
      result.add(first);
    }

    return result;
  }
}

/// An extension to get the binary representation of an enum value based on its index.
extension EnumBinary on Enum {
  /// Gets the binary representation of the [index].
  ///
  /// See [EnumCollectionBinary.binary] for getting the binary representation of multiple enum values.
  /// See [EnumByBinary.byBinary] for converting the binary representation into the enum values.
  int get binary => index == 0 ? 0 : 1 << (index - 1);
}

/// An extension to get the binary representation of enum values based on their indexes.
extension EnumCollectionBinary<T extends Enum> on Set<T> {
  /// Gets the binary representation of the indexes.
  ///
  /// See [EnumBinary.binary] for getting the binary representation of a single enum value.
  /// See [EnumByBinary.byBinary] for converting the binary representation into enum values.
  int get binary => map((p) => p.binary).fold(0, (a, b) => a | b);
}
