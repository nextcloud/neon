import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:neon/src/apps/files/models/sync_mapping.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:watcher/watcher.dart';

part 'sync.rxb.g.dart';

abstract class FilesSyncBlocEvents {
  void addMapping(final FilesSyncMapping mapping);

  void removeMapping(final FilesSyncMapping mapping);

  void syncMapping(final FilesSyncMapping mapping, final Map<String, SyncConflictSolution> solutions);
}

abstract class FilesSyncBlocStates {
  BehaviorSubject<Map<FilesSyncMapping, bool?>> get mappingStatuses;

  Stream<FilesSyncConflicts> get conflicts;

  Stream<Exception> get errors;
}

@RxBloc()
class FilesSyncBloc extends $FilesSyncBloc {
  FilesSyncBloc(
    this._storage,
    this._accountsBloc,
  ) {
    _$addMappingEvent.listen((final mapping) async {
      _mappingStatusesSubject.add({
        ..._mappingStatusesSubject.value,
        mapping: null,
      });
      await _saveMappings();
      // Directly trigger sync after adding the mapping
      syncMapping(mapping, {});
    });

    _$removeMappingEvent.listen((final mapping) async {
      _mappingStatusesSubject.add(
        Map.fromEntries(
          _mappingStatusesSubject.value.entries.where(
            (final e) =>
                e.key.accountId != mapping.accountId &&
                e.key.localPath != mapping.localPath &&
                e.key.remotePath != mapping.remotePath,
          ),
        ),
      );
      await _saveMappings();
    });

    _$syncMappingEvent.listen((final event) async {
      final account = _accountsBloc.accounts.value.find(event.mapping.accountId);
      if (account == null) {
        removeMapping(event.mapping);
        return;
      }

      // This shouldn't be necessary, but it sadly is because of https://github.com/flutter/flutter/issues/25659.
      // Alternative would be to use https://pub.dev/packages/shared_storage,
      // but to be efficient we'd need https://github.com/alexrintt/shared-storage/issues/91
      // or copy the files to the app cache (which is also not optimal).
      if (Platform.isAndroid && !await Permission.manageExternalStorage.request().isGranted) {
        return;
      }

      try {
        final sources = _sourcesForMapping(account, event.mapping);

        final conflicts = await sync<WebDavFile, FileSystemEntity>(
          sources,
          event.mapping.status,
          event.solutions,
        );
        if (conflicts.isNotEmpty) {
          _conflictsController.add(FilesSyncConflicts(event.mapping, conflicts));
        }

        _mappingStatusesSubject.add(
          Map<FilesSyncMapping, bool?>.fromEntries(
            _mappingStatusesSubject.value.entries.map(
              (final e) => MapEntry(e.key, event.mapping == e.key ? conflicts.isEmpty : e.value),
            ),
          ),
        );
      } catch (e) {
        _errorsStreamController.add(e as Exception);
      }
      await _saveMappings();
    });

    mappingStatuses.listen((final statuses) async {
      for (final mapping in statuses.keys) {
        if (_watchers[mapping] == null) {
          _watchers[mapping] = DirectoryWatcher(mapping.localPath).events.listen(
            (final watchEvent) {
              print('watchEvent: $watchEvent');
            },
          );
        }
      }
      for (final entries in _watchers.entries.toList()) {
        if (statuses[entries.key] == null) {
          await entries.value.cancel();
          _watchers.remove(entries.key);
        }
      }
    });

    _loadMappings();
    unawaited(_syncMappingStatuses());
  }

  void _loadMappings() {
    if (_storage.containsKey(_keyMappings)) {
      _mappingStatusesSubject.add(
        {
          for (final mapping in _storage
              .getStringList(_keyMappings)!
              .map<FilesSyncMapping>((final m) => FilesSyncMapping.fromJson(json.decode(m) as Map<String, dynamic>))
              .toList()) ...{
            mapping: null,
          },
        },
      );
    }
  }

  Future _saveMappings() async {
    await _storage.setStringList(
      _keyMappings,
      _mappingStatusesSubject.value.keys.map((final m) => json.encode(m.toJson())).toList(),
    );
  }

  Future _syncMappingStatuses() async {
    final statuses = <FilesSyncMapping, bool?>{};
    final mappings = _mappingStatusesSubject.value.keys.toList();
    for (final mapping in mappings) {
      final account = _accountsBloc.accounts.value.find(mapping.accountId);
      if (account == null) {
        removeMapping(mapping);
        continue;
      }

      try {
        final sources = _sourcesForMapping(account, mapping);
        final diff = await computeSyncDiff(sources, mapping.status, {});
        statuses[mapping] = diff.actions.isEmpty && diff.conflicts.isEmpty;
      } on Exception catch (e) {
        _errorsStreamController.add(e);
      }
    }
    _mappingStatusesSubject.add(statuses);
  }

  WebDavIOSyncSources _sourcesForMapping(final Account account, final FilesSyncMapping mapping) => WebDavIOSyncSources(
        account.client,
        mapping.remotePath,
        mapping.localPath,
        extraProps: [
          WebDavProps.davLastModified,
          WebDavProps.ncHasPreview,
          WebDavProps.ocSize,
          WebDavProps.ocFavorite,
        ],
      );

  final Storage _storage;
  final AccountsBloc _accountsBloc;

  final _keyMappings = 'mappings';

  final _mappingStatusesSubject = BehaviorSubject<Map<FilesSyncMapping, bool?>>.seeded({});
  final _conflictsController = StreamController<FilesSyncConflicts>();
  final _errorsStreamController = StreamController<Exception>();
  final _watchers = <FilesSyncMapping, StreamSubscription<WatchEvent>>{};

  @override
  void dispose() {
    unawaited(_mappingStatusesSubject.close());
    unawaited(_conflictsController.close());
    unawaited(_errorsStreamController.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Map<FilesSyncMapping, bool?>> _mapToMappingStatusesState() => _mappingStatusesSubject;

  @override
  Stream<FilesSyncConflicts> _mapToConflictsState() => _conflictsController.stream.asBroadcastStream();

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}

class FilesSyncConflicts {
  FilesSyncConflicts(
    this.mapping,
    this.conflicts,
  );

  final FilesSyncMapping mapping;
  final List<SyncConflict<WebDavFile, FileSystemEntity>> conflicts;
}
