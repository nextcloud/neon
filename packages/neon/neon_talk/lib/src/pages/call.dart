import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/blocs/call.dart';
import 'package:neon_talk/src/dialogs/select_screen.dart';
import 'package:neon_talk/src/utils/view_size.dart';
import 'package:neon_talk/src/widgets/call_button.dart';
import 'package:neon_talk/src/widgets/call_participant_view.dart';

class TalkCallPage extends StatefulWidget {
  const TalkCallPage({
    required this.bloc,
    super.key,
  });

  final TalkCallBloc bloc;

  @override
  State<TalkCallPage> createState() => _TalkCallPageState();
}

class _TalkCallPageState extends State<TalkCallPage> {
  @override
  void initState() {
    widget.bloc.errors.listen((error) {
      if (!mounted) {
        return;
      }
      NeonError.showSnackbar(context, error);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: widget.bloc.audioEnabled,
        builder: (context, audioEnabledSnapshot) => StreamBuilder(
          stream: widget.bloc.videoEnabled,
          builder: (context, videoEnabledSnapshot) => StreamBuilder(
            stream: widget.bloc.screenEnabled,
            builder: (context, screenEnabledSnapshot) {
              final audioEnabled = audioEnabledSnapshot.data ?? false;
              final videoEnabled = videoEnabledSnapshot.data ?? false;
              final screenEnabled = screenEnabledSnapshot.data ?? false;
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        audioEnabled ? MdiIcons.microphone : MdiIcons.microphoneOff,
                        color: !audioEnabled ? Colors.red : null,
                      ),
                      onPressed: () {
                        widget.bloc.changeAudio(!audioEnabled);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        videoEnabled ? MdiIcons.video : MdiIcons.videoOff,
                        color: !videoEnabled ? Colors.red : null,
                      ),
                      onPressed: () {
                        widget.bloc.changeVideo(!videoEnabled);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        screenEnabled ? MdiIcons.monitorShare : MdiIcons.monitorOff,
                        color: !screenEnabled ? Colors.red : null,
                      ),
                      onPressed: () async {
                        if (!screenEnabled) {
                          final result = await showDialog<DesktopCapturerSource>(
                            context: context,
                            builder: (context) => const TalkSelectScreenDialog(),
                          );
                          if (result == null) {
                            return;
                          }
                        }
                        widget.bloc.changeScreen(!screenEnabled);
                      },
                    ),
                    TalkCallButton(
                      type: TalkCallButtonType.leaveCall,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ]
                      .intersperse(
                        const SizedBox(
                          width: 20,
                        ),
                      )
                      .toList(),
                ),
                body: StreamBuilder(
                  stream: widget.bloc.remoteParticipants,
                  builder: (context, remoteParticipantsSnapshot) {
                    if (remoteParticipantsSnapshot.data == null) {
                      return Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                            width: constraints.maxWidth / 2,
                            child: const NeonLinearProgressIndicator(),
                          ),
                        ),
                      );
                    }

                    final participants = [
                      ...remoteParticipantsSnapshot.requireData,
                      widget.bloc.localParticipant,
                    ];

                    return Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final viewSize = calculateViewSize(participants.length, constraints.biggest);
                          return Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              for (final participant in participants)
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: viewSize.width,
                                    maxHeight: viewSize.height,
                                  ),
                                  child: TalkCallParticipantView(
                                    participant: participant,
                                    localAudioEnabled: audioEnabled,
                                    localVideoEnabled: videoEnabled,
                                    localScreenEnabled: screenEnabled,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
}
