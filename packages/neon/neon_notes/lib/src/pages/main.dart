import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:neon_notes/src/blocs/notes.dart';
import 'package:neon_notes/src/utils/exception_handler.dart';
import 'package:neon_notes/src/widgets/categories_view.dart';
import 'package:neon_notes/src/widgets/notes_floating_action_button.dart';
import 'package:neon_notes/src/widgets/notes_view.dart';

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
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<NotesBloc>(context);

    errorsSubscription = bloc.errors.listen((error) {
      handleNotesException(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.note),
            label: NotesLocalizations.of(context).notes,
          ),
          BottomNavigationBarItem(
            icon: Icon(AdaptiveIcons.tag),
            label: NotesLocalizations.of(context).categories,
          ),
        ],
      ),
      body: views[_index],
      floatingActionButton: floatingActionButtons[_index],
    );
  }
}
