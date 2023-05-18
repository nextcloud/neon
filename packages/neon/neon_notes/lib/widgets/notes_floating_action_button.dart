part of '../neon_notes.dart';

class NotesFloatingActionButton extends StatelessWidget {
  const NotesFloatingActionButton({
    required this.bloc,
    this.category,
    super.key,
  });

  final NotesBloc bloc;
  final String? category;

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<List>(
            context: context,
            builder: (final context) => NotesCreateNoteDialog(
              bloc: bloc,
              category: category,
            ),
          );
          if (result != null) {
            bloc.createNote(
              title: result[0] as String,
              category: result[1] as String? ?? '',
            );
          }
        },
        tooltip: AppLocalizations.of(context).notesCreateNote,
        child: const Icon(Icons.add),
      );
}
