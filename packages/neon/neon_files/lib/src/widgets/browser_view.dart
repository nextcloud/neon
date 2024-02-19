import 'package:built_collection/built_collection.dart';
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

class FilesBrowserView extends StatefulWidget {
  const FilesBrowserView({
    required this.bloc,
    required this.filesBloc,
    super.key,
  });

  final FilesBrowserBloc bloc;
  final FilesBloc filesBloc;

  @override
  State<FilesBrowserView> createState() => _FilesBrowserViewState();
}

class _FilesBrowserViewState extends State<FilesBrowserView> {
  @override
  void initState() {
    widget.bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: widget.bloc.uri.distinct(),
        builder: (context, uriSnapshot) {
          if (!uriSnapshot.hasData) {
            return const SizedBox.shrink();
          }
          return BackButtonListener(
            onBackButtonPressed: () async {
              final parent = uriSnapshot.requireData.parent;
              if (parent != null) {
                widget.bloc.setPath(parent);
                return true;
              }
              return false;
            },
            child: ResultListBuilder(
              subject: widget.bloc.files,
              scrollKey: 'files-${uriSnapshot.requireData.path}',
              onRefresh: widget.bloc.refresh,
              topScrollingChildren: [
                FilesBrowserNavigator(
                  uri: uriSnapshot.requireData,
                  bloc: widget.bloc,
                ),
              ],
              builder: (context, files) => SortBoxBuilder(
                sortBox: filesSortBox,
                sortProperty: widget.bloc.options.filesSortPropertyOption,
                sortBoxOrder: widget.bloc.options.filesSortBoxOrderOption,
                presort: const {
                  (property: FilesSortProperty.isFolder, order: SortBoxOrder.ascending),
                },
                input: files.isNotEmpty ? files.sublist(1).toList() : <WebDavFile>[],
                builder: (context, sorted) => StreamBuilder(
                  stream: widget.filesBloc.tasks,
                  builder: (context, tasksSnapshot) {
                    final uploadingTaskTiles = buildUploadTasks(tasksSnapshot.data ?? BuiltList(), sorted).toList();

                    return SliverList.builder(
                      itemCount: uploadingTaskTiles.length + sorted.length,
                      itemBuilder: (context, index) {
                        if (index < uploadingTaskTiles.length) {
                          return uploadingTaskTiles[index];
                        }
                        final file = sorted[index - uploadingTaskTiles.length];
                        final matchingTask = tasksSnapshot.data?.firstWhereOrNull(
                          (task) => file.name == task.uri.name && widget.bloc.uri.value == task.uri.parent,
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
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      );

  Iterable<Widget> buildUploadTasks(BuiltList<FilesTask> tasks, List<WebDavFile> files) sync* {
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
