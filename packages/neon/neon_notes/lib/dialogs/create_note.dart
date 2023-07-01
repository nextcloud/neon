part of '../neon_notes.dart';

class NotesCreateNoteDialog extends StatefulWidget {
  const NotesCreateNoteDialog({
    required this.bloc,
    this.category,
    super.key,
  });

  final NotesBloc bloc;
  final String? category;

  @override
  State<NotesCreateNoteDialog> createState() => _NotesCreateNoteDialogState();
}

class _NotesCreateNoteDialogState extends State<NotesCreateNoteDialog> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  String? selectedCategory;

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop((controller.text, widget.category ?? selectedCategory));
    }
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<NotesNote>>.behaviorSubject(
        stream: widget.bloc.notes,
        builder: (final context, final notes) => NeonDialog(
          title: Text(AppLocalizations.of(context).noteCreate),
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
                      hintText: AppLocalizations.of(context).noteTitle,
                    ),
                    validator: (final input) => validateNotEmpty(context, input),
                    onFieldSubmitted: (final _) {
                      submit();
                    },
                  ),
                  if (widget.category == null) ...[
                    Center(
                      child: NeonException(
                        notes.error,
                        onRetry: widget.bloc.refresh,
                      ),
                    ),
                    Center(
                      child: NeonLinearProgressIndicator(
                        visible: notes.isLoading,
                      ),
                    ),
                    if (notes.hasData) ...[
                      NotesCategorySelect(
                        categories: notes.requireData.map((final note) => note.category).toSet().toList(),
                        onChanged: (final category) {
                          selectedCategory = category;
                        },
                        onSubmitted: submit,
                      ),
                    ],
                  ],
                  ElevatedButton(
                    onPressed: submit,
                    child: Text(AppLocalizations.of(context).noteCreate),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
