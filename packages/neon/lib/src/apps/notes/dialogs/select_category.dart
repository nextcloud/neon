part of '../app.dart';

class NotesSelectCategoryDialog extends StatefulWidget {
  const NotesSelectCategoryDialog({
    required this.bloc,
    this.initialCategory,
    super.key,
  });

  final NotesBloc bloc;
  final String? initialCategory;

  @override
  State<NotesSelectCategoryDialog> createState() => _NotesSelectCategoryDialogState();
}

class _NotesSelectCategoryDialogState extends State<NotesSelectCategoryDialog> {
  final formKey = GlobalKey<FormState>();

  String? selectedCategory;

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(selectedCategory);
    }
  }

  @override
  Widget build(final BuildContext context) => StandardRxResultBuilder<NotesBloc, List<NotesNote>>(
        bloc: widget.bloc,
        state: (final bloc) => bloc.notes,
        builder: (
          final context,
          final notesData,
          final notesError,
          final notesLoading,
          final _,
        ) =>
            CustomDialog(
          title: Text(AppLocalizations.of(context).notesChangeCategory),
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: ExceptionWidget(
                      notesError,
                      onRetry: () {
                        widget.bloc.refresh();
                      },
                    ),
                  ),
                  Center(
                    child: CustomLinearProgressIndicator(
                      visible: notesLoading,
                    ),
                  ),
                  if (notesData != null) ...[
                    NotesCategorySelect(
                      categories: notesData.map((final note) => note.category).toSet().toList(),
                      initialValue: widget.initialCategory,
                      onChanged: (final category) {
                        selectedCategory = category;
                      },
                      onSubmitted: submit,
                    ),
                  ],
                  ElevatedButton(
                    onPressed: submit,
                    child: Text(AppLocalizations.of(context).notesSetCategory),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
