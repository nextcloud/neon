part of '../neon_notes.dart';

class NotesCategoriesView extends StatelessWidget {
  const NotesCategoriesView({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<notes.Note>>.behaviorSubject(
        stream: bloc.notesList,
        builder: (final context, final notes) => SortBoxBuilder<CategoriesSortProperty, NoteCategory>(
          sortBox: categoriesSortBox,
          sortProperty: bloc.options.categoriesSortPropertyOption,
          sortBoxOrder: bloc.options.categoriesSortBoxOrderOption,
          input: notes.data
              ?.map((final note) => note.category)
              .toSet()
              .map(
                (final category) => NoteCategory(
                  category,
                  notes.requireData.where((final note) => note.category == category).length,
                ),
              )
              .toList(),
          builder: (final context, final sorted) => NeonListView(
            scrollKey: 'notes-categories',
            isLoading: notes.isLoading,
            error: notes.error,
            onRefresh: bloc.refresh,
            itemCount: sorted.length,
            itemBuilder: (final context, final index) => _buildCategory(
              context,
              sorted[index],
            ),
          ),
        ),
      );

  Widget _buildCategory(
    final BuildContext context,
    final NoteCategory category,
  ) =>
      ListTile(
        title: Text(category.name.isNotEmpty ? category.name : NotesLocalizations.of(context).categoryUncategorized),
        subtitle: Text(NotesLocalizations.of(context).categoryNotesCount(category.count)),
        leading: category.name.isNotEmpty
            ? Icon(
                MdiIcons.tag,
                size: largeIconSize,
                color: NotesCategoryColor.compute(category.name),
              )
            : const SizedBox.square(dimension: largeIconSize),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (final context) => NotesCategoryPage(
                bloc: bloc,
                category: category,
              ),
            ),
          );
        },
      );
}
