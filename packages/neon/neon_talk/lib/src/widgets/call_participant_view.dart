import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/utils/participants.dart';

class TalkCallParticipantView extends StatelessWidget {
  const TalkCallParticipantView({
    required this.participant,
    required this.localAudioEnabled,
    required this.localVideoEnabled,
    required this.localScreenEnabled,
    super.key,
  });

  final TalkCallParticipant participant;
  final bool localAudioEnabled;
  final bool localVideoEnabled;
  final bool localScreenEnabled;

  @override
  Widget build(BuildContext context) {
    final hasEnabledVideoTracks =
        participant.renderer?.srcObject?.getVideoTracks().where((track) => track.enabled).isNotEmpty ?? false;
    final audioEnabled = participant is TalkLocalCallParticipant
        ? localAudioEnabled
        : (participant as TalkRemoteCallParticipant).audioEnabled;
    final videoEnabled = participant is TalkLocalCallParticipant
        ? localVideoEnabled
        : (participant as TalkRemoteCallParticipant).videoEnabled;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: Theme.of(context).colorScheme.primary,
            child: Stack(
              children: [
                Center(
                  child: hasEnabledVideoTracks && videoEnabled
                      ? RTCVideoView(
                          participant.renderer!,
                          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                        )
                      : NeonUserAvatar(
                          username: participant.userID,
                          showStatus: false,
                          size: min(constraints.maxHeight, constraints.maxWidth) / 2,
                        ),
                ),
                if (!audioEnabled)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Icon(
                        MdiIcons.microphoneOff,
                        size: 28,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
