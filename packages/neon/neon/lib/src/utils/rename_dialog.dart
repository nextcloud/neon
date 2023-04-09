part of '../../neon.dart';

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

  late final controller = TextEditingController()..text = widget.value;

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
