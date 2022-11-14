import 'dart:async';

import 'package:neon/src/apps/notifications/app.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/capabilities.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'apps.rxb.g.dart';

typedef NextcloudApp = CoreNavigationApps_Ocs_Data;

abstract class AppsBlocEvents {
  void refresh();
  void setActiveApp(final String? appID);
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<NextcloudApp>>> get apps;

  BehaviorSubject<Result<List<AppImplementation>>> get appImplementations;

  BehaviorSubject<Result<NotificationsApp?>> get notificationsAppImplementation;

  BehaviorSubject<String?> get activeAppID;
}

@RxBloc()
class AppsBloc extends $AppsBloc {
  AppsBloc(
    this._requestManager,
    this._capabilitiesBloc,
    this._accountsBloc,
    this._account,
    this._allAppImplementations,
  ) {
    _$refreshEvent.listen((final _) => _loadApps);
    _$setActiveAppEvent.listen((final appId) async {
      final data = (await _appImplementationsSubject.firstWhere((final result) => result.data != null)).data!;
      if (data.where((final app) => app.id == appId).isNotEmpty) {
        if (_activeAppSubject.valueOrNull != appId) {
          _activeAppSubject.add(appId);
        }
      } else if (appId == 'notifications') {
        // TODO: Open notifications page
      } else {
        throw Exception('App $appId not found');
      }
    });

    _appsSubject.listen((final result) {
      if (result is ResultLoading) {
        _appImplementationsSubject.add(Result.loading());
      } else if (result is ResultError<List<NextcloudApp>>) {
        _appImplementationsSubject.add(Result.error(result.error));
      } else if (result is ResultSuccess<List<NextcloudApp>>) {
        _appImplementationsSubject.add(
          Result.success(_filteredAppImplementations(result.data.map((final a) => a.id).toList())),
        );
      } else if (result is ResultCached<List<NextcloudApp>>) {
        _appImplementationsSubject.add(
          ResultCached(_filteredAppImplementations(result.data.map((final a) => a.id).toList())),
        );
      }

      final appImplementations = result.data != null
          ? _filteredAppImplementations(result.data!.map((final a) => a.id).toList())
          : <AppImplementation>[];

      if (result.data != null) {
        final options = _accountsBloc.getOptions(_account);
        unawaited(
          options.initialApp.stream.first.then((var initialApp) async {
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
    });

    _capabilitiesBloc.capabilities.listen((final result) {
      if (result is ResultLoading) {
        _notificationsAppImplementationSubject.add(Result.loading());
      } else if (result is ResultError<CoreServerCapabilities_Ocs_Data>) {
        _notificationsAppImplementationSubject.add(Result.error(result.error));
      } else if (result is ResultSuccess<CoreServerCapabilities_Ocs_Data>) {
        _notificationsAppImplementationSubject.add(
          Result.success(
            result.data.capabilities.notifications != null ? _findAppImplementation('notifications') : null,
          ),
        );
      } else if (result is ResultCached<CoreServerCapabilities_Ocs_Data>) {
        _notificationsAppImplementationSubject.add(
          ResultCached(result.data.capabilities.notifications != null ? _findAppImplementation('notifications') : null),
        );
      }
    });

    _loadApps();
  }

  T? _findAppImplementation<T extends AppImplementation>(final String id) {
    final matches = _filteredAppImplementations([id]);
    if (matches.isNotEmpty) {
      return matches.single as T;
    }

    return null;
  }

  List<AppImplementation> _filteredAppImplementations(final List<String> appIds) =>
      _allAppImplementations.where((final a) => appIds.contains(a.id)).toList();

  void _loadApps() {
    _requestManager
        .wrapNextcloud<List<NextcloudApp>, CoreNavigationApps>(
          _account.client.id,
          'apps-apps',
          () async => _account.client.core.getNavigationApps(),
          (final response) => response.ocs.data,
          previousData: _appsSubject.valueOrNull?.data,
        )
        .listen(_appsSubject.add);
  }

  final RequestManager _requestManager;
  final CapabilitiesBloc _capabilitiesBloc;
  final AccountsBloc _accountsBloc;
  final Account _account;
  final List<AppImplementation> _allAppImplementations;

  final _appsSubject = BehaviorSubject<Result<List<NextcloudApp>>>();
  final _appImplementationsSubject = BehaviorSubject<Result<List<AppImplementation>>>();
  final _notificationsAppImplementationSubject = BehaviorSubject<Result<NotificationsApp?>>();
  late final _activeAppSubject = BehaviorSubject<String?>();

  final Map<String, RxBlocBase> _blocs = {};

  T getAppBloc<T extends RxBlocBase>(final AppImplementation appImplementation) {
    if (_blocs[appImplementation.id] != null) {
      return _blocs[appImplementation.id]! as T;
    }

    return _blocs[appImplementation.id] = appImplementation.buildBloc(_account.client) as T;
  }

  @override
  void dispose() {
    unawaited(_appsSubject.close());
    unawaited(_appImplementationsSubject.close());
    unawaited(_notificationsAppImplementationSubject.close());
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
  BehaviorSubject<Result<NotificationsApp?>> _mapToNotificationsAppImplementationState() =>
      _notificationsAppImplementationSubject;

  @override
  BehaviorSubject<String?> _mapToActiveAppIDState() => _activeAppSubject;
}
