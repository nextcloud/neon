part of '../neon_news.dart';

class NewsFeedShowURLDialog extends StatefulWidget {
  const NewsFeedShowURLDialog({
    required this.feed,
    super.key,
  });

  final news.Feed feed;

  @override
  State<NewsFeedShowURLDialog> createState() => _NewsFeedShowURLDialogState();
}

class _NewsFeedShowURLDialogState extends State<NewsFeedShowURLDialog> {
  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: Text(widget.feed.url),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(
                  text: widget.feed.url,
                ),
              );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(NewsLocalizations.of(context).feedCopiedURL),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text(NewsLocalizations.of(context).feedCopyURL),
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
