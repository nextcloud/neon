part of '../app.dart';

class NotesNotePage extends StatefulWidget {
  const NotesNotePage({
    required this.bloc,
    required this.notesBloc,
    super.key,
  });

  final NotesNoteBloc bloc;
  final NotesBloc notesBloc;

  @override
  State<NotesNotePage> createState() => _NotesNotePageState();
}

class _NotesNotePageState extends State<NotesNotePage> {
  late final _contentController = TextEditingController()..text = widget.bloc.initialContent;
  late final _titleController = TextEditingController()..text = widget.bloc.initialTitle;
  final _contentFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  bool _showEditor = false;

  void _focusEditor() {
    _contentFocusNode.requestFocus();
    _contentController.selection = TextSelection.collapsed(offset: _contentController.text.length);
  }

  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      handleNotesException(context, error);
    });

    _contentController.addListener(() => widget.bloc.updateContent(_contentController.text));
    _titleController.addListener(() => widget.bloc.updateTitle(_titleController.text));

    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
        await Wakelock.enable();
      }
      if (widget.bloc.options.defaultNoteViewTypeOption.value == DefaultNoteViewType.edit ||
          widget.bloc.initialContent.isEmpty) {
        setState(() {
          _showEditor = true;
        });
        _focusEditor();
      }
    });
  }

  @override
  Widget build(final BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (Provider.of<NeonPlatform>(context, listen: false).canUseWakelock) {
            await Wakelock.disable();
          }
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            titleSpacing: 0,
            title: TextField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              style: const TextStyle(
                fontSize: 22,
              ),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
              ),
            ),
            actions: [
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
              RxBlocBuilder(
                bloc: widget.bloc,
                state: (final bloc) => bloc.category,
                builder: (final context, final categorySnapshot, final _) {
                  final category = categorySnapshot.data ?? '';

                  return IconButton(
                    onPressed: () async {
                      final result = await showDialog<String>(
                        context: context,
                        builder: (final context) => NotesSelectCategoryDialog(
                          bloc: widget.notesBloc,
                          initialCategory: category,
                        ),
                      );
                      if (result != null) {
                        widget.bloc.updateCategory(result);
                      }
                    },
                    icon: Icon(
                      MdiIcons.tag,
                      color: category.isNotEmpty ? NotesCategoryColor.compute(category) : null,
                    ),
                  );
                },
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
