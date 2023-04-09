part of '../neon_news.dart';

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

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(controller.text);
    }
  }

  @override
  Widget build(final BuildContext context) => CustomDialog(
        title: Text(AppLocalizations.of(context).newsCreateFolder),
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
                    hintText: AppLocalizations.of(context).newsCreateFolderName,
                  ),
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(AppLocalizations.of(context).newsCreateFolder),
                ),
              ],
            ),
          ),
        ],
      );
}
