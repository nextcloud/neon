part of '../app.dart';

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
      Navigator.of(context).pop([controller.text, widget.folderID ?? folder?.id]);
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
  Widget build(final BuildContext context) => StandardRxResultBuilder<NewsBloc, List<NewsFolder>>(
        bloc: widget.bloc,
        state: (final bloc) => bloc.folders,
        builder: (
          final context,
          final foldersData,
          final foldersError,
          final foldersLoading,
          final _,
        ) =>
            CustomDialog(
          title: Text(AppLocalizations.of(context).newsAddFeed),
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
                    validator: (final input) => validateHttpUrl(context, input),
                    onFieldSubmitted: (final _) {
                      submit();
                    },
                  ),
                  if (widget.folderID == null) ...[
                    Center(
                      child: ExceptionWidget(
                        foldersError,
                        onRetry: () {
                          widget.bloc.refresh(
                            mainArticlesToo: false,
                          );
                        },
                      ),
                    ),
                    Center(
                      child: CustomLinearProgressIndicator(
                        visible: foldersLoading,
                      ),
                    ),
                    if (foldersData != null) ...[
                      NewsFolderSelect(
                        folders: foldersData,
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
                    onPressed: foldersData != null ? submit : null,
                    child: Text(AppLocalizations.of(context).newsAddFeed),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
