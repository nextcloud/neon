import 'dart:async';
import 'dart:convert';

import 'package:account_repository/account_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/app_implementation.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/storage_manager.dart';
import 'package:neon_framework/src/sync/models/conflicts.dart';
import 'package:neon_framework/src/sync/models/implementation.dart';
import 'package:neon_framework/src/sync/models/mapping.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/sync_mapping_options.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synchronize/synchronize.dart';

sealed class SyncBloc implements InteractiveBloc {
  factory SyncBloc(
    AccountsBloc accountsBloc,
    Iterable<AppImplementation> appImplementations,
  ) =>
      _SyncBloc(
        accountsBloc,
        appImplementations,
      );

  /// Adds a new [mapping] that will be synced.
  Future<void> addMapping(SyncMapping<dynamic, dynamic> mapping);

  /// Removes an existing [mapping] that will no longer be synced.
  Future<void> removeMapping(SyncMapping<dynamic, dynamic> mapping);

  /// Explicitly trigger a sync for the [mapping].
  /// [solutions] can be use to apply solutions for conflicts.
  Future<void> syncMapping(
    SyncMapping<dynamic, dynamic> mapping, {
    Map<String, SyncConflictSolution> solutions = const {},
  });

  /// Map of [SyncMapping]s and their [SyncMappingStatus]es
  BehaviorSubject<Map<SyncMapping<dynamic, dynamic>, SyncMappingStatus>> get mappingStatuses;

  /// Stream of conflicts that have arisen during syncing.
  Stream<SyncConflicts<dynamic, dynamic>> get conflicts;

  SyncMappingOptions getSyncMappingOptionsFor(SyncMapping<dynamic, dynamic> mapping);
}

class _SyncBloc extends InteractiveBloc implements SyncBloc {
  _SyncBloc(
    this.accountsBloc,
    Iterable<AppImplementation> appImplementations,
  ) {
    _syncImplementations = appImplementations.map((app) => app.syncImplementation).whereNotNull();
    _timer = TimerBloc().registerTimer(const Duration(minutes: 1), refresh);

    _loadMappings();
    mappingStatuses.value.keys.forEach(_watchMapping);
    unawaited(refresh());
  }

  @override
  final log = Logger('SyncBloc');

  final AccountsBloc accountsBloc;
  static final _storage = NeonStorage().singleValueStore(StorageKeys.sync);
  late final Iterable<SyncImplementation<SyncMapping<dynamic, dynamic>, dynamic, dynamic>> _syncImplementations;
  late final NeonTimer _timer;
  final _conflictsController = StreamController<SyncConflicts<dynamic, dynamic>>();
  final _watchControllers = <String, StreamController<void>>{};
  final _syncMappingOptions = <String, SyncMappingOptions>{};

  @override
  void dispose() {
    _timer.cancel();
    for (final options in _syncMappingOptions.values) {
      options.dispose();
    }
    for (final mapping in mappingStatuses.value.keys) {
      mapping.dispose();
    }
    unawaited(mappingStatuses.close());
    for (final controller in _watchControllers.values) {
      unawaited(controller.close());
    }
    unawaited(_conflictsController.close());

    super.dispose();
  }

  @override
  late final Stream<SyncConflicts<dynamic, dynamic>> conflicts = _conflictsController.stream.asBroadcastStream();

  @override
  final BehaviorSubject<Map<SyncMapping<dynamic, dynamic>, SyncMappingStatus>> mappingStatuses = BehaviorSubject();

  @override
  Future<void> refresh() async {
    for (final mapping in mappingStatuses.value.keys) {
      await _updateMapping(mapping);
    }
  }

  @override
  Future<void> addMapping(SyncMapping<dynamic, dynamic> mapping) async {
    debugPrint('Adding mapping: $mapping');
    mappingStatuses.add({
      ...mappingStatuses.value,
      mapping: SyncMappingStatus.unknown,
    });
    await _saveMappings();
    // Directly trigger sync after adding the mapping
    await syncMapping(mapping);
    // And start watching for local or remote changes
    _watchMapping(mapping);
  }

  @override
  Future<void> removeMapping(SyncMapping<dynamic, dynamic> mapping) async {
    debugPrint('Removing mapping: $mapping');
    mappingStatuses.add(Map.fromEntries(mappingStatuses.value.entries.where((m) => m.key != mapping)));
    mapping.dispose();
    await _saveMappings();
  }

  @override
  Future<void> syncMapping(
    SyncMapping<dynamic, dynamic> mapping, {
    Map<String, SyncConflictSolution> solutions = const {},
  }) async {
    debugPrint('Syncing mapping: $mapping');
    mappingStatuses.add({
      ...mappingStatuses.value,
      mapping: SyncMappingStatus.incomplete,
    });

    final account = accountsBloc.accountByID(mapping.accountId);
    if (account == null) {
      await removeMapping(mapping);
      return;
    }

    try {
      final implementation = _syncImplementations.find(mapping.appId);
      final sources = await implementation.getSources(account, mapping);

      final diff = await computeSyncDiff(
        sources,
        mapping.journal,
        conflictSolutions: solutions,
        keepSkipsAsConflicts: true,
      );
      debugPrint('Journal: ${mapping.journal}');
      debugPrint('Conflicts: ${diff.conflicts}');
      debugPrint('Actions: ${diff.actions}');

      if (diff.conflicts.isNotEmpty && diff.conflicts.whereNot((conflict) => conflict.skipped).isNotEmpty) {
        _conflictsController.add(
          SyncConflicts<dynamic, dynamic>(
            account,
            implementation,
            mapping,
            diff.conflicts,
          ),
        );
      }

      await executeSyncDiff(sources, mapping.journal, diff);

      mappingStatuses.add({
        ...mappingStatuses.value,
        mapping: diff.conflicts.isEmpty ? SyncMappingStatus.complete : SyncMappingStatus.incomplete,
      });
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      addError(e);
    }

    // Save after syncing even if an error occurred
    await _saveMappings();
  }

  Future<void> _updateMapping(SyncMapping<dynamic, dynamic> mapping) async {
    final account = accountsBloc.accountByID(mapping.accountId);
    if (account == null) {
      await removeMapping(mapping);
      return;
    }

    final options = getSyncMappingOptionsFor(mapping);
    if (options.automaticSync.value) {
      await syncMapping(mapping);
    } else {
      try {
        final status = await _getMappingStatus(account, mapping);
        mappingStatuses.add({
          ...mappingStatuses.value,
          mapping: status,
        });
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        addError(e);
      }
    }
  }

  Future<SyncMappingStatus> _getMappingStatus(
    Account account,
    SyncMapping<dynamic, dynamic> mapping,
  ) async {
    final implementation = _syncImplementations.find(mapping.appId);
    final sources = await implementation.getSources(account, mapping);
    final diff = await computeSyncDiff(sources, mapping.journal);
    return diff.actions.isEmpty && diff.conflicts.isEmpty ? SyncMappingStatus.complete : SyncMappingStatus.incomplete;
  }

  void _loadMappings() {
    debugPrint('Loading mappings');
    final loadedMappings = <SyncMapping<dynamic, dynamic>>[];

    final value = _storage.getString();
    if (value != null && value.isNotEmpty) {
      final serializedMappings = (json.decode(value) as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, (value as List).map((e) => e as Map<String, dynamic>)));

      for (final mapping in serializedMappings.entries) {
        final syncImplementation = _syncImplementations.tryFind(mapping.key);
        if (syncImplementation == null) {
          continue;
        }

        for (final serializedMapping in mapping.value) {
          loadedMappings.add(syncImplementation.deserializeMapping(serializedMapping));
        }
      }
    }

    mappingStatuses.add({
      for (final mapping in loadedMappings) mapping: SyncMappingStatus.unknown,
    });
  }

  Future<void> _saveMappings() async {
    debugPrint('Saving mappings');
    final serializedMappings = <String, List<Map<String, dynamic>>>{};

    for (final mapping in mappingStatuses.value.keys) {
      final syncImplementation = _syncImplementations.find(mapping.appId);
      serializedMappings[mapping.appId] ??= [];
      serializedMappings[mapping.appId]!.add(syncImplementation.serializeMapping(mapping));
    }

    await _storage.setString(json.encode(serializedMappings));
  }

  void _watchMapping(SyncMapping<dynamic, dynamic> mapping) {
    final syncImplementation = _syncImplementations.find(mapping.appId);
    if (_watchControllers.containsKey(syncImplementation.getMappingId(mapping))) {
      return;
    }

    // ignore: close_sinks
    final controller = StreamController<void>();
    // Debounce is required to stop bulk operations flooding the sync and potentially creating race conditions.
    controller.stream.debounceTime(const Duration(seconds: 1)).listen((_) async {
      await _updateMapping(mapping);
    });

    _watchControllers[syncImplementation.getMappingId(mapping)] = controller;

    mapping.watch(() {
      controller.add(null);
    });
  }

  @override
  SyncMappingOptions getSyncMappingOptionsFor(SyncMapping<dynamic, dynamic> mapping) {
    final syncImplementation = _syncImplementations.find(mapping.appId);
    final id = syncImplementation.getGlobalUniqueMappingId(mapping);
    return _syncMappingOptions[id] ??= SyncMappingOptions(
      NeonStorage().settingsStore(StorageKeys.sync, id),
    );
  }
}
