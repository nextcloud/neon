part of '../neon_news.dart';

class NewsFeedUpdateErrorDialog extends StatefulWidget {
  const NewsFeedUpdateErrorDialog({
    required this.feed,
    super.key,
  });

  final NextcloudNewsFeed feed;

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
                    content: Text(AppLocalizations.of(context).newsCopiedFeedErrorMessage),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text(AppLocalizations.of(context).newsCopyFeedErrorMessage),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).close),
          ),
        ],
      );
}
