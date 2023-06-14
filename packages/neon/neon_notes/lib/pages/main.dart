part of '../neon_notes.dart';

class NotesMainPage extends StatefulWidget {
  const NotesMainPage({
    super.key,
  });

  @override
  State<NotesMainPage> createState() => _NotesMainPageState();
}

class _NotesMainPageState extends State<NotesMainPage> {
  late NotesBloc bloc;
  late int _index = bloc.options.defaultCategoryOption.value.index;

  @override
  void initState() {
    super.initState();

    bloc = Provider.of<NotesBloc>(context, listen: false);

    bloc.errors.listen((final error) {
      handleNotesException(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) {
    final views = [
      NotesView(
        bloc: bloc,
      ),
      NotesCategoriesView(
        bloc: bloc,
      ),
    ];

    final floatingActionButtons = [
      NotesFloatingActionButton(bloc: bloc),
      null,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (final index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.note),
            label: AppLocalizations.of(context).notes,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.tag),
            label: AppLocalizations.of(context).categories,
          ),
        ],
      ),
      body: views[_index],
      floatingActionButton: floatingActionButtons[_index],
    );
  }
}
