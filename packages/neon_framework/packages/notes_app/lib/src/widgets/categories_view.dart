import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:notes_app/l10n/localizations.dart';
import 'package:notes_app/src/blocs/notes.dart';
import 'package:notes_app/src/options.dart';
import 'package:notes_app/src/pages/category.dart';
import 'package:notes_app/src/sort/categories.dart';
import 'package:notes_app/src/utils/category_color.dart';

class NotesCategoriesView extends StatelessWidget {
  const NotesCategoriesView({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

  @override
  Widget build(BuildContext context) {
    final options = NeonProvider.of<NotesOptions>(context);

    return ResultBuilder.behaviorSubject(
      subject: bloc.notes,
      builder: (context, notes) => SortBoxBuilder(
        sortBox: categoriesSortBox,
        sortProperty: options.categoriesSortPropertyOption,
        sortBoxOrder: options.categoriesSortBoxOrderOption,
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
