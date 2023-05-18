part of '../neon_notes.dart';

class NotesCategoryPage extends StatelessWidget {
  const NotesCategoryPage({
    required this.bloc,
    required this.category,
    super.key,
  });

  final NotesBloc bloc;
  final NoteCategory category;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(category.name != '' ? category.name : AppLocalizations.of(context).notesUncategorized),
        ),
        body: NotesView(
          bloc: bloc,
          category: category.name,
        ),
        floatingActionButton: NotesFloatingActionButton(
          bloc: bloc,
          category: category.name,
        ),
      );
}
