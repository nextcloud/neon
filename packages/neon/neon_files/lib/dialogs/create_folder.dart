part of '../neon_files.dart';

class FilesCreateFolderDialog extends StatefulWidget {
  const FilesCreateFolderDialog({
    super.key,
  });

  @override
  State<FilesCreateFolderDialog> createState() => _FilesCreateFolderDialogState();
}

class _FilesCreateFolderDialogState extends State<FilesCreateFolderDialog> {
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(controller.text.split('/'));
    }
  }

  @override
  Widget build(final BuildContext context) => CustomDialog(
        title: Text(AppLocalizations.of(context).filesCreateFolder),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).filesFolderName,
                  ),
                  autofocus: true,
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(AppLocalizations.of(context).filesCreateFolder),
                ),
              ],
            ),
          ),
        ],
      );
}
