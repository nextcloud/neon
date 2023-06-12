part of '../neon_notes.dart';

class NotesSelectCategoryDialog extends StatefulWidget {
  const NotesSelectCategoryDialog({
    this.initialCategory,
    super.key,
  });

  final String? initialCategory;

  @override
  State<NotesSelectCategoryDialog> createState() => _NotesSelectCategoryDialogState();
}

class _NotesSelectCategoryDialogState extends State<NotesSelectCategoryDialog> {
  final formKey = GlobalKey<FormState>();
  late NotesBloc bloc;

  String? selectedCategory;

  @override
  void initState() {
    bloc = Provider.of<NotesBloc>(context, listen: false);

    super.initState();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(selectedCategory);
    }
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<NextcloudNotesNote>>(
        stream: bloc.notes,
        builder: (final context, final notes) => NeonDialog(
          title: Text(AppLocalizations.of(context).category),
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: NeonException(
                      notes.error,
                      onRetry: bloc.refresh,
                    ),
                  ),
                  Center(
                    child: NeonLinearProgressIndicator(
                      visible: notes.loading,
                    ),
                  ),
                  if (notes.data != null) ...[
                    NotesCategorySelect(
                      categories: notes.data!.map((final note) => note.category).toSet().toList(),
                      initialValue: widget.initialCategory,
                      onChanged: (final category) {
                        selectedCategory = category;
                      },
                      onSubmitted: submit,
                    ),
                  ],
                  ElevatedButton(
                    onPressed: submit,
                    child: Text(AppLocalizations.of(context).noteSetCategory),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
