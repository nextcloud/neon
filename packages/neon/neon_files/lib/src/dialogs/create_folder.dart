import 'package:flutter/material.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';

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
        title: Text(FilesLocalizations.of(context).folderCreate),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: FilesLocalizations.of(context).folderName,
                  ),
                  autofocus: true,
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(FilesLocalizations.of(context).folderCreate),
                ),
              ],
            ),
          ),
        ],
      );
}
