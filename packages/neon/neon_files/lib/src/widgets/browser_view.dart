import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:neon_files/src/blocs/browser.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/models/file_details.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_files/src/sort/files.dart';
import 'package:neon_files/src/utils/task.dart';
import 'package:neon_files/src/widgets/file_list_tile.dart';
import 'package:neon_files/src/widgets/navigator.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart';

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
      NeonError.showSnackbar(context, error);
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<WebDavFile>>.behaviorSubject(
        subject: widget.bloc.files,
        builder: (final context, final filesSnapshot) => StreamBuilder<PathUri>(
          stream: widget.bloc.uri,
          builder: (final context, final uriSnapshot) => StreamBuilder<List<FilesTask>>(
            stream: widget.filesBloc.tasks,
            builder: (final context, final tasksSnapshot) {
              if (!uriSnapshot.hasData || !tasksSnapshot.hasData) {
                return const SizedBox();
              }
              return ValueListenableBuilder(
                valueListenable: widget.bloc.options.showHiddenFilesOption,
                builder: (final context, final showHiddenFiles, final _) {
                  final files = filesSnapshot.data?.where((final file) {
                    var hideFile = false;
                    if (widget.mode == FilesBrowserMode.selectDirectory && !file.isDirectory) {
                      hideFile = true;
                    }
                    if (!showHiddenFiles && file.isHidden) {
                      hideFile = true;
                    }

                    return !hideFile;
                  }).toList();

                  return BackButtonListener(
                    onBackButtonPressed: () async {
                      final parent = uriSnapshot.requireData.parent;
                      if (parent != null) {
                        widget.bloc.setPath(parent);
                        return true;
                      }
                      return false;
                    },
                    child: SortBoxBuilder<FilesSortProperty, WebDavFile>(
                      sortBox: filesSortBox,
                      sortProperty: widget.bloc.options.filesSortPropertyOption,
                      sortBoxOrder: widget.bloc.options.filesSortBoxOrderOption,
                      presort: const {
                        (property: FilesSortProperty.isFolder, order: SortBoxOrder.ascending),
                      },
                      input: files,
                      builder: (final context, final sorted) {
                        final uploadingTaskTiles = buildUploadTasks(tasksSnapshot.requireData, sorted);

                        return NeonListView(
                          scrollKey: 'files-${uriSnapshot.requireData.path}',
                          itemCount: sorted.length,
                          itemBuilder: (final context, final index) {
                            final file = sorted[index];
                            final matchingTask = tasksSnapshot.requireData.firstWhereOrNull(
                              (final task) => file.name == task.uri.name && widget.bloc.uri.value == task.uri.parent,
                            );

                            final details = matchingTask != null
                                ? FileDetails.fromTask(
                                    task: matchingTask,
                                    file: file,
                                  )
                                : FileDetails.fromWebDav(
                                    file: file,
                                  );

                            return FileListTile(
                              bloc: widget.filesBloc,
                              browserBloc: widget.bloc,
                              details: details,
                              mode: widget.mode,
                            );
                          },
                          isLoading: filesSnapshot.isLoading,
                          error: filesSnapshot.error,
                          onRefresh: widget.bloc.refresh,
                          topScrollingChildren: [
                            FilesBrowserNavigator(
                              uri: uriSnapshot.requireData,
                              bloc: widget.bloc,
                            ),
                            ...uploadingTaskTiles,
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

  Iterable<Widget> buildUploadTasks(final List<FilesTask> tasks, final List<WebDavFile> files) sync* {
    for (final task in tasks) {
      if (task is! FilesUploadTask) {
        continue;
      }

      yield FileListTile(
        bloc: widget.filesBloc,
        browserBloc: widget.bloc,
        details: FileDetails.fromUploadTask(
          task: task,
        ),
      );
    }
  }
}
