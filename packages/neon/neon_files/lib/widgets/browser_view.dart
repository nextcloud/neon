part of '../neon_files.dart';

class FilesBrowserView extends StatefulWidget {
  const FilesBrowserView({
    required this.bloc,
    required this.filesBloc,
    this.onPickFile,
    this.enableFileActions = true,
    this.onlyShowDirectories = false,
    super.key,
    // ignore: prefer_asserts_with_message
  }) : assert((onPickFile == null) == onlyShowDirectories);

  final FilesBrowserBloc bloc;
  final FilesBloc filesBloc;
  final Function(FileDetails)? onPickFile;
  final bool enableFileActions;
  final bool onlyShowDirectories;

  @override
  State<FilesBrowserView> createState() => _FilesBrowserViewState();
}

class _FilesBrowserViewState extends State<FilesBrowserView> {
  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<WebDavFile>>.behaviorSubject(
        stream: widget.bloc.files,
        builder: (final context, final files) => StreamBuilder<List<String>>(
          stream: widget.bloc.path,
          builder: (final context, final pathSnapshot) => StreamBuilder<List<FilesTask>>(
            stream: widget.filesBloc.tasks,
            builder: (final context, final tasksSnapshot) => !pathSnapshot.hasData || !tasksSnapshot.hasData
                ? const SizedBox()
                : BackButtonListener(
                    onBackButtonPressed: () async {
                      final path = pathSnapshot.requireData;
                      if (path.isNotEmpty) {
                        widget.bloc.setPath(path.sublist(0, path.length - 1));
                        return true;
                      }
                      return false;
                    },
                    child: SortBoxBuilder<FilesSortProperty, WebDavFile>(
                      sortBox: filesSortBox,
                      sortPropertyOption: widget.bloc.options.filesSortPropertyOption,
                      sortBoxOrderOption: widget.bloc.options.filesSortBoxOrderOption,
                      input: files.data,
                      builder: (final context, final sorted) => NeonListView<Widget>(
                        scrollKey: 'files-${pathSnapshot.requireData.join('/')}',
                        withFloatingActionButton: true,
                        items: [
                          for (final uploadTask in tasksSnapshot.requireData.whereType<FilesUploadTask>().where(
                                (final task) =>
                                    sorted?.where((final file) => _pathMatchesFile(task.path, file.name)).isEmpty ??
                                    false,
                              )) ...[
                            FileListTile(
                              context: context,
                              details: FileDetails.fromUploadTask(
                                task: uploadTask,
                              ),
                              enableFileActions: widget.enableFileActions,
                              onPickFile: widget.onPickFile,
                            ),
                          ],
                          if (sorted != null) ...[
                            for (final file in sorted) ...[
                              if (!widget.onlyShowDirectories || file.isDirectory) ...[
                                Builder(
                                  builder: (final context) {
                                    final matchingTask = tasksSnapshot.requireData
                                        .firstWhereOrNull((final task) => _pathMatchesFile(task.path, file.name));

                                    final details = matchingTask != null
                                        ? FileDetails.fromTask(
                                            task: matchingTask,
                                            file: file,
                                          )
                                        : FileDetails.fromWebDav(
                                            file: file,
                                            path: widget.bloc.path.value,
                                          );

                                    return FileListTile(
                                      context: context,
                                      details: details,
                                      enableFileActions: widget.enableFileActions,
                                      onPickFile: widget.onPickFile,
                                    );
                                  },
                                ),
                              ],
                            ],
                          ],
                        ],
                        isLoading: files.isLoading,
                        error: files.error,
                        onRefresh: widget.bloc.refresh,
                        builder: (final context, final widget) => widget,
                        topScrollingChildren: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    tooltip: AppLocalizations.of(context).goToPath(''),
                                    icon: const Icon(
                                      Icons.house,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      widget.bloc.setPath([]);
                                    },
                                  ),
                                  for (var i = 0; i < pathSnapshot.requireData.length; i++) ...[
                                    Builder(
                                      builder: (final context) {
                                        final path = pathSnapshot.requireData.sublist(0, i + 1);
                                        return Tooltip(
                                          message: AppLocalizations.of(context).goToPath(path.join('/')),
                                          excludeFromSemantics: true,
                                          child: TextButton(
                                            onPressed: () {
                                              widget.bloc.setPath(path);
                                            },
                                            child: Text(
                                              pathSnapshot.requireData[i],
                                              semanticsLabel: AppLocalizations.of(context).goToPath(path.join('/')),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ]
                                    .intersperse(
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      );

  bool _pathMatchesFile(final List<String> path, final String name) => const ListEquality().equals(
        [...widget.bloc.path.value, name],
        path,
      );
}
