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
          builder: (final context, final pathSnapshot) => StreamBuilder<List<UploadTask>>(
            stream: widget.filesBloc.uploadTasks,
            builder: (final context, final uploadTasksSnapshot) => StreamBuilder<List<DownloadTask>>(
              stream: widget.filesBloc.downloadTasks,
              builder: (final context, final downloadTasksSnapshot) => !pathSnapshot.hasData ||
                      !uploadTasksSnapshot.hasData ||
                      !downloadTasksSnapshot.hasData
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
                            for (final uploadTask in sorted == null
                                ? <UploadTask>[]
                                : uploadTasksSnapshot.requireData.where(
                                    (final task) =>
                                        sorted.where((final file) => _pathMatchesFile(task.path, file.name)).isEmpty,
                                  )) ...[
                              StreamBuilder<int>(
                                stream: uploadTask.progress,
                                builder: (final context, final uploadTaskProgressSnapshot) =>
                                    !uploadTaskProgressSnapshot.hasData
                                        ? const SizedBox()
                                        : FileListTile(
                                            context: context,
                                            details: FileDetails(
                                              path: uploadTask.path,
                                              isDirectory: false,
                                              size: uploadTask.size,
                                              etag: null,
                                              mimeType: null,
                                              lastModified: uploadTask.lastModified,
                                              hasPreview: null,
                                              isFavorite: null,
                                            ),
                                            uploadProgress: uploadTaskProgressSnapshot.data,
                                            downloadProgress: null,
                                            enableFileActions: widget.enableFileActions,
                                            onPickFile: widget.onPickFile,
                                          ),
                              ),
                            ],
                            if (sorted != null) ...[
                              for (final file in sorted) ...[
                                if (!widget.onlyShowDirectories || file.isDirectory) ...[
                                  Builder(
                                    builder: (final context) {
                                      final matchingUploadTasks = uploadTasksSnapshot.requireData
                                          .where((final task) => _pathMatchesFile(task.path, file.name));
                                      final matchingDownloadTasks = downloadTasksSnapshot.requireData
                                          .where((final task) => _pathMatchesFile(task.path, file.name));

                                      return StreamBuilder<int?>(
                                        stream:
                                            matchingUploadTasks.isNotEmpty ? matchingUploadTasks.first.progress : null,
                                        builder: (final context, final uploadTaskProgressSnapshot) =>
                                            StreamBuilder<int?>(
                                          stream: matchingDownloadTasks.isNotEmpty
                                              ? matchingDownloadTasks.first.progress
                                              : null,
                                          builder: (final context, final downloadTaskProgressSnapshot) => FileListTile(
                                            context: context,
                                            details: FileDetails(
                                              path: [...widget.bloc.path.value, file.name],
                                              isDirectory: matchingUploadTasks.isEmpty && file.isDirectory,
                                              size: matchingUploadTasks.isNotEmpty
                                                  ? matchingUploadTasks.first.size
                                                  : file.size,
                                              etag: matchingUploadTasks.isNotEmpty ? null : file.etag,
                                              mimeType: matchingUploadTasks.isNotEmpty ? null : file.mimeType,
                                              lastModified: matchingUploadTasks.isNotEmpty
                                                  ? matchingUploadTasks.first.lastModified
                                                  : file.lastModified,
                                              hasPreview: matchingUploadTasks.isNotEmpty ? null : file.hasPreview,
                                              isFavorite: matchingUploadTasks.isNotEmpty ? null : file.favorite,
                                            ),
                                            uploadProgress: uploadTaskProgressSnapshot.data,
                                            downloadProgress: downloadTaskProgressSnapshot.data,
                                            enableFileActions: widget.enableFileActions,
                                            onPickFile: widget.onPickFile,
                                          ),
                                        ),
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
        ),
      );

  bool _pathMatchesFile(final List<String> path, final String name) => const ListEquality().equals(
        [...widget.bloc.path.value, name],
        path,
      );
}
