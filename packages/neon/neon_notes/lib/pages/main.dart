part of '../neon_notes.dart';

class NotesMainPage extends StatefulWidget {
  const NotesMainPage({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

  @override
  State<NotesMainPage> createState() => _NotesMainPageState();
}

class _NotesMainPageState extends State<NotesMainPage> {
  late int _index = widget.bloc.options.defaultCategoryOption.value.index;

  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      handleNotesException(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) {
    final views = [
      NotesView(
        bloc: widget.bloc,
      ),
      NotesCategoriesView(
        bloc: widget.bloc,
      ),
    ];

    final floatingActionButtons = [
      NotesFloatingActionButton(bloc: widget.bloc),
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
            icon: const Icon(MdiIcons.tag),
            label: AppLocalizations.of(context).categories,
          ),
        ],
      ),
      body: views[_index],
      floatingActionButton: floatingActionButtons[_index],
    );
  }
}
