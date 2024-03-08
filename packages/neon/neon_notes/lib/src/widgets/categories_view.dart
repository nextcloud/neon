import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:neon_notes/src/blocs/notes.dart';
import 'package:neon_notes/src/pages/category.dart';
import 'package:neon_notes/src/sort/categories.dart';
import 'package:neon_notes/src/utils/category_color.dart';

class NotesCategoriesView extends StatelessWidget {
  const NotesCategoriesView({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.notes,
      builder: (context, notes) => SortBoxBuilder(
        sortBox: categoriesSortBox,
        sortProperty: bloc.options.categoriesSortPropertyOption,
        sortBoxOrder: bloc.options.categoriesSortBoxOrderOption,
        input: notes.data
            ?.map((note) => note.category)
            .toSet()
            .map(
              (category) => NoteCategory(
                category,
                notes.requireData.where((note) => note.category == category).length,
              ),
            )
            .toList(),
        builder: (context, sorted) => NeonListView(
          scrollKey: 'notes-categories',
          isLoading: notes.isLoading,
          error: notes.error,
          onRefresh: bloc.refresh,
          itemCount: sorted.length,
          itemBuilder: (context, index) => _buildCategory(
            context,
            sorted[index],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context,
    NoteCategory category,
  ) =>
      ListTile(
        title: Text(category.name.isNotEmpty ? category.name : NotesLocalizations.of(context).categoryUncategorized),
        subtitle: Text(NotesLocalizations.of(context).categoryNotesCount(category.count)),
        leading: category.name.isNotEmpty
            ? Icon(
                AdaptiveIcons.tag,
                size: largeIconSize,
                color: NotesCategoryColor.compute(category.name),
              )
            : const SizedBox.square(dimension: largeIconSize),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => NotesCategoryPage(
                bloc: bloc,
                category: category,
              ),
            ),
          );
        },
      );
}
