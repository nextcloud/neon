import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_talk/src/utils/participants.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

sealed class TalkCallBloc implements InteractiveBloc {
  factory TalkCallBloc(
    spreed.SignalingSettings settings,
    NextcloudClient client,
    String roomToken,
    String sessionID,
  ) =>
      _TalkCallBloc(
        settings,
        client,
        roomToken,
        sessionID,
      );

  Future<void> leaveCall();

  // ignore: avoid_positional_boolean_parameters
  void changeAudio(bool enabled);

  // ignore: avoid_positional_boolean_parameters
  void changeVideo(bool enabled);

  // ignore: avoid_positional_boolean_parameters
  void changeScreen(bool enabled);

  BehaviorSubject<BuiltList<TalkRemoteCallParticipant>> get remoteParticipants;

  BehaviorSubject<bool> get audioEnabled;

  BehaviorSubject<bool> get videoEnabled;

  BehaviorSubject<bool> get screenEnabled;

  TalkLocalCallParticipant get localParticipant;
}

class _TalkCallBloc extends InteractiveBloc implements TalkCallBloc {
  _TalkCallBloc(
    this.settings,
    this.client,
    this.roomToken,
    this.sessionID,
  ) {
    unawaited(_setupLocalParticipant().then((_) => refresh()));

    listenForSignalingMessagesSubscription = _pullSignalingMessages().listen(onSignalingMessages);
  }

  @override
  final log = Logger('TalkCallBloc');

  final spreed.SignalingSettings settings;
  final NextcloudClient client;
  final String roomToken;
  final String sessionID;
  late final StreamSubscription<BuiltList<spreed.SignalingData>> listenForSignalingMessagesSubscription;

  @override
  late TalkLocalCallParticipant localParticipant;

  @override
  void dispose() {
    unawaited(listenForSignalingMessagesSubscription.cancel());
    for (final participant in remoteParticipants.value) {
      participant.dispose();
    }
    unawaited(remoteParticipants.close());
    unawaited(audioEnabled.close());
    unawaited(videoEnabled.close());
    unawaited(screenEnabled.close());
    super.dispose();
  }

  @override
  final remoteParticipants = BehaviorSubject.seeded(BuiltList());

  @override
  final audioEnabled = BehaviorSubject.seeded(false);

  @override
  final videoEnabled = BehaviorSubject.seeded(false);

  @override
  final screenEnabled = BehaviorSubject.seeded(false);

  @override
  Future<void> refresh() async {
    await wrapAction(() async {
      await client.spreed.call.joinCall(token: roomToken);
    });
  }

  @override
  Future<void> leaveCall() async {
    await wrapAction(() async {
      await client.spreed.call.leaveCall(token: roomToken);
    });
  }

  @override
  Future<void> changeAudio(bool enabled) async {
    audioEnabled.add(enabled);
    await _updateLocalParticipant();
  }

  @override
  Future<void> changeVideo(bool enabled) async {
    videoEnabled.add(enabled);
    await _updateLocalParticipant();
  }

  @override
  void changeScreen(bool enabled) {
    screenEnabled.add(enabled);
  }

  Future<void> _setupLocalParticipant() async {
    final stream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });
    for (final track in stream.getTracks()) {
      track.enabled = false;
    }
    final renderer = await _getInitializedRenderer();
    renderer.srcObject = stream;
    localParticipant = TalkLocalCallParticipant(
      settings.userId!,
      sessionID,
      renderer,
      stream,
    );
  }

  Future<void> _sendSignalingMessages(BuiltList<spreed.SignalingMessage> messages) async {
    for (final message in messages) {
      // TODO: Send all messages at once, needs to send it over the body and not the URL, because that gets too long
      await wrapAction(() async {
        await client.spreed.signaling.sendMessages(
          token: roomToken,
          messages: ContentString(
            (b) => b
              ..content = BuiltList([
                spreed.SignalingSendMessagesMessages(
                  (b) => b
                    ..fn.update(
                      (b) => b..content = message,
                    )
                    ..sessionId = sessionID,
                ),
              ]),
          ),
        );
      });
    }
  }

  TalkRemoteCallParticipant? _getRemoteParticipant(String sessionID) {
    final remoteParticipantMatches =
        remoteParticipants.value.where((participant) => participant.sessionID == sessionID);
    if (remoteParticipantMatches.length == 1) {
      return remoteParticipantMatches.single;
    }
    return null;
  }

  Future<void> _updateRemoteParticipant(
    String sessionID,
    Future<TalkRemoteCallParticipant> Function(TalkRemoteCallParticipant) call,
  ) async {
    final updatedRemoteParticipants = ListBuilder<TalkRemoteCallParticipant>();
    for (final remoteParticipant in remoteParticipants.value) {
      if (remoteParticipant.sessionID == sessionID) {
        updatedRemoteParticipants.add(await call(remoteParticipant));
      } else {
        updatedRemoteParticipants.add(remoteParticipant);
      }
    }
    remoteParticipants.add(updatedRemoteParticipants.build());
  }

  Stream<BuiltList<spreed.SignalingData>> _pullSignalingMessages() async* {
    // TODO: Cancel the loop
    while (true) {
      try {
        yield (await client.spreed.signaling.pullMessages(token: roomToken)).body.ocs.data;
      } on Exception catch (e, s) {
        if (e is DynamiteStatusCodeException && e.statusCode >= 500) {
          continue;
        }
        debugPrint(e.toString());
        debugPrint(s.toString());
        addError(e);
      }
    }
  }

  Future<void> _updateLocalParticipant() async {
    if (localParticipant.stream != null) {
      for (final track in localParticipant.stream!.getTracks()) {
        switch (track.kind) {
          case 'video':
            track.enabled = videoEnabled.value;
          case 'audio':
            track.enabled = audioEnabled.value;
          default:
            debugPrint('Unknown track kind ${track.kind}');
        }
      }
    }

    await _sendSignalingMessages(_generateMuteMessages(remoteParticipants.value));
  }

  BuiltList<spreed.SignalingMessage> _generateMuteMessages(BuiltList<TalkRemoteCallParticipant> participants) =>
      BuiltList.build((b) {
        for (final remoteParticipant in participants) {
          for (final entry in {
            spreed.SignalingMuteMessage_Payload_Name.audio: audioEnabled.value,
            spreed.SignalingMuteMessage_Payload_Name.video: videoEnabled.value,
          }.entries) {
            b.add(
              (
                signalingICECandidateMessage: null,
                signalingMuteMessage: spreed.SignalingMuteMessage(
                  (b) => b
                    ..from = sessionID
                    ..to = remoteParticipant.sessionID
                    ..type = entry.value ? spreed.SignalingMessageType.unmute : spreed.SignalingMessageType.mute
                    ..payload.update(
                      (b) => b.name = entry.key,
                    ),
                ),
                signalingSessionDescriptionMessage: null,
              ),
            );
          }
        }
      });

  bool _isWeakerParticipant(TalkRemoteCallParticipant remoteParticipant) =>
      sessionID.compareTo(remoteParticipant.sessionID) > 0;

  Future<void> _sendOffer(TalkRemoteCallParticipant remoteParticipant) async {
    debugPrint('Sending offer to ${remoteParticipant.userID} ${remoteParticipant.sessionID}');
    final connection = await _setupConnection(remoteParticipant);
    final localSDP = await connection.createOffer();
    await connection.setLocalDescription(localSDP);
    await _sendSignalingMessages(
      BuiltList.build((b) {
        b
          ..add(
            (
              signalingICECandidateMessage: null,
              signalingMuteMessage: null,
              signalingSessionDescriptionMessage: spreed.SignalingSessionDescriptionMessage(
                (b) => b
                  ..from = sessionID
                  ..to = remoteParticipant.sessionID
                  ..type = spreed.SignalingMessageType.offer
                  ..payload.update(
                    (b) => b
                      ..type = spreed.SignalingSessionDescriptionMessage_Payload_Type.offer
                      ..sdp = localSDP.sdp
                      ..nick = '',
                  ),
              ),
            ),
          )
          ..addAll(_generateMuteMessages(BuiltList.from([remoteParticipant])));
      }),
    );
  }

  Future<RTCPeerConnection> _setupConnection(TalkRemoteCallParticipant remoteParticipant) async {
    final connection = await createPeerConnection(
      {
        'sdpSemantics': 'unified-plan',
        'iceServers': [
          ...settings.stunservers.map((s) => s.toJson()),
          ...settings.turnservers.map((s) => s.toJson()),
        ],
      },
    );
    connection
      ..onTrack = (event) async {
        if (event.track.kind == 'video') {
          final stream = event.streams.first;
          final renderer = await _getInitializedRenderer();
          renderer.srcObject = stream;
          await _updateRemoteParticipant(
            remoteParticipant.sessionID,
            (remoteParticipant) async => remoteParticipant
              ..renderer = renderer
              ..stream = stream,
          );
        }
      }
      ..onIceCandidate = (candidate) async {
        await _sendSignalingMessages(
          BuiltList.build((b) {
            b.add(
              (
                signalingICECandidateMessage: spreed.SignalingICECandidateMessage(
                  (b) => b
                    ..from = sessionID
                    ..to = remoteParticipant.sessionID
                    ..type = spreed.SignalingMessageType.answer
                    ..payload.update(
                      (b) => b
                        ..candidate.update(
                          (b) => b
                            ..candidate = candidate.candidate
                            ..sdpMid = candidate.sdpMid
                            ..sdpMLineIndex = candidate.sdpMLineIndex,
                        ),
                    ),
                ),
                signalingMuteMessage: null,
                signalingSessionDescriptionMessage: null,
              ),
            );
          }),
        );
      }
      ..onIceGatheringState = print
      ..onIceConnectionState = print
      ..onConnectionState = print;
    await remoteParticipant.acceptNewConnection(connection);
    await remoteParticipant.acceptNewLocalStream(localParticipant.stream);

    return connection;
  }

  Future<void> onSignalingMessages(BuiltList<spreed.SignalingData> messages) async {
    for (final message in messages) {
      if (message.signalingSessions != null) {
        final users = message.signalingSessions!.data.where(
          (user) =>
              spreed.ParticipantInCallFlag.values.byBinary(user.inCall).contains(spreed.ParticipantInCallFlag.inCall),
        );

        final currentParticipants = remoteParticipants.value;
        final updatedParticipants = ListBuilder<TalkRemoteCallParticipant>();

        for (final currentParticipant in currentParticipants) {
          if (users.where((user) => user.userId == currentParticipant.userID).isNotEmpty) {
            updatedParticipants.add(currentParticipant);
          } else {
            currentParticipant.dispose();
          }
        }

        for (final user in users) {
          if (currentParticipants.where((currentParticipant) => user.userId == currentParticipant.userID).isEmpty &&
              user.sessionId != sessionID) {
            final remoteParticipant = TalkRemoteCallParticipant(
              user.userId,
              user.sessionId,
              null,
              null,
              null,
              null,
            );
            if (_isWeakerParticipant(remoteParticipant)) {
              await _sendOffer(remoteParticipant);
            }
            updatedParticipants.add(remoteParticipant);
          }
        }
        remoteParticipants.add(updatedParticipants.build());

        continue;
      }

      if (message.signalingMessageWrapper != null) {
        final signalingMessage = message.signalingMessageWrapper!.data.content;

        if (signalingMessage.signalingSessionDescriptionMessage != null) {
          final remoteSDP = signalingMessage.signalingSessionDescriptionMessage!;

          await _updateRemoteParticipant(remoteSDP.from, (remoteParticipant) async {
            switch (remoteSDP.payload.type) {
              case spreed.SignalingSessionDescriptionMessage_Payload_Type.offer:
                debugPrint('Received offer from ${remoteParticipant.userID} ${remoteParticipant.sessionID}');
                final connection = await _setupConnection(remoteParticipant);
                await connection.setRemoteDescription(
                  RTCSessionDescription(
                    remoteSDP.payload.sdp,
                    'offer',
                  ),
                );
                final localSDP = await connection.createAnswer();
                await connection.setLocalDescription(localSDP);
                await _sendSignalingMessages(
                  BuiltList.build((b) {
                    b
                      ..add(
                        (
                          signalingICECandidateMessage: null,
                          signalingMuteMessage: null,
                          signalingSessionDescriptionMessage: spreed.SignalingSessionDescriptionMessage(
                            (b) => b
                              ..from = sessionID
                              ..to = remoteParticipant.sessionID
                              ..type = spreed.SignalingMessageType.answer
                              ..payload.update(
                                (b) => b
                                  ..type = spreed.SignalingSessionDescriptionMessage_Payload_Type.answer
                                  ..sdp = localSDP.sdp
                                  ..nick = '',
                              ),
                          ),
                        ),
                      )
                      ..addAll(_generateMuteMessages(BuiltList.from([remoteParticipant])));
                  }),
                );
              case spreed.SignalingSessionDescriptionMessage_Payload_Type.answer:
                debugPrint('Received answer from ${remoteParticipant.userID} ${remoteParticipant.sessionID}');
            }

            return remoteParticipant;
          });

          continue;
        }

        if (signalingMessage.signalingICECandidateMessage != null) {
          final iceCandidateMessage = signalingMessage.signalingICECandidateMessage!;
          final remoteParticipant = _getRemoteParticipant(iceCandidateMessage.from);
          if (remoteParticipant == null) {
            continue;
          }

          if (iceCandidateMessage.payload.candidate.candidate.isEmpty) {
            // TODO: Handle end-of-candidates properly
            continue;
          }

          await remoteParticipant.addCandidate(
            RTCIceCandidate(
              iceCandidateMessage.payload.candidate.candidate,
              iceCandidateMessage.payload.candidate.sdpMid,
              iceCandidateMessage.payload.candidate.sdpMLineIndex,
            ),
          );

          continue;
        }

        if (signalingMessage.signalingMuteMessage != null) {
          final muteMessage = signalingMessage.signalingMuteMessage!;

          await _updateRemoteParticipant(muteMessage.from, (remoteParticipant) async {
            final isUnmute = muteMessage.type == spreed.SignalingMessageType.unmute;
            switch (muteMessage.payload.name) {
              case spreed.SignalingMuteMessage_Payload_Name.audio:
                remoteParticipant.audioEnabled = isUnmute;
              case spreed.SignalingMuteMessage_Payload_Name.video:
                remoteParticipant.videoEnabled = isUnmute;
            }
            return remoteParticipant;
          });

          continue;
        }
      }

      debugPrint('Unknown signaling message ${message.toJson()}');
    }
  }
}

Future<RTCVideoRenderer> _getInitializedRenderer() async {
  final renderer = RTCVideoRenderer();
  await renderer.initialize();
  return renderer;
}
