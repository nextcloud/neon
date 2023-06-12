part of '../neon_notes.dart';

class NotesFloatingActionButton extends StatelessWidget {
  const NotesFloatingActionButton({
    this.category,
    super.key,
  });

  final String? category;

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<NotesBloc>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {
        final result = await showDialog<List>(
          context: context,
          builder: (final context) => NotesCreateNoteDialog(
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
      tooltip: AppLocalizations.of(context).noteCreate,
      child: const Icon(Icons.add),
    );
  }
}
