part of '../neon_news.dart';

class NewsMoveFeedDialog extends StatefulWidget {
  const NewsMoveFeedDialog({
    required this.folders,
    required this.feed,
    super.key,
  });

  final List<NextcloudNewsFolder> folders;
  final NextcloudNewsFeed feed;

  @override
  State<NewsMoveFeedDialog> createState() => _NewsMoveFeedDialogState();
}

class _NewsMoveFeedDialogState extends State<NewsMoveFeedDialog> {
  final formKey = GlobalKey<FormState>();

  NextcloudNewsFolder? folder;

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop([folder?.id]);
    }
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        title: Text(AppLocalizations.of(context).feedMove),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NewsFolderSelect(
                  folders: widget.folders,
                  value: widget.feed.folderId != null
                      ? widget.folders.singleWhere((final folder) => folder.id == widget.feed.folderId)
                      : null,
                  onChanged: (final f) {
                    setState(() {
                      folder = f;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(AppLocalizations.of(context).feedMove),
                ),
              ],
            ),
          ),
        ],
      );
}
