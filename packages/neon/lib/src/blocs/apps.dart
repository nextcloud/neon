import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'apps.rxb.g.dart';

typedef NextcloudApp = CoreNavigationAppsOcsData;

abstract class AppsBlocEvents {
  void refresh();
  void setActiveApp(final String? appID);
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<NextcloudApp>>> get apps;

  BehaviorSubject<Result<List<AppImplementation>>> get appImplementations;

  BehaviorSubject<String?> get activeAppID;
}

@RxBloc()
class AppsBloc extends $AppsBloc {
  AppsBloc(
    this._requestManager,
    this._accountsBloc,
    this._account,
    this._allAppImplementations,
  ) {
    _$refreshEvent.listen((final _) => _loadApps);
    _$setActiveAppEvent.listen((final appId) async {
      final data = (await _appImplementationsSubject.firstWhere((final result) => result.data != null)).data!;
      if (data.where((final app) => app.id == appId).isNotEmpty && _activeAppSubject.valueOrNull != appId) {
        _activeAppSubject.add(appId);
      } else {
        debugPrint('App $appId not found');
      }
    });

    _appsSubject.listen((final result) {
      if (result is ResultLoading) {
        _appImplementationsSubject.add(Result.loading());
      } else if (result is ResultError) {
        _appImplementationsSubject.add(Result.error((result as ResultError).error));
      } else if (result is ResultSuccess) {
        _appImplementationsSubject.add(
          Result.success(_filteredAppImplementations((result as ResultSuccess<List<NextcloudApp>>).data)),
        );
      } else if (result is ResultCached && result.data != null) {
        _appImplementationsSubject.add(
          ResultCached(_filteredAppImplementations((result as ResultCached<List<NextcloudApp>>).data)),
        );
      }

      final appImplementations =
          result.data != null ? _filteredAppImplementations(result.data!) : <AppImplementation>[];

      if (result.data != null) {
        if (_accountsBloc.pushNotificationApp != null) {
          setActiveApp(_accountsBloc.pushNotificationApp);
          _accountsBloc.pushNotificationApp = null;
        } else {
          final options = _accountsBloc.getOptions(_account)!..updateApps(appImplementations);
          unawaited(
            options.initialApp.stream.first.then((var initialApp) {
              if (initialApp == null) {
                if (appImplementations.where((final a) => a.id == 'files').isNotEmpty) {
                  initialApp = 'files';
                } else if (appImplementations.isNotEmpty) {
                  // This should never happen, because the files app is always installed and can not be removed, but just in
                  // case this changes at a later point.
                  initialApp = appImplementations[0].id;
                }
              }
              if (!_activeAppSubject.hasValue) {
                setActiveApp(initialApp);
              }
            }),
          );
        }
      }
    });

    _loadApps();
  }

  final _extraApps = ['notifications'];

  List<AppImplementation> _filteredAppImplementations(final List<NextcloudApp> apps) {
    final appIds = apps.map((final a) => a.id).toList();
    return _allAppImplementations.where((final a) => appIds.contains(a.id) || _extraApps.contains(a.id)).toList();
  }

  void _loadApps() {
    _requestManager
        .wrapNextcloud<List<NextcloudApp>, CoreNavigationApps>(
          _account.client.id,
          'apps-apps',
          () async => _account.client.core.getNavigationApps(),
          (final response) => response.ocs!.data!,
          preloadCache: true,
        )
        .listen(_appsSubject.add);
  }

  final RequestManager _requestManager;
  final AccountsBloc _accountsBloc;
  final Account _account;
  final List<AppImplementation> _allAppImplementations;

  final _appsSubject = BehaviorSubject<Result<List<NextcloudApp>>>();
  final _appImplementationsSubject = BehaviorSubject<Result<List<AppImplementation>>>();
  late final _activeAppSubject = BehaviorSubject<String?>();

  final Map<AppImplementation, RxBlocBase> _blocs = {};

  T getAppBloc<T extends RxBlocBase>(final AppImplementation appImplementation) {
    if (_blocs[appImplementation] != null) {
      return _blocs[appImplementation]! as T;
    }

    final bloc = appImplementation.buildBloc(_account.client);
    _blocs[appImplementation] = bloc;

    return bloc as T;
  }

  T getAppBlocByID<T extends RxBlocBase>(final String id) =>
      getAppBloc(_appImplementationsSubject.value.data!.singleWhere((final app) => app.id == id));

  @override
  void dispose() {
    unawaited(_appsSubject.close());
    unawaited(_activeAppSubject.close());
    for (final key in _blocs.keys) {
      _blocs[key]!.dispose();
    }
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NextcloudApp>>> _mapToAppsState() => _appsSubject;

  @override
  BehaviorSubject<Result<List<AppImplementation<RxBlocBase, NextcloudAppSpecificOptions>>>>
      _mapToAppImplementationsState() => _appImplementationsSubject;

  @override
  BehaviorSubject<String?> _mapToActiveAppIDState() => _activeAppSubject;
}
