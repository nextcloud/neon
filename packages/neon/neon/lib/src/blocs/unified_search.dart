import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/models.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class UnifiedSearchBlocEvents {
  void search(final String term);

  void enable();

  void disable();
}

@internal
abstract interface class UnifiedSearchBlocStates {
  BehaviorSubject<bool> get enabled;

  BehaviorSubject<Result<Map<CoreUnifiedSearchProvider, Result<CoreUnifiedSearchResult>>?>> get results;
}

@internal
class UnifiedSearchBloc extends InteractiveBloc implements UnifiedSearchBlocEvents, UnifiedSearchBlocStates {
  UnifiedSearchBloc(
    this._appsBloc,
    this._account,
  ) {
    _appsBloc.activeApp.listen((final _) {
      if (enabled.value) {
        disable();
      }
    });
  }

  final AppsBloc _appsBloc;
  final Account _account;
  String _term = '';

  @override
  BehaviorSubject<bool> enabled = BehaviorSubject.seeded(false);

  @override
  BehaviorSubject<Result<Map<CoreUnifiedSearchProvider, Result<CoreUnifiedSearchResult>>?>> results =
      BehaviorSubject.seeded(const Result.success(null));

  @override
  void dispose() {
    unawaited(enabled.close());
    unawaited(results.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    await _search();
  }

  @override
  Future<void> search(final String term) async {
    _term = term.trim();
    await _search();
  }

  @override
  void enable() {
    enabled.add(true);
  }

  @override
  void disable() {
    enabled.add(false);
    results.add(const Result.success(null));
    _term = '';
  }

  Future<void> _search() async {
    if (_term.isEmpty) {
      results.add(const Result.success(null));
      return;
    }

    try {
      results.add(results.value.asLoading());
      final response = await _account.client.core.unifiedSearch.getProviders();
      final providers = response.body.ocs.data;
      results.add(
        Result.success(Map.fromEntries(_getLoadingProviders(providers))),
      );
      for (final provider in providers) {
        unawaited(_searchProvider(provider));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      results.add(Result.error(e));
    }
  }

  Iterable<MapEntry<CoreUnifiedSearchProvider, Result<CoreUnifiedSearchResult>>> _getLoadingProviders(
    final Iterable<CoreUnifiedSearchProvider> providers,
  ) sync* {
    for (final provider in providers) {
      yield MapEntry(provider, const Result.loading());
    }
  }

  Future<void> _searchProvider(final CoreUnifiedSearchProvider provider) async {
    _updateResults(provider, const Result.loading());
    try {
      final response = await _account.client.core.unifiedSearch.search(
        providerId: provider.id,
        term: _term,
      );
      _updateResults(provider, Result.success(response.body.ocs.data));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      _updateResults(provider, Result.error(e));
    }
  }

  void _updateResults(final CoreUnifiedSearchProvider provider, final Result<CoreUnifiedSearchResult> result) =>
      results.add(
        Result.success(
          Map.fromEntries(
            _sortResults({
              ...?results.value.data,
              provider: result,
            }),
          ),
        ),
      );

  Iterable<MapEntry<CoreUnifiedSearchProvider, Result<CoreUnifiedSearchResult>>> _sortResults(
    final Map<CoreUnifiedSearchProvider, Result<CoreUnifiedSearchResult>> results,
  ) sync* {
    final activeApp = _appsBloc.activeApp.value;

    yield* results.entries
        .where((final entry) => _providerMatchesApp(entry.key, activeApp))
        .sorted((final a, final b) => _sortEntriesCount(a.value, b.value));
    yield* results.entries
        .whereNot((final entry) => _providerMatchesApp(entry.key, activeApp))
        .where((final entry) => _hasEntries(entry.value))
        .sorted((final a, final b) => _sortEntriesCount(a.value, b.value));
  }

  bool _providerMatchesApp(final CoreUnifiedSearchProvider provider, final AppImplementation app) =>
      provider.id == app.id || provider.id.startsWith('${app.id}_');

  bool _hasEntries(final Result<CoreUnifiedSearchResult> result) =>
      !result.hasData || result.requireData.entries.isNotEmpty;

  int _sortEntriesCount(final Result<CoreUnifiedSearchResult> a, final Result<CoreUnifiedSearchResult> b) =>
      (b.data?.entries.length ?? 0).compareTo(a.data?.entries.length ?? 0);
}
