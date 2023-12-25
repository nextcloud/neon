import 'package:flutter/material.dart';
import 'package:neon_framework/src/utils/validators.dart';
import 'package:neon_framework/src/widgets/dialog.dart';

/// Shows a dialog asking the user to rename the thing stated in the [title].
///
/// [value] describes the current name of the thing before renaming.
Future<String?> showRenameDialog({
  required final BuildContext context,
  required final String title,
  required final String value,
  final Key? key,
}) async =>
    showDialog<String?>(
      context: context,
      builder: (final context) => _RenameDialog(
        title: title,
        value: value,
        key: key,
      ),
    );

class _RenameDialog extends StatefulWidget {
  const _RenameDialog({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  State<_RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<_RenameDialog> {
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

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
        title: Text(widget.title),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: controller,
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(widget.title),
                ),
              ],
            ),
          ),
        ],
      );
}
