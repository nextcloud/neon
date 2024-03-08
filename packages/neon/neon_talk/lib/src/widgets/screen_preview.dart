import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class TalkScreenPreview extends StatefulWidget {
  const TalkScreenPreview({
    required this.source,
    super.key,
  });

  final DesktopCapturerSource source;

  @override
  State<TalkScreenPreview> createState() => _TalkScreenPreviewState();
}

class _TalkScreenPreviewState extends State<TalkScreenPreview> {
  late final List<StreamSubscription<dynamic>> subscriptions = [];

  @override
  void initState() {
    super.initState();
    subscriptions.addAll([
      widget.source.onThumbnailChanged.stream.listen((_) => setState(() {})),
      widget.source.onNameChanged.stream.listen((_) => setState(() {})),
    ]);
  }

  @override
  void dispose() {
    for (final subscription in subscriptions) {
      unawaited(subscription.cancel());
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (widget.source.thumbnail != null)
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.memory(
                widget.source.thumbnail!,
                gaplessPlayback: true,
                fit: BoxFit.contain,
              ),
            ),
          Text(
            widget.source.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
