import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

@internal
sealed class UnifiedSearchBloc implements InteractiveBloc {
  factory UnifiedSearchBloc(
    final AppsBloc appsBloc,
    final Account account,
  ) =>
      _UnifiedSearchBloc(
        appsBloc,
        account,
      );

  void search(final String term);

  void enable();

  void disable();

  BehaviorSubject<bool> get enabled;

  BehaviorSubject<Result<Map<core.UnifiedSearchProvider, Result<core.UnifiedSearchResult>>?>> get results;
}

class _UnifiedSearchBloc extends InteractiveBloc implements UnifiedSearchBloc {
  _UnifiedSearchBloc(
    this.appsBloc,
    this.account,
  ) {
    appsBloc.activeApp.listen((final _) {
      if (enabled.value) {
        disable();
      }
    });
  }

  final AppsBloc appsBloc;
  final Account account;
  String term = '';

  @override
  BehaviorSubject<bool> enabled = BehaviorSubject.seeded(false);

  @override
  BehaviorSubject<Result<Map<core.UnifiedSearchProvider, Result<core.UnifiedSearchResult>>?>> results =
      BehaviorSubject.seeded(Result.success(null));

  @override
  void dispose() {
    unawaited(enabled.close());
    unawaited(results.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    if (term.isEmpty) {
      results.add(Result.success(null));
      return;
    }

    try {
      results.add(results.value.asLoading());
      final response = await account.client.core.unifiedSearch.getProviders();
      final providers = response.body.ocs.data;
      results.add(
        Result.success(Map.fromEntries(getLoadingProviders(providers))),
      );
      for (final provider in providers) {
        unawaited(searchProvider(provider));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      results.add(Result.error(e));
    }
  }

  @override
  Future<void> search(final String term) async {
    this.term = term.trim();
    await refresh();
  }

  @override
  void enable() {
    enabled.add(true);
  }

  @override
  void disable() {
    enabled.add(false);
    results.add(Result.success(null));
    term = '';
  }

  Iterable<MapEntry<core.UnifiedSearchProvider, Result<core.UnifiedSearchResult>>> getLoadingProviders(
    final Iterable<core.UnifiedSearchProvider> providers,
  ) sync* {
    for (final provider in providers) {
      yield MapEntry(provider, Result.loading());
    }
  }

  Future<void> searchProvider(final core.UnifiedSearchProvider provider) async {
    updateResults(provider, Result.loading());
    try {
      final response = await account.client.core.unifiedSearch.search(
        providerId: provider.id,
        term: term,
      );
      updateResults(provider, Result.success(response.body.ocs.data));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      updateResults(provider, Result.error(e));
    }
  }

  void updateResults(final core.UnifiedSearchProvider provider, final Result<core.UnifiedSearchResult> result) =>
      results.add(
        Result.success(
          Map.fromEntries(
            sortResults({
              ...?results.value.data,
              provider: result,
            }),
          ),
        ),
      );

  Iterable<MapEntry<core.UnifiedSearchProvider, Result<core.UnifiedSearchResult>>> sortResults(
    final Map<core.UnifiedSearchProvider, Result<core.UnifiedSearchResult>> results,
  ) sync* {
    final activeApp = appsBloc.activeApp.value;

    yield* results.entries
        .where((final entry) => providerMatchesApp(entry.key, activeApp))
        .sorted((final a, final b) => sortEntriesCount(a.value, b.value));
    yield* results.entries
        .whereNot((final entry) => providerMatchesApp(entry.key, activeApp))
        .where((final entry) => hasEntries(entry.value))
        .sorted((final a, final b) => sortEntriesCount(a.value, b.value));
  }

  bool providerMatchesApp(final core.UnifiedSearchProvider provider, final AppImplementation app) =>
      provider.id == app.id || provider.id.startsWith('${app.id}_');

  bool hasEntries(final Result<core.UnifiedSearchResult> result) =>
      !result.hasData || result.requireData.entries.isNotEmpty;

  int sortEntriesCount(final Result<core.UnifiedSearchResult> a, final Result<core.UnifiedSearchResult> b) =>
      (b.data?.entries.length ?? 0).compareTo(a.data?.entries.length ?? 0);
}
