part of 'blocs.dart';

typedef NextcloudApp = NextcloudCoreNavigationApps_Ocs_Data;

abstract class AppsBlocEvents {
  void setActiveApp(final String? appID);
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<NextcloudApp>>> get apps;

  BehaviorSubject<Result<Iterable<AppImplementation>>> get appImplementations;

  BehaviorSubject<Result<NotificationsAppInterface?>> get notificationsAppImplementation;

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
          .add(result.transform((final data) => _filteredAppImplementations(data.map((final a) => a.id))));
    });

    appImplementations.listen((final result) {
      if (result.data != null) {
        final options = _accountsBloc.getOptionsFor(_account);
        unawaited(
          options.initialApp.stream.first.then((var initialApp) async {
            if (initialApp == null) {
              if (result.data!.find('files') != null) {
                initialApp = 'files';
              } else if (result.data!.isNotEmpty) {
                // This should never happen, because the files app is always installed and can not be removed, but just in
                // case this changes at a later point.
                initialApp = result.data!.first.id;
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

  Iterable<AppImplementation> _filteredAppImplementations(final Iterable<String> appIds) =>
      _allAppImplementations.where((final a) => appIds.contains(a.id));

  final RequestManager _requestManager;
  final CapabilitiesBloc _capabilitiesBloc;
  final AccountsBloc _accountsBloc;
  final Account _account;
  final Iterable<AppImplementation> _allAppImplementations;

  @override
  void dispose() {
    unawaited(apps.close());
    unawaited(appImplementations.close());
    unawaited(notificationsAppImplementation.close());
    unawaited(activeAppID.close());
    unawaited(openNotifications.close());

    for (final app in _allAppImplementations) {
      for (final bloc in app.blocs.values) {
        bloc.dispose();
      }
    }
  }

  @override
  BehaviorSubject<String?> activeAppID = BehaviorSubject<String?>();

  @override
  BehaviorSubject<Result<Iterable<AppImplementation<Bloc, NextcloudAppSpecificOptions>>>> appImplementations =
      BehaviorSubject<Result<Iterable<AppImplementation>>>();

  @override
  BehaviorSubject<Result<List<NextcloudApp>>> apps = BehaviorSubject<Result<List<NextcloudApp>>>();

  @override
  BehaviorSubject<Result<NotificationsAppInterface?>> notificationsAppImplementation =
      BehaviorSubject<Result<NotificationsAppInterface?>>();

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
    if (appID != null && (await appImplementations.firstWhere((final a) => a.data != null)).data!.find(appID) != null) {
      if (activeAppID.valueOrNull != appID) {
        activeAppID.add(appID);
      }
    } else if (appID == 'notifications') {
      openNotifications.add(null);
    } else {
      throw Exception('App $appID not found');
    }
  }

  T getAppBloc<T extends Bloc>(final AppImplementation<T, dynamic> appImplementation) =>
      appImplementation.getBloc(_account);

  List<Provider> get appBlocProviders =>
      _allAppImplementations.map((final appImplementation) => appImplementation.blocProvider).toList();
}
