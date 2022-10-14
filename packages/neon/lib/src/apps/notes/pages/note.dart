part of '../app.dart';

class NotesNotePage extends StatefulWidget {
  const NotesNotePage({
    required this.bloc,
    required this.note,
    super.key,
  });

  final NotesBloc bloc;
  final NotesNote note;

  @override
  State<NotesNotePage> createState() => _NotesNotePageState();
}

class _NotesNotePageState extends State<NotesNotePage> {
  late final _contentController = TextEditingController(text: widget.note.content);
  late final _titleController = TextEditingController(text: widget.note.title);
  final _contentFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();

  late NotesNote _note = widget.note;
  bool _showEditor = false;
  bool _synced = true;

  void _focusEditor() {
    _contentFocusNode.requestFocus();
    _contentController.selection = TextSelection.collapsed(offset: _contentController.text.length);
  }

  void _update([final String? selectedCategory]) {
    final updatedTitle = _note.title != _titleController.text ? _titleController.text : null;
    final updatedCategory = selectedCategory != null && _note.category != selectedCategory ? selectedCategory : null;
    final updatedContent = _note.content != _contentController.text ? _contentController.text : null;

    if (updatedTitle != null || updatedCategory != null || updatedContent != null) {
      widget.bloc.updateNote(
        _note.id,
        _note.etag,
        title: updatedTitle,
        category: updatedCategory,
        content: updatedContent,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    void updateSynced() {
      _synced = _note.content == _contentController.text;
    }

    _contentController.addListener(() => setState(updateSynced));

    widget.bloc.noteUpdate.listen((final n) {
      if (mounted && n.id == _note.id) {
        setState(() {
          _note = n;
          updateSynced();
        });
      }
    });

    _titleFocusNode.addListener(() {
      if (!_titleFocusNode.hasFocus) {
        _update();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
        await Wakelock.enable();
      }
      if (widget.bloc.options.defaultNoteViewTypeOption.value == DefaultNoteViewType.edit ||
          widget.note.content.isEmpty) {
        setState(() {
          _showEditor = true;
        });
        _focusEditor();
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    final titleInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        _update();

        if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
          await Wakelock.disable();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: TextField(
            controller: _titleController,
            focusNode: _titleFocusNode,
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: titleInputBorder,
              focusedBorder: titleInputBorder,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _synced ? Icons.check : Icons.sync,
              ),
              onPressed: _update,
            ),
            IconButton(
              icon: Icon(
                _showEditor ? Icons.visibility : Icons.edit,
              ),
              onPressed: () {
                setState(() {
                  _showEditor = !_showEditor;
                });
                if (_showEditor) {
                  _focusEditor();
                } else {
                  // Prevent the cursor going back to the title field
                  _contentFocusNode.unfocus();
                  _titleFocusNode.unfocus();
                }
              },
            ),
            IconButton(
              onPressed: () async {
                final result = await showDialog<String>(
                  context: context,
                  builder: (final context) => NotesSelectCategoryDialog(
                    bloc: widget.bloc,
                    note: _note,
                  ),
                );
                if (result != null) {
                  _update(result);
                }
              },
              icon: Icon(
                MdiIcons.tag,
                color: _note.category.isNotEmpty ? NotesCategoryColor.compute(_note.category) : null,
              ),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _showEditor = true;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: _showEditor ? 20 : 10,
            ),
            color: Colors.transparent,
            constraints: const BoxConstraints.expand(),
            child: _showEditor
                ? TextField(
                    controller: _contentController,
                    focusNode: _contentFocusNode,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  )
                : MarkdownBody(
                    data: _contentController.text,
                    onTapLink: (final text, final href, final title) async {
                      if (href != null) {
                        await launchUrlString(
                          href,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
