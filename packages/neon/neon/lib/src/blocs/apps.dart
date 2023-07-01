import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/capabilities.dart';
import 'package:neon/src/interfaces/notifications.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/app_implementation.dart';
import 'package:neon/src/utils/nextcloud_app_specific_options.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

typedef NextcloudApp = CoreNavigationApps_Ocs_Data;

abstract class AppsBlocEvents {
  void setActiveApp(final String appID);
}

abstract class AppsBlocStates {
  BehaviorSubject<Result<List<NextcloudApp>>> get apps;

  BehaviorSubject<Result<Iterable<AppImplementation>>> get appImplementations;

  BehaviorSubject<Result<NotificationsAppInterface?>> get notificationsAppImplementation;

  BehaviorSubject<AppImplementation> get activeApp;

  BehaviorSubject get openNotifications;

  BehaviorSubject<Iterable<(String, Object?)>?> get appVersions;
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
      if (result.hasData) {
        final options = _accountsBloc.getOptionsFor(_account);
        unawaited(
          options.initialApp.stream.first.then((var initialApp) async {
            if (initialApp == null) {
              if (result.requireData.tryFind('files') != null) {
                initialApp = 'files';
              } else if (result.requireData.isNotEmpty) {
                // This should never happen, because the files app is always installed and can not be removed, but just in
                // case this changes at a later point.
                initialApp = result.requireData.first.id;
              }
            }
            if (!activeApp.hasValue && initialApp != null) {
              await setActiveApp(initialApp);
            }
          }),
        );

        unawaited(_checkCompatibility());
      }
    });

    _capabilitiesBloc.capabilities.listen((final result) {
      notificationsAppImplementation.add(
        result.transform(
          (final data) => data.capabilities.notifications != null ? _findAppImplementation('notifications') : null,
        ),
      );

      unawaited(_checkCompatibility());
    });

    unawaited(refresh());
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
          'core' => await _account.client.core.isSupported(capabilities.requireData),
          'news' => await _account.client.news.isSupported(),
          'notes' => await _account.client.notes.isSupported(capabilities.requireData),
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
  BehaviorSubject<List<(String, Object?)>?> appVersions = BehaviorSubject();

  @override
  Future refresh() async {
    await _requestManager.wrapNextcloud<List<NextcloudApp>, CoreNavigationApps>(
      _account.client.id,
      'apps-apps',
      apps,
      () async => _account.client.core.getNavigationApps(),
      (final response) => response.ocs.data.toList(),
    );
  }

  @override
  Future setActiveApp(final String appID) async {
    if (appID == 'notifications') {
      openNotifications.add(null);
      return;
    }

    final apps = await appImplementations.firstWhere((final a) => a.hasData);
    final app = apps.requireData.tryFind(appID);
    if (app != null) {
      if (activeApp.valueOrNull?.id != appID) {
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
