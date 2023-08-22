import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/capabilities.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_ids.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/models/notifications_interface.dart';
import 'package:neon/src/settings/models/nextcloud_app_options.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

abstract class AppsBlocEvents {
  /// Sets the active app using the [appID].
  ///
  /// If the app is already the active app nothing will happen.
  /// When using [skipAlreadySet] nothing will be done if there already is an active app.
  void setActiveApp(final String appID, {final bool skipAlreadySet = false});
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<CoreNavigationEntry>>> get apps;

  BehaviorSubject<Result<Iterable<AppImplementation>>> get appImplementations;

  BehaviorSubject<Result<NotificationsAppInterface?>> get notificationsAppImplementation;

  BehaviorSubject<AppImplementation> get activeApp;

  BehaviorSubject get openNotifications;

  BehaviorSubject<Iterable<(String, Object?)>?> get appVersions;
}

@internal
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

    appImplementations.listen((final result) async {
      if (!result.hasData) {
        return;
      }

      final options = _accountsBloc.getOptionsFor(_account);
      final initialApp = options.initialApp.value ?? _getInitialAppFallback();
      if (initialApp != null) {
        await setActiveApp(initialApp, skipAlreadySet: true);
      }

      unawaited(_checkCompatibility());
    });

    _capabilitiesBloc.capabilities.listen((final result) {
      notificationsAppImplementation.add(
        result.transform(
          (final data) => data.capabilities.notificationsCapabilities?.notifications != null
              ? _findAppImplementation(AppIDs.notifications)
              : null,
        ),
      );

      unawaited(_checkCompatibility());
    });

    unawaited(refresh());
  }

  /// Determines the appid of initial app.
  ///
  /// It requires [appImplementations] to have both a value and data.
  ///
  /// The files app is always installed and can not be removed so it will be used, but in the
  /// case this changes at a later point the first supported app will be returned.
  ///
  /// Returns null when no app is supported by the server.
  String? _getInitialAppFallback() {
    final supportedApps = appImplementations.value.requireData;
    if (supportedApps.tryFind(AppIDs.files) != null) {
      return AppIDs.files;
    } else if (supportedApps.isNotEmpty) {
      return supportedApps.first.id;
    }

    return null;
  }

  Future<void> _checkCompatibility() async {
    final apps = appImplementations.valueOrNull;
    final capabilities = _capabilitiesBloc.capabilities.valueOrNull;

    // ignore cached data
    if (capabilities == null || apps == null || !capabilities.hasUncachedData || !apps.hasUncachedData) {
      return;
    }

    final appIds = {
      'core',
      ...apps.requireData.map((final a) => a.id),
    };

    final notSupported = <(String, Object?)>[];

    for (final id in appIds) {
      try {
        final (supported, minVersion) = switch (id) {
          'core' => _account.client.core.isSupported(capabilities.requireData),
          AppIDs.news => await _account.client.news.isSupported(),
          AppIDs.notes => _account.client.notes.isSupported(capabilities.requireData),
          _ => (true, null),
        };

        if (!supported) {
          notSupported.add((id, minVersion));
        }
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }

    if (notSupported.isNotEmpty) {
      appVersions.add(notSupported);
    }
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
    unawaited(activeApp.close());
    unawaited(openNotifications.close());
    unawaited(appVersions.close());

    for (final app in _allAppImplementations) {
      for (final bloc in app.blocs.values) {
        bloc.dispose();
      }
    }
  }

  @override
  BehaviorSubject<AppImplementation> activeApp = BehaviorSubject<AppImplementation>();

  @override
  BehaviorSubject<Result<Iterable<AppImplementation<Bloc, NextcloudAppOptions>>>> appImplementations =
      BehaviorSubject<Result<Iterable<AppImplementation>>>();

  @override
  BehaviorSubject<Result<List<CoreNavigationEntry>>> apps = BehaviorSubject<Result<List<CoreNavigationEntry>>>();

  @override
  BehaviorSubject<Result<NotificationsAppInterface?>> notificationsAppImplementation =
      BehaviorSubject<Result<NotificationsAppInterface?>>();

  @override
  BehaviorSubject openNotifications = BehaviorSubject();

  @override
  BehaviorSubject<List<(String, Object?)>?> appVersions = BehaviorSubject();

  @override
  Future refresh() async {
    await _requestManager
        .wrapNextcloud<List<CoreNavigationEntry>, CoreNavigationGetAppsNavigationResponse200ApplicationJson>(
      _account.id,
      'apps-apps',
      apps,
      () async => _account.client.core.navigation.getAppsNavigation(),
      (final response) => response.ocs.data.toList(),
    );
  }

  @override
  Future setActiveApp(final String appID, {final bool skipAlreadySet = false}) async {
    if (appID == AppIDs.notifications) {
      openNotifications.add(null);
      return;
    }

    final apps = await appImplementations.firstWhere((final a) => a.hasData);
    final app = apps.requireData.tryFind(appID);
    if (app != null) {
      if ((!activeApp.hasValue || !skipAlreadySet) && activeApp.valueOrNull?.id != appID) {
        activeApp.add(app);
      }
    } else {
      throw Exception('App $appID not found');
    }
  }

  T getAppBloc<T extends Bloc>(final AppImplementation<T, dynamic> appImplementation) =>
      appImplementation.getBloc(_account);

  List<Provider> get appBlocProviders =>
      _allAppImplementations.map((final appImplementation) => appImplementation.blocProvider).toList();
}
