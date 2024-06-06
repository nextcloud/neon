import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:neon_notes/src/blocs/note.dart';
import 'package:neon_notes/src/blocs/notes.dart';
import 'package:neon_notes/src/options.dart';
import 'package:neon_notes/src/pages/note.dart';
import 'package:neon_notes/src/sort/notes.dart';
import 'package:neon_notes/src/utils/category_color.dart';
import 'package:nextcloud/notes.dart' as notes;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;

class NotesView extends StatelessWidget {
  const NotesView({
    required this.bloc,
    this.category,
    super.key,
  });

  final NotesBloc bloc;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.notes,
      builder: (context, notesList) => SortBoxBuilder(
        sortBox: notesSortBox,
        presort: const {
          (property: NotesSortProperty.favorite, order: SortBoxOrder.ascending),
        },
        sortProperty: bloc.options.notesSortPropertyOption,
        sortBoxOrder: bloc.options.notesSortBoxOrderOption,
        input: category != null
            ? notesList.data?.where((note) => note.category == category).toList()
            : notesList.data?.toList(),
        builder: (context, sorted) => NeonListView(
          scrollKey: 'notes-notes',
          isLoading: notesList.isLoading,
          error: notesList.error,
          onRefresh: bloc.refresh,
          itemCount: sorted.length,
          itemBuilder: (context, index) => _buildNote(context, sorted[index]),
        ),
      ),
    );
  }

  Widget _buildNote(
    BuildContext context,
    notes.Note note,
  ) =>
      ListTile(
        title: Text(note.title),
        subtitle: Row(
          children: [
            RelativeTime(
              date: DateTimeUtils.fromSecondsSinceEpoch(
                tz.UTC,
                note.modified,
              ),
            ),
            if (note.category.isNotEmpty) ...[
              const SizedBox(
                width: 8,
              ),
              Icon(
                AdaptiveIcons.tag,
                size: smallIconSize,
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
          tooltip: note.favorite ? NotesLocalizations.of(context).noteUnstar : NotesLocalizations.of(context).noteStar,
          icon: Icon(
            note.favorite ? AdaptiveIcons.star : AdaptiveIcons.star_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => NotesNotePage(
                bloc: NotesNoteBloc(
                  notesBloc: bloc,
                  account: NeonProvider.of<Account>(context),
                  note: note,
                ),
                notesBloc: bloc,
              ),
            ),
          );
        },
        onLongPress: () async {
          final result = await showConfirmationDialog(
            context: context,
            title: NotesLocalizations.of(context).noteDeleteConfirm(note.title),
          );
          if (result) {
            bloc.deleteNote(note.id);
          }
        },
      );
}
