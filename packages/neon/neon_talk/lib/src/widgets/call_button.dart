import 'package:flutter/material.dart';
import 'package:neon_talk/l10n/localizations.dart';

class TalkCallButton extends StatelessWidget {
  const TalkCallButton({
    required this.type,
    required this.onPressed,
    super.key,
  });

  final TalkCallButtonType type;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    late final String label;
    late final IconData icon;
    late final Color? backgroundColor;
    switch (type) {
      case TalkCallButtonType.startCall:
        icon = Icons.videocam;
        label = TalkLocalizations.of(context).callStart;
        backgroundColor = null;
      case TalkCallButtonType.joinCall:
        icon = Icons.phone;
        label = TalkLocalizations.of(context).callJoin;
        backgroundColor = Colors.green;
      case TalkCallButtonType.leaveCall:
        icon = Icons.videocam_off;
        label = TalkLocalizations.of(context).callLeave;
        backgroundColor = Colors.red;
    }
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: backgroundColor != null
            ? ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: Theme.of(context).colorScheme.background,
              )
            : null,
      ),
    );
  }
}

enum TalkCallButtonType {
  startCall,
  joinCall,
  leaveCall,
}
