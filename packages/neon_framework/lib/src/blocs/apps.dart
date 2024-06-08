import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/app_implementation.dart';
import 'package:neon_framework/src/utils/account_options.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// The Bloc responsible for managing the [AppImplementation]s.
@sealed
abstract class AppsBloc implements InteractiveBloc {
  /// Create a new apps bloc.
  @internal
  factory AppsBloc({
    required BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilitiesSubject,
    required Account account,
    required AccountOptions accountOptions,
    required BuiltSet<AppImplementation> allAppImplementations,
  }) = _AppsBloc;

  /// Sets the active app using the [appID].
  ///
  /// If the app is already the active app nothing will happen.
  /// When using [skipAlreadySet] nothing will be done if there already is an active app.
  void setActiveApp(String appID, {bool skipAlreadySet = false});

  /// A collection of clients used in the app drawer.
  BehaviorSubject<Result<BuiltSet<AppImplementation>>> get appImplementations;

  /// The currently active app.
  BehaviorSubject<AppImplementation> get activeApp;

  /// A collection of apps and their version checks.
  BehaviorSubject<BuiltMap<String, VersionCheck>> get appVersionChecks;

  /// A collection of unsupported apps and their minimum required version.
  BehaviorSubject<BuiltMap<String, VersionCheck>> get unsupportedApps;

  /// Returns the active [Bloc] for the given [appImplementation].
  ///
  /// If no bloc exists yet a new one will be instantiated and cached in [AppImplementation.blocsCache].
  T getAppBloc<T extends Bloc>(AppImplementation<T, dynamic> appImplementation);

  /// Returns the active [Bloc] for every registered [AppImplementation] wrapped in a Provider.
  List<Provider<Bloc>> get appBlocProviders;
}

/// Implementation of [AppsBloc].
class _AppsBloc extends InteractiveBloc implements AppsBloc {
  /// Creates a new apps bloc.
  _AppsBloc({
    required this.capabilitiesSubject,
    required this.account,
    required this.accountOptions,
    required this.allAppImplementations,
  }) {
    apps.listen((result) {
      unawaited(updateApps());
    });

    capabilitiesSubscription = capabilitiesSubject.listen((result) {
      unawaited(updateApps());
    });

    appImplementations.listen((result) {
      if (result.hasData) {
        accountOptions.updateAppImplementations(result.requireData);
      }
    });

    appVersionChecks.listen((checks) {
      unsupportedApps.add(
        checks.rebuild((b) {
          b.removeWhere((app, check) => check.isSupported);
        }),
      );
    });

    unawaited(refresh());
  }

  @override
  final log = Logger('AppsBloc');

  /// Disposes all unsupported apps, sets the active app and checks the app compatibility.
  ///
  /// Blocs of apps that are no longer present on the server are disposed.
  Future<void> updateApps() async {
    final appsResult = apps.valueOrNull;
    final capabilitiesResult = capabilitiesSubject.valueOrNull;

    final appImplementationsBuilder = SetBuilder<AppImplementation>();
    if (appsResult != null && appsResult.hasData) {
      for (final entry in appsResult.requireData) {
        for (final app in allAppImplementations) {
          if (app.id == entry.id || (app.additionalMatchingIDs?.contains(entry.id) ?? false)) {
            appImplementationsBuilder.add(app);
            break;
          }
        }
      }
    }

    if (capabilitiesResult != null && capabilitiesResult.hasData) {
      final notificationsCapabilities =
          capabilitiesResult.requireData.capabilities.notificationsCapabilities?.notifications;
      if (notificationsCapabilities != null) {
        final notificationsApp = allAppImplementations.firstWhereOrNull((a) => a.id == AppIDs.notifications);
        if (notificationsApp != null) {
          appImplementationsBuilder.add(notificationsApp);
        }
      }
    }

    appImplementations.add(
      Result(
        appImplementationsBuilder.build(),
        appsResult?.error ?? capabilitiesResult?.error,
        isLoading: (appsResult?.isLoading ?? false) || (capabilitiesResult?.isLoading ?? false),
        isCached: (appsResult?.isCached ?? false) || (capabilitiesResult?.isCached ?? false),
      ),
    );

    if (appsResult == null || !appsResult.hasData || capabilitiesResult == null || !capabilitiesResult.hasData) {
      return;
    }

    // dispose unsupported apps
    if (appImplementations.hasValue && appImplementations.value.hasSuccessfulData) {
      for (final app in allAppImplementations) {
        if (appImplementations.value.data?.tryFind(app.id) == null) {
          app.blocsCache.remove(account);
        }
      }
    }

    final initialApp = getInitialAppFallback();
    if (initialApp != null) {
      await setActiveApp(
        initialApp,
        skipAlreadySet: true,
      );
    }

    await checkCompatibility();
  }

  /// Determines the appid of initial app.
  ///
  /// First the user selected initial app is checked, then the dashboard app and as the last one the files app.
  /// If none of those apps are installed, the first supported one will be returned.
  /// Returns null when no app is supported by the server.
  String? getInitialAppFallback() {
    final supportedApps = appImplementations.valueOrNull?.data;
    if (supportedApps == null) {
      return null;
    }

    for (final fallback in {accountOptions.initialApp.value, AppIDs.dashboard, AppIDs.files}) {
      if (supportedApps.tryFind(fallback) != null) {
        return fallback;
      }
    }

    if (supportedApps.isNotEmpty) {
      return supportedApps.first.id;
    }

    return null;
  }

  Future<void> checkCompatibility() async {
    final apps = appImplementations.valueOrNull;
    final capabilities = capabilitiesSubject.valueOrNull;

    // ignore cached data
    if (capabilities == null || apps == null || !capabilities.hasSuccessfulData || !apps.hasSuccessfulData) {
      return;
    }

    final checks = MapBuilder<String, VersionCheck>();

    checks['core'] = account.client.core.getVersionCheck(capabilities.requireData);

    for (final app in apps.requireData) {
      try {
        final check = await app.getVersionCheck(account, capabilities.requireData);

        if (check == null) {
          continue;
        }

        checks[app.id] = check;
      } on Exception catch (error, stackTrace) {
        log.warning(
          'An Exception occurred while checking the installed version of $app.',
          error,
          stackTrace,
        );
      }
    }

    appVersionChecks.add(checks.build());
  }

  final BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilitiesSubject;
  late final StreamSubscription<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>>
      capabilitiesSubscription;
  final Account account;
  final AccountOptions accountOptions;
  final BuiltSet<AppImplementation> allAppImplementations;
  final apps = BehaviorSubject<Result<BuiltList<core.NavigationEntry>>>();

  @override
  void dispose() {
    unawaited(capabilitiesSubscription.cancel());
    unawaited(apps.close());
    unawaited(appImplementations.close());
    unawaited(activeApp.close());
    unawaited(appVersionChecks.close());
    unawaited(unsupportedApps.close());

    super.dispose();
  }

  @override
  final activeApp = BehaviorSubject();

  @override
  final appImplementations = BehaviorSubject();

  @override
  final appVersionChecks = BehaviorSubject();

  @override
  final unsupportedApps = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'apps-apps',
      subject: apps,
      getRequest: account.client.core.navigation.$getAppsNavigation_Request,
      serializer: account.client.core.navigation.$getAppsNavigation_Serializer(),
      unwrap: (response) => response.body.ocs.data.rebuild(
        (b) => b..sort((a, b) => (a.getOrder()).compareTo(b.getOrder())),
      ),
    );
  }

  @override
  Future<void> setActiveApp(String appID, {bool skipAlreadySet = false}) async {
    if (activeApp.valueOrNull?.id == appID) {
      return;
    }

    final apps = await appImplementations.firstWhere((a) => a.hasData);
    final app = apps.requireData.find(appID);

    // Only override the current active app in case it is not yet set, not supported or explicitly requested
    if (!activeApp.hasValue || !skipAlreadySet || apps.requireData.tryFind(activeApp.value.id) == null) {
      activeApp.add(app);
    }
  }

  // coverage:ignore-start
  @override
  T getAppBloc<T extends Bloc>(AppImplementation<T, dynamic> appImplementation) => appImplementation.getBloc(account);

  @override
  List<Provider<Bloc>> get appBlocProviders =>
      allAppImplementations.map((appImplementation) => appImplementation.blocProvider).toList();
  // coverage:ignore-end
}

extension _NavigationEntryOrder on core.NavigationEntry {
  int getOrder() => order.$int ?? int.parse(order.string!);
}
