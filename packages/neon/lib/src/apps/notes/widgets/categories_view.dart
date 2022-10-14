part of '../app.dart';

class NotesCategoriesView extends StatelessWidget {
  const NotesCategoriesView({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

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
            SortBoxBuilder<CategoriesSortProperty, NoteCategory>(
          sortBox: categoriesSortBox,
          sortPropertyOption: bloc.options.categoriesSortPropertyOption,
          sortBoxOrderOption: bloc.options.categoriesSortBoxOrderOption,
          input: notesData
              ?.map((final note) => note.category)
              .toSet()
              .map(
                (final category) => NoteCategory(
                  category,
                  notesData.where((final note) => note.category == category).length,
                ),
              )
              .toList(),
          builder: (final context, final sorted) => CustomListView<NoteCategory>(
            scrollKey: 'notes-categories',
            items: sorted,
            isLoading: notesLoading,
            error: notesError,
            onRetry: () {
              bloc.refresh();
            },
            onRefresh: () async {
              bloc.refresh();
            },
            builder: _buildCategory,
          ),
        ),
      );

  Widget _buildCategory(
    final BuildContext context,
    final NoteCategory category,
  ) =>
      ListTile(
        title: Text(category.name != '' ? category.name : AppLocalizations.of(context).notesUncategorized),
        subtitle: Text(AppLocalizations.of(context).notesNotesInCategory(category.count)),
        leading: category.name != ''
            ? Icon(
                MdiIcons.tag,
                size: 40,
                color: NotesCategoryColor.compute(category.name),
              )
            : const SizedBox(
                height: 40,
                width: 40,
              ),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (final context) => NotesCategoryPage(
                bloc: bloc,
                category: category,
              ),
            ),
          );
        },
      );
}
