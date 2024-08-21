import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:notes_app/l10n/localizations.dart';
import 'package:notes_app/src/blocs/notes.dart';
import 'package:notes_app/src/options.dart';
import 'package:notes_app/src/utils/exception_handler.dart';
import 'package:notes_app/src/widgets/categories_view.dart';
import 'package:notes_app/src/widgets/notes_floating_action_button.dart';
import 'package:notes_app/src/widgets/notes_view.dart';

class NotesMainPage extends StatefulWidget {
  const NotesMainPage({
    super.key,
  });

  @override
  State<NotesMainPage> createState() => _NotesMainPageState();
}

class _NotesMainPageState extends State<NotesMainPage> {
  late NotesBloc bloc;
  late int index;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<NotesBloc>(context);

    index = NeonProvider.of<NotesOptions>(context).defaultCategoryOption.value.index;

    errorsSubscription = bloc.errors.listen((error) {
      if (mounted) {
        handleNotesException(context, error);
      }
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
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
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
      body: views[index],
      floatingActionButton: floatingActionButtons[index],
    );
  }
}
