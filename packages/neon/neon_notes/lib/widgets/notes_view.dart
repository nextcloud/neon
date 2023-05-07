part of '../neon_notes.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    required this.bloc,
    this.category,
    super.key,
  });

  final NotesBloc bloc;
  final String? category;

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<NextcloudNotesNote>>(
        stream: bloc.notes,
        builder: (final context, final notes) => SortBoxBuilder<NotesSortProperty, NextcloudNotesNote>(
          sortBox: notesSortBox,
          sortPropertyOption: bloc.options.notesSortPropertyOption,
          sortBoxOrderOption: bloc.options.notesSortBoxOrderOption,
          input: category != null
              ? notes.data?.where((final note) => note.favorite && note.category == category).toList()
              : notes.data?.where((final note) => note.favorite).toList(),
          builder: (final context, final sortedFavorites) => SortBoxBuilder<NotesSortProperty, NextcloudNotesNote>(
            sortBox: notesSortBox,
            sortPropertyOption: bloc.options.notesSortPropertyOption,
            sortBoxOrderOption: bloc.options.notesSortBoxOrderOption,
            input: category != null
                ? notes.data?.where((final note) => !note.favorite && note.category == category).toList()
                : notes.data?.where((final note) => !note.favorite).toList(),
            builder: (final context, final sortedNonFavorites) => NeonListView<NextcloudNotesNote>(
              scrollKey: 'notes-notes',
              withFloatingActionButton: true,
              items: [
                ...?sortedFavorites,
                ...?sortedNonFavorites,
              ],
              isLoading: notes.loading,
              error: notes.error,
              onRefresh: bloc.refresh,
              builder: _buildNote,
            ),
          ),
        ),
      );

  Widget _buildNote(
    final BuildContext context,
    final NextcloudNotesNote note,
  ) =>
      ListTile(
        title: Text(note.title),
        subtitle: Row(
          children: [
            RelativeTime(
              date: DateTime.fromMillisecondsSinceEpoch(note.modified * 1000),
            ),
            if (note.category != '') ...[
              const SizedBox(
                width: 8,
              ),
              Icon(
                MdiIcons.tag,
                size: 14,
                color: NotesCategoryColor.compute(note.category),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(note.category),
            ],
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            bloc.updateNote(
              note.id,
              note.etag,
              favorite: !note.favorite,
            );
          },
          tooltip: note.favorite ? AppLocalizations.of(context).notesUnstar : AppLocalizations.of(context).notesStar,
          icon: Icon(
            note.favorite ? Icons.star : Icons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (final context) => NotesNotePage(
                bloc: NotesNoteBloc(
                  bloc.options,
                  Provider.of<AccountsBloc>(context, listen: false).activeAccount.value!.client,
                  bloc,
                  note,
                ),
                notesBloc: bloc,
              ),
            ),
          );
        },
        onLongPress: () async {
          final result = await showConfirmationDialog(
            context,
            AppLocalizations.of(context).notesDeleteNoteConfirm(note.title),
          );
          if (result) {
            bloc.deleteNote(note.id);
          }
        },
      );
}
