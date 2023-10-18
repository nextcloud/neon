import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/widgets/folder_select.dart';
import 'package:nextcloud/news.dart' as news;

class NewsAddFeedDialog extends StatefulWidget {
  const NewsAddFeedDialog({
    required this.bloc,
    this.folderID,
    super.key,
  });

  final NewsBloc bloc;
  final int? folderID;

  @override
  State<NewsAddFeedDialog> createState() => _NewsAddFeedDialogState();
}

class _NewsAddFeedDialogState extends State<NewsAddFeedDialog> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  news.Folder? folder;

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop((controller.text, widget.folderID ?? folder?.id));
    }
  }

  @override
  void initState() {
    super.initState();

    unawaited(
      Clipboard.getData(Clipboard.kTextPlain).then((final clipboardContent) {
        if (clipboardContent != null && clipboardContent.text != null) {
          final uri = Uri.tryParse(clipboardContent.text!);
          if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) {
            controller.text = clipboardContent.text!;
          }
        }
      }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<news.Folder>>.behaviorSubject(
        subject: widget.bloc.folders,
        builder: (final context, final folders) => NeonDialog(
          title: Text(NewsLocalizations.of(context).feedAdd),
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'https://...',
                    ),
                    keyboardType: TextInputType.url,
                    validator: (final input) => validateHttpUrl(context, input),
                    onFieldSubmitted: (final _) {
                      submit();
                    },
                  ),
                  if (widget.folderID == null) ...[
                    Center(
                      child: NeonError(
                        folders.error,
                        onRetry: widget.bloc.refresh,
                      ),
                    ),
                    Center(
                      child: NeonLinearProgressIndicator(
                        visible: folders.isLoading,
                      ),
                    ),
                    if (folders.hasData) ...[
                      NewsFolderSelect(
                        folders: folders.requireData,
                        value: folder,
                        onChanged: (final f) {
                          setState(() {
                            folder = f;
                          });
                        },
                      ),
                    ],
                  ],
                  ElevatedButton(
                    onPressed: folders.hasData ? submit : null,
                    child: Text(NewsLocalizations.of(context).feedAdd),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class NewsCreateFolderDialog extends StatefulWidget {
  const NewsCreateFolderDialog({
    super.key,
  });

  @override
  State<NewsCreateFolderDialog> createState() => _NewsCreateFolderDialogState();
}

class _NewsCreateFolderDialogState extends State<NewsCreateFolderDialog> {
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(controller.text);
    }
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        title: Text(NewsLocalizations.of(context).folderCreate),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: NewsLocalizations.of(context).folderCreateName,
                  ),
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(NewsLocalizations.of(context).folderCreate),
                ),
              ],
            ),
          ),
        ],
      );
}

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

class NewsMoveFeedDialog extends StatefulWidget {
  const NewsMoveFeedDialog({
    required this.folders,
    required this.feed,
    super.key,
  });

  final List<news.Folder> folders;
  final news.Feed feed;

  @override
  State<NewsMoveFeedDialog> createState() => _NewsMoveFeedDialogState();
}

class _NewsMoveFeedDialogState extends State<NewsMoveFeedDialog> {
  final formKey = GlobalKey<FormState>();

  news.Folder? folder;

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop([folder?.id]);
    }
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        title: Text(NewsLocalizations.of(context).feedMove),
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
                  child: Text(NewsLocalizations.of(context).feedMove),
                ),
              ],
            ),
          ),
        ],
      );
}
