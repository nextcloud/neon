import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:files_app/src/blocs/browser.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:files_app/src/options.dart';
import 'package:files_app/src/sort/files.dart';
import 'package:files_app/src/utils/task.dart';
import 'package:files_app/src/widgets/file_list_tile.dart';
import 'package:files_app/src/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart' as webdav;

class FilesBrowserView extends StatefulWidget {
  FilesBrowserView({
    required this.filesBloc,
    required this.uri,
    required this.mode,
    required this.setPath,
    this.mimeFilter = const MimeFilter.files(),
    this.hideUri,
  }) : super(key: Key(uri.toString()));

  final FilesBloc filesBloc;
  final webdav.PathUri uri;
  final FilesBrowserMode mode;
  final void Function(webdav.PathUri uri) setPath;
  final webdav.PathUri? hideUri;
  final MimeFilter mimeFilter;

  @override
  State<FilesBrowserView> createState() => _FilesBrowserViewState();
}

class _FilesBrowserViewState extends State<FilesBrowserView> {
  late final FilesOptions options;
  late final FilesBrowserBloc bloc;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    options = NeonProvider.of<FilesOptions>(context);

    bloc = FilesBrowserBloc(
      filesBloc: widget.filesBloc,
      options: options,
      account: NeonProvider.of<Account>(context),
      uri: widget.uri,
      mode: widget.mode,
      hideUri: widget.hideUri,
      mimeFilter: widget.mimeFilter,
    );

    errorsSubscription = bloc.errors.listen((error) {
      if (mounted) {
        NeonError.showSnackbar(context, error);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());
    bloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.files,
      builder: (context, filesSnapshot) => StreamBuilder(
        stream: widget.filesBloc.tasks,
        builder: (context, tasksSnapshot) => SortBoxBuilder(
          sortBox: filesSortBox,
          sortProperty: options.filesSortPropertyOption,
          sortBoxOrder: options.filesSortBoxOrderOption,
          presort: const {
            (property: FilesSortProperty.isFolder, order: SortBoxOrder.ascending),
          },
          input: filesSnapshot.data?.toList(),
          builder: (context, sorted) {
            final uploadingTaskTiles =
                tasksSnapshot.hasData ? buildUploadTasks(tasksSnapshot.requireData, sorted) : null;

            return NeonListView(
              scrollKey: 'files-${widget.uri.path}',
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                final file = sorted[index];
                final matchingTask = tasksSnapshot.requireData.firstWhereOrNull(
                  (task) => file.name == task.uri.name && widget.uri == task.uri.parent,
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
                  browserBloc: bloc,
                  details: details,
                  setPath: widget.setPath,
                  checkOpenInNeon: () => handleFileInNeon(sorted, file),
                );
              },
              isLoading: filesSnapshot.isLoading,
              error: filesSnapshot.error,
              onRefresh: bloc.refresh,
              topScrollingChildren: [
                FilesBrowserNavigator(
                  uri: widget.uri,
                  bloc: widget.filesBloc,
                  setPath: widget.setPath,
                ),
                ...?uploadingTaskTiles,
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool> handleFileInNeon(List<webdav.WebDavFile> sorted, webdav.WebDavFile file) async {
    final mimeHandler = NeonProvider.of<AppsBloc>(context).mimeTypeHandler(file.mimeType);

    if (mimeHandler != null) {
      await mimeHandler.handle(context, MimeContext(file: file, files: sorted));
      return true;
    }
    return false;
  }

  Iterable<Widget> buildUploadTasks(BuiltList<FilesTask> tasks, List<webdav.WebDavFile> files) sync* {
    for (final task in tasks) {
      if (task is! FilesUploadTask) {
        continue;
      }

      yield FileListTile(
        bloc: widget.filesBloc,
        browserBloc: bloc,
        details: FileDetails.fromUploadTask(
          task: task,
        ),
        setPath: widget.setPath,
      );
    }
  }
}
