import 'package:flutter/material.dart';
import 'package:neon/blocs.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:neon_notes/src/blocs/notes.dart';
import 'package:neon_notes/src/widgets/category_select.dart';
import 'package:nextcloud/notes.dart' as notes;

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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop((controller.text, widget.category ?? selectedCategory));
    }
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<notes.Note>>.behaviorSubject(
        subject: widget.bloc.notesList,
        builder: (final context, final notes) => NeonDialog(
          title: Text(NotesLocalizations.of(context).noteCreate),
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
                      hintText: NotesLocalizations.of(context).noteTitle,
                    ),
                    validator: (final input) => validateNotEmpty(context, input),
                    onFieldSubmitted: (final _) {
                      submit();
                    },
                  ),
                  if (widget.category == null) ...[
                    Center(
                      child: NeonError(
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
                    child: Text(NotesLocalizations.of(context).noteCreate),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
