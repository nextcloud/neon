part of '../neon_files.dart';

/// Mode to operate the [FilesBrowserView] in.
enum FilesBrowserMode {
  /// Default file browser mode.
  ///
  /// When a file is selected it will be opened or downloaded.
  browser,

  /// Select directory.
  selectDirectory,

  /// Don't show file actions.
  noActions,
}

class FilesBrowserView extends StatefulWidget {
  const FilesBrowserView({
    required this.bloc,
    required this.filesBloc,
    this.mode = FilesBrowserMode.browser,
    super.key,
  });

  final FilesBrowserBloc bloc;
  final FilesBloc filesBloc;
  final FilesBrowserMode mode;

  @override
  State<FilesBrowserView> createState() => _FilesBrowserViewState();
}

class _FilesBrowserViewState extends State<FilesBrowserView> {
  @override
  void initState() {
    widget.bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });

    super.initState();
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
                      presort: const {
                        (FilesSortProperty.isFolder, SortBoxOrder.ascending),
                      },
                      input: files.data,
                      builder: (final context, final sorted) => ValueListenableBuilder(
                        valueListenable: widget.bloc.options.showHiddenFilesOption,
                        builder: (final context, final showHiddenFiles, final _) => NeonListView<Widget>(
                          scrollKey: 'files-${pathSnapshot.requireData.join('/')}',
                          withFloatingActionButton: true,
                          items: [
                            for (final uploadTask in tasksSnapshot.requireData.whereType<FilesUploadTask>().where(
                                  (final task) =>
                                      sorted.where((final file) => _pathMatchesFile(task.path, file.name)).isEmpty,
                                ))
                              FileListTile(
                                bloc: widget.filesBloc,
                                browserBloc: widget.bloc,
                                details: FileDetails.fromUploadTask(
                                  task: uploadTask,
                                ),
                                mode: widget.mode,
                              ),
                            for (final file in sorted)
                              if ((widget.mode != FilesBrowserMode.selectDirectory || file.isDirectory) &&
                                  (!file.isHidden || showHiddenFiles))
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
                                      bloc: widget.filesBloc,
                                      browserBloc: widget.bloc,
                                      details: details,
                                      mode: widget.mode,
                                    );
                                  },
                                ),
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
                                    for (var i = 0; i < pathSnapshot.requireData.length; i++)
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
        ),
      );

  bool _pathMatchesFile(final List<String> path, final String name) => const ListEquality().equals(
        [...widget.bloc.path.value, name],
        path,
      );
}
