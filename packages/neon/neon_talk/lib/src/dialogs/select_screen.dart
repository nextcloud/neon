import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/widgets/screen_preview.dart';

class TalkSelectScreenDialog extends StatefulWidget {
  const TalkSelectScreenDialog({
    super.key,
  });

  @override
  State<TalkSelectScreenDialog> createState() => _TalkSelectScreenDialogState();
}

class _TalkSelectScreenDialogState extends State<TalkSelectScreenDialog> {
  List<DesktopCapturerSource>? sources;
  DesktopCapturerSource? selectedSource;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    unawaited(
      desktopCapturer.getSources(types: SourceType.values).then((sources) {
        setState(() {
          this.sources = sources;
        });
      }),
    );
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      await desktopCapturer.updateSources(types: SourceType.values);
    });
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => NeonDialog(
        title: Text(TalkLocalizations.of(context).screenSharingSelectScreen),
        content: sources == null
            ? const SizedBox.shrink()
            : ListView(
                children: _buildSources().toList(),
              ),
        actions: [
          NeonDialogAction(
            onPressed: selectedSource == null
                ? null
                : () {
                    Navigator.of(context).pop(selectedSource);
                  },
            child: Text(TalkLocalizations.of(context).screenSharingSelectScreen),
          ),
        ],
      );

  Iterable<Widget> _buildSources() sync* {
    for (var i = 0; i < SourceType.values.length; i++) {
      final sourceType = SourceType.values.reversed.elementAt(i);

      if (sourceType == SourceType.Screen) {
        yield Text(TalkLocalizations.of(context).screenSharingSelectScreenScreens);
      } else {
        yield Text(TalkLocalizations.of(context).screenSharingSelectScreenWindows);
      }

      yield Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (final source in sources!.where((source) => source.type == sourceType))
            InkWell(
              onTap: () {
                setState(() {
                  selectedSource = source;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    // Transparent to prevent the image from jumping around when changing the selected source
                    color: selectedSource == source ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                width: max(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) / 5,
                child: TalkScreenPreview(
                  source: source,
                ),
              ),
            ),
        ],
      );

      if (i != SourceType.values.length - 1) {
        yield const Divider();
      }
    }
  }
}
