part of '../app.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    required this.bloc,
    this.category,
    super.key,
  });

  final NotesBloc bloc;
  final String? category;

  @override
  Widget build(final BuildContext context) => StandardRxResultBuilder<NotesBloc, List<NotesNote>>(
        bloc: bloc,
        state: (final bloc) => bloc.notes,
        builder: (
          final context,
          final notesData,
          final notesError,
          final notesLoading,
          final _,
        ) =>
            Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
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
                  NotesNote(
                    title: result[0] as String,
                    category: result[1] as String?,
                  ),
                );
              }
            },
            child: const Icon(Icons.add),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              bloc.refresh();
            },
            child: Column(
              children: [
                ExceptionWidget(
                  notesError,
                  onRetry: () {
                    bloc.refresh();
                  },
                ),
                CustomLinearProgressIndicator(
                  visible: notesLoading,
                ),
                if (notesData != null) ...[
                  Expanded(
                    child: SortBoxBuilder<NotesSortProperty, NotesNote>(
                      sortBox: notesSortBox,
                      sortPropertyOption: bloc.options.notesSortPropertyOption,
                      sortBoxOrderOption: bloc.options.notesSortBoxOrderOption,
                      input: category != null
                          ? notesData.where((final note) => note.favorite! && note.category == category).toList()
                          : notesData.where((final note) => note.favorite!).toList(),
                      builder: (final context, final sortedFavorites) => SortBoxBuilder<NotesSortProperty, NotesNote>(
                        sortBox: notesSortBox,
                        sortPropertyOption: bloc.options.notesSortPropertyOption,
                        sortBoxOrderOption: bloc.options.notesSortBoxOrderOption,
                        input: category != null
                            ? notesData.where((final note) => !note.favorite! && note.category == category).toList()
                            : notesData.where((final note) => !note.favorite!).toList(),
                        builder: (final context, final sortedNonFavorites) => CustomListView<NotesNote>(
                          scrollKey: 'notes-notes',
                          withFloatingActionButton: true,
                          items: [...sortedFavorites, ...sortedNonFavorites],
                          builder: _buildNote,
                        ),
                      ),
                    ),
                  ),
                ],
              ]
                  .intersperse(
                    const SizedBox(
                      height: 10,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );

  Widget _buildNote(
    final BuildContext context,
    final NotesNote note,
  ) =>
      ListTile(
        title: Text(note.title!),
        subtitle: Row(
          children: [
            Text(
              CustomTimeAgo.format(
                DateTime.fromMillisecondsSinceEpoch(note.modified! * 1000),
              ),
            ),
            if (note.category! != '') ...[
              const SizedBox(
                width: 8,
              ),
              Icon(
                MdiIcons.tag,
                size: 14,
                color: NotesCategoryColor.compute(note.category!),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(note.category!),
            ],
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            note.favorite! ? Icons.star : Icons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            bloc.updateNote(
              note.id!,
              note.etag!,
              NotesNote(
                favorite: !note.favorite!,
              ),
            );
          },
        ),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (final context) => NotesNotePage(
                bloc: bloc,
                note: note,
              ),
            ),
          );
        },
        onLongPress: () async {
          final result = await showConfirmationDialog(
            context,
            AppLocalizations.of(context).notesDeleteNoteConfirm(note.title!),
          );
          if (result) {
            bloc.deleteNote(note);
          }
        },
      );
}
