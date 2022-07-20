part of '../app.dart';

class FilesSyncConflictDialog extends StatefulWidget {
  const FilesSyncConflictDialog({
    required this.bloc,
    required this.conflicts,
    super.key,
  });

  final FilesBloc bloc;
  final FilesSyncConflicts conflicts;

  @override
  State<FilesSyncConflictDialog> createState() => _FilesSyncConflictDialogState();
}

class _FilesSyncConflictDialogState extends State<FilesSyncConflictDialog> {
  var _all = false;
  SyncConflictSolution? _allSolution;

  var _index = 0;
  final _solutions = <String, SyncConflictSolution>{};

  final visualDensity = const VisualDensity(
    horizontal: -4,
    vertical: -4,
  );

  @override
  Widget build(final BuildContext context) {
    final conflict = widget.conflicts.conflicts[_index];
    return AlertDialog(
      title: Text(AppLocalizations.of(context).filesSyncNConflicts(widget.conflicts.conflicts.length)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.conflicts.conflicts.length > 1) ...[
            CheckboxListTile(
              visualDensity: visualDensity,
              value: _all,
              onChanged: (final value) {
                setState(() {
                  _all = value!;
                });
              },
              title: Text(AppLocalizations.of(context).filesSyncForAllConflicts),
            ),
            const Divider(),
          ],
          if (_all) ...[
            ...<String, SyncConflictSolution>{
              AppLocalizations.of(context).filesSyncLocal: SyncConflictSolution.overwriteA,
              AppLocalizations.of(context).filesSyncRemote: SyncConflictSolution.overwriteB,
              AppLocalizations.of(context).filesSyncSkip: SyncConflictSolution.skip,
            }.entries.map(
                  (final e) => ListTile(
                    visualDensity: visualDensity,
                    title: Text(
                      e.key,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Radio<SyncConflictSolution>(
                      value: e.value,
                      groupValue: _allSolution,
                      onChanged: (final solution) {
                        setState(() {
                          _allSolution = solution!;
                        });
                      },
                    ),
                  ),
                ),
          ] else ...[
            Text(
              conflict.id,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Builder(
              builder: (final context) {
                final file = conflict.objectB.data;
                final stat = file.statSync();
                return FilesFileTile(
                  visualDensity: visualDensity,
                  filesBloc: widget.bloc,
                  titleOverride: Text(AppLocalizations.of(context).filesSyncLocal),
                  details: FilesFileDetails(
                    path: conflict.id.split('/'),
                    isDirectory: file is Directory,
                    size: stat.size,
                    etag: '',
                    mimeType: '',
                    lastModified: stat.modified,
                    hasPreview: false,
                    isFavorite: false,
                  ),
                  onTap: (final details) {
                    setState(() {
                      _solutions[conflict.id] = SyncConflictSolution.overwriteA;
                    });
                  },
                  trailing: Radio<SyncConflictSolution>(
                    value: SyncConflictSolution.overwriteA,
                    groupValue: _solutions[conflict.id],
                    onChanged: (final solution) {
                      setState(() {
                        _solutions[conflict.id] = solution!;
                      });
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (final context) {
                final file = conflict.objectA.data;
                return FilesFileTile(
                  visualDensity: visualDensity,
                  filesBloc: widget.bloc,
                  titleOverride: Text(AppLocalizations.of(context).filesSyncRemote),
                  details: FilesFileDetails(
                    path: conflict.id.split('/'),
                    isDirectory: file.isDirectory,
                    size: file.size!,
                    etag: '',
                    mimeType: file.mimeType,
                    lastModified: file.lastModified!,
                    hasPreview: file.hasPreview,
                    isFavorite: conflict.objectA.data.favorite,
                  ),
                  onTap: (final details) {
                    setState(() {
                      _solutions[conflict.id] = SyncConflictSolution.overwriteB;
                    });
                  },
                  trailing: Radio<SyncConflictSolution>(
                    value: SyncConflictSolution.overwriteB,
                    groupValue: _solutions[conflict.id],
                    onChanged: (final solution) {
                      setState(() {
                        _solutions[conflict.id] = solution!;
                      });
                    },
                  ),
                );
              },
            ),
            ListTile(
              visualDensity: visualDensity,
              title: Text(AppLocalizations.of(context).filesSyncSkip),
              leading: const SizedBox(
                height: 40,
                width: 40,
              ),
              onTap: () {
                setState(() {
                  _solutions[conflict.id] = SyncConflictSolution.skip;
                });
              },
              trailing: Radio<SyncConflictSolution>(
                value: SyncConflictSolution.skip,
                groupValue: _solutions[conflict.id],
                onChanged: (final solution) {
                  setState(() {
                    _solutions[conflict.id] = solution!;
                  });
                },
              ),
            ),
          ],
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        if (_index > 0 && !_all) ...[
          OutlinedButton(
            onPressed: () {
              setState(() {
                _index--;
              });
            },
            child: Text(AppLocalizations.of(context).previous),
          ),
        ] else ...[
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).cancel),
          ),
        ],
        if (_index < widget.conflicts.conflicts.length - 1 && !_all) ...[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _index++;
              });
            },
            child: Text(AppLocalizations.of(context).next),
          ),
        ] else ...[
          ElevatedButton(
            onPressed: () {
              if (_all && _allSolution == null) {
                return;
              }
              if (!_all && _solutions.length != widget.conflicts.conflicts.length) {
                return;
              }
              Navigator.of(context).pop(_all ? _allSolution : _solutions);
            },
            child: Text(AppLocalizations.of(context).finish),
          ),
        ],
      ],
    );
  }
}
