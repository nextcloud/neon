part of '../../../neon.dart';

class FilesSyncListener extends StatefulWidget {
  const FilesSyncListener({
    required this.appsBloc,
    super.key,
  });

  final AppsBloc appsBloc;

  @override
  State<FilesSyncListener> createState() => _FilesSyncListenerState();
}

class _FilesSyncListenerState extends State<FilesSyncListener> {
  @override
  void initState() {
    super.initState();

    final filesSyncBloc = RxBlocProvider.of<FilesSyncBloc>(context);
    filesSyncBloc.errors.listen((final error) {
      ExceptionWidget.showSnackbar(context, error);
    });
    filesSyncBloc.conflicts.listen((final conflicts) async {
      if (mounted) {
        final result = await showDialog(
          context: context,
          builder: (final context) => FilesSyncConflictDialog(
            bloc: widget.appsBloc.getAppBlocByID('files'),
            conflicts: conflicts,
          ),
        );
        if (result == null) {
          return;
        }
        if (result is Map<String, SyncConflictSolution>) {
          filesSyncBloc.syncMapping(conflicts.mapping, result);
        } else if (result is SyncConflictSolution) {
          filesSyncBloc.syncMapping(
            conflicts.mapping,
            {
              for (final c in conflicts.conflicts) ...{
                c.id: result,
              },
            },
          );
        }
      }
    });
  }

  @override
  Widget build(final BuildContext context) => Container();
}
