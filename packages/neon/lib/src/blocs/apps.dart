part of '../neon.dart';

typedef NextcloudApp = NextcloudCoreNavigationApps_Ocs_Data;

abstract class AppsBlocEvents {
  void setActiveApp(final String? appID);
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<NextcloudApp>>> get apps;

  BehaviorSubject<Result<List<AppImplementation>>> get appImplementations;

  BehaviorSubject<Result<NotificationsApp?>> get notificationsAppImplementation;

  BehaviorSubject<String?> get activeAppID;

  BehaviorSubject get openNotifications;
}

class AppsBloc extends InteractiveBloc implements AppsBlocEvents, AppsBlocStates {
  AppsBloc(
    this._requestManager,
    this._capabilitiesBloc,
    this._accountsBloc,
    this._account,
    this._allAppImplementations,
  ) {
    apps.listen((final result) {
      appImplementations
          .add(result.transform((final data) => _filteredAppImplementations(data.map((final a) => a.id).toList())));
    });

    appImplementations.listen((final result) {
      if (result.data != null) {
        final options = _accountsBloc.getOptions(_account);
        unawaited(
          options.initialApp.stream.first.then((var initialApp) async {
            if (initialApp == null) {
              if (result.data!.where((final a) => a.id == 'files').isNotEmpty) {
                initialApp = 'files';
              } else if (result.data!.isNotEmpty) {
                // This should never happen, because the files app is always installed and can not be removed, but just in
                // case this changes at a later point.
                initialApp = result.data![0].id;
              }
            }
            if (!activeAppID.hasValue) {
              await setActiveApp(initialApp);
            }
          }),
        );
      }
    });

    _capabilitiesBloc.capabilities.listen((final result) {
      notificationsAppImplementation.add(
        result.transform(
          (final data) => data.capabilities.notifications != null ? _findAppImplementation('notifications') : null,
        ),
      );
    });

    unawaited(refresh());
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

  final RequestManager _requestManager;
  final CapabilitiesBloc _capabilitiesBloc;
  final AccountsBloc _accountsBloc;
  final Account _account;
  final List<AppImplementation> _allAppImplementations;

  final Map<String, Bloc> _blocs = {};

  @override
  void dispose() {
    unawaited(apps.close());
    unawaited(appImplementations.close());
    unawaited(notificationsAppImplementation.close());
    unawaited(activeAppID.close());
    unawaited(openNotifications.close());
    for (final key in _blocs.keys) {
      _blocs[key]!.dispose();
    }
  }

  @override
  BehaviorSubject<String?> activeAppID = BehaviorSubject<String?>();

  @override
  BehaviorSubject<Result<List<AppImplementation<Bloc, NextcloudAppSpecificOptions>>>> appImplementations =
      BehaviorSubject<Result<List<AppImplementation>>>();

  @override
  BehaviorSubject<Result<List<NextcloudApp>>> apps = BehaviorSubject<Result<List<NextcloudApp>>>();

  @override
  BehaviorSubject<Result<NotificationsApp?>> notificationsAppImplementation =
      BehaviorSubject<Result<NotificationsApp?>>();

  @override
  BehaviorSubject openNotifications = BehaviorSubject();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<List<NextcloudApp>, NextcloudCoreNavigationApps>(
      _account.client.id,
      'apps-apps',
      apps,
      () async => _account.client.core.getNavigationApps(),
      (final response) => response.ocs.data.toList(),
    );
  }

  @override
  Future setActiveApp(final String? appID) async {
    if ((await appImplementations.firstWhere((final a) => a.data != null))
        .data!
        .where((final app) => app.id == appID)
        .isNotEmpty) {
      if (activeAppID.valueOrNull != appID) {
        activeAppID.add(appID);
      }
    } else if (appID == 'notifications') {
      openNotifications.add(null);
    } else {
      throw Exception('App $appID not found');
    }
  }

  T getAppBloc<T extends Bloc>(final AppImplementation appImplementation) {
    if (_blocs[appImplementation.id] != null) {
      return _blocs[appImplementation.id]! as T;
    }

    return _blocs[appImplementation.id] = appImplementation.buildBloc(_account.client) as T;
  }
}
