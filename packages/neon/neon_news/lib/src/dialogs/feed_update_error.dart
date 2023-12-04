import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:nextcloud/news.dart' as news;

class NewsFeedUpdateErrorDialog extends StatefulWidget {
  const NewsFeedUpdateErrorDialog({
    required this.feed,
    super.key,
  });

  final news.Feed feed;

  @override
  State<NewsFeedUpdateErrorDialog> createState() => _NewsFeedUpdateErrorDialogState();
}

class _NewsFeedUpdateErrorDialogState extends State<NewsFeedUpdateErrorDialog> {
  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: Text(widget.feed.lastUpdateError!),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(
                  text: widget.feed.lastUpdateError!,
                ),
              );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(NewsLocalizations.of(context).feedCopiedErrorMessage),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text(NewsLocalizations.of(context).feedCopyErrorMessage),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(NewsLocalizations.of(context).actionClose),
          ),
        ],
      );
}
