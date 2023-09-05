part of '../neon_news.dart';

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

  NewsFolder? folder;

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
  Widget build(final BuildContext context) => ResultBuilder<List<NewsFolder>>.behaviorSubject(
        stream: widget.bloc.folders,
        builder: (final context, final folders) => NeonDialog(
          title: Text(AppLocalizations.of(context).feedAdd),
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
                      child: NeonException(
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
                    child: Text(AppLocalizations.of(context).feedAdd),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
