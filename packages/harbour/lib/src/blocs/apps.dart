import 'package:harbour/src/harbour.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'apps.rxb.g.dart';

typedef NextcloudApp = CoreNavigationAppsOcsDataInner;

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
      if (data.where((final app) => app.id == appId).isNotEmpty) {
        _activeAppSubject.add(appId);
      }
    });

    _appsSubject.listen((final result) {
      if (result is ResultLoading) {
        _appImplementationsSubject.add(Result.loading());
      } else if (result is ResultError) {
        _appImplementationsSubject.add(Result.error((result as ResultError).error));
      } else if (result is ResultSuccess) {
        _appImplementationsSubject.add(
          Result.success(_getMatchingAppImplementations((result as ResultSuccess<List<NextcloudApp>>).data)),
        );
      } else if (result is ResultCached && result.data != null) {
        _appImplementationsSubject.add(
          Result.success(_getMatchingAppImplementations((result as ResultCached<List<NextcloudApp>>).data)),
        );
      }

      final matchingApps = result.data != null ? _getMatchingApps(result.data!) : <NextcloudApp>[];
      final options = _accountsBloc.getOptions(_account)!..updateApps(matchingApps);

      if (result.data != null) {
        // ignore: discarded_futures
        options.initialApp.stream.first.then((var initialApp) {
          if (initialApp == null) {
            if (matchingApps.where((final app) => app.id == 'files').isNotEmpty) {
              initialApp = 'files';
            } else if (matchingApps.isNotEmpty) {
              // This should never happen, because the files app is always installed and can not be removed, but just in
              // case this changes at a later point.
              initialApp = matchingApps[0].id;
            }
          }
          if (!_activeAppSubject.hasValue) {
            setActiveApp(initialApp);
          }
        });
      }
    });

    _loadApps();
  }

  // This implementation could be easier, but we want to keep the apps in order
  List<AppImplementation> _getMatchingAppImplementations(final List<NextcloudApp> apps) => apps
      .map((final a) => _allAppImplementations.where((final b) => b.id == a.id))
      .reduce((final value, final element) => [...value, ...element])
      .toList();

  List<NextcloudApp> _getMatchingApps(final List<NextcloudApp> apps) =>
      apps.where((final a) => _allAppImplementations.where((final b) => b.id == a.id).isNotEmpty).toList();

  void _loadApps() {
    _requestManager
        .wrapNextcloud<List<NextcloudApp>, CoreNavigationApps, void, NextcloudCoreClient>(
          _account.client.id,
          _account.client.core,
          'apps-apps',
          () async => (await _account.client.core.getNavigationApps())!,
          (final response) => response.ocs!.data,
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

  @override
  void dispose() {
    // ignore: discarded_futures
    _appsSubject.close();
    // ignore: discarded_futures
    _activeAppSubject.close();
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
