part of '../neon_notes.dart';

class NotesCategoryPage extends StatelessWidget {
  const NotesCategoryPage({
    required this.category,
    super.key,
  });

  final NoteCategory category;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(category.name != '' ? category.name : AppLocalizations.of(context).categoryUncategorized),
        ),
        body: NotesView(
          category: category.name,
        ),
        floatingActionButton: NotesFloatingActionButton(
          category: category.name,
        ),
      );
}
