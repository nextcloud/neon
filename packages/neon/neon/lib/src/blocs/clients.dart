import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/capabilities.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:neon/src/models/notifications_interface.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class ClientsBlocEvents {
  /// Sets the active client using the [clientID].
  ///
  /// If the client is already the active client nothing will happen.
  /// When using [skipAlreadySet] nothing will be done if there already is an active client.
  void setActiveClient(final String clientID, {final bool skipAlreadySet = false});
}

@internal
abstract interface class ClientsBlocStates {
  BehaviorSubject<Result<Iterable<ClientImplementation>>> get clientImplementations;

  BehaviorSubject<Result<NotificationsClientInterface?>> get notificationsClientImplementation;

  BehaviorSubject<ClientImplementation> get activeClient;

  BehaviorSubject<void> get openNotifications;

  BehaviorSubject<Map<String, String?>> get clientVersions;
}

@internal
class ClientsBloc extends InteractiveBloc implements ClientsBlocEvents, ClientsBlocStates {
  ClientsBloc(
    this._capabilitiesBloc,
    this._accountsBloc,
    this._account,
    this._allClientImplementations,
  ) {
    _clients.listen((final result) {
      clientImplementations
          .add(result.transform((final data) => _filteredClientImplementations(data.map((final c) => c.id))));
    });

    clientImplementations.listen((final result) async {
      if (!result.hasData) {
        return;
      }

      // dispose unsupported clients
      for (final client in _allClientImplementations) {
        if (result.requireData.tryFind(client.id) == null) {
          client.blocsCache.remove(_account);
        }
      }

      final options = _accountsBloc.getOptionsFor(_account);
      final initialClient = options.initialClient.value ?? _getInitialClientFallback();
      if (initialClient != null) {
        await setActiveClient(initialClient, skipAlreadySet: true);
      }

      unawaited(_checkCompatibility());
    });

    _capabilitiesBloc.capabilities.listen((final result) {
      notificationsClientImplementation.add(
        result.transform(
          (final data) => data.capabilities.notificationsCapabilities?.notifications != null
              ? _findClientImplementation(AppIDs.notifications)
              : null,
        ),
      );

      unawaited(_checkCompatibility());
    });

    unawaited(refresh());
  }

  /// Determines the clientid of initial client.
  ///
  /// It requires [clientImplementations] to have both a value and data.
  ///
  /// The files client is always installed and can not be removed so it will be used, but in the
  /// case this changes at a later point the first supported client will be returned.
  ///
  /// Returns null when no client is supported by the server.
  String? _getInitialClientFallback() {
    final supportedClients = clientImplementations.value.requireData;

    for (final fallback in {AppIDs.dashboard, AppIDs.files}) {
      if (supportedClients.tryFind(fallback) != null) {
        return fallback;
      }
    }

    if (supportedClients.isNotEmpty) {
      return supportedClients.first.id;
    }

    return null;
  }

  Future<void> _checkCompatibility() async {
    final clients = clientImplementations.valueOrNull;
    final capabilities = _capabilitiesBloc.capabilities.valueOrNull;

    // ignore cached data
    if (capabilities == null || clients == null || !capabilities.hasUncachedData || !clients.hasUncachedData) {
      return;
    }

    final notSupported = <String, String?>{};

    try {
      final (coreSupported, coreMinimumVersion) = _account.client.core.isSupported(capabilities.requireData);
      if (!coreSupported) {
        notSupported['core'] = coreMinimumVersion.toString();
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }

    for (final client in clients.requireData) {
      try {
        final (supported, minimumVersion) = await client.isSupported(_account, capabilities.requireData);
        if (!(supported ?? true)) {
          notSupported[client.id] = minimumVersion;
        }
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }

    if (notSupported.isNotEmpty) {
      clientVersions.add(notSupported);
    }
  }

  T? _findClientImplementation<T extends ClientImplementation>(final String id) {
    final matches = _filteredClientImplementations([id]);
    if (matches.isNotEmpty) {
      return matches.single as T;
    }

    return null;
  }

  Iterable<ClientImplementation> _filteredClientImplementations(final Iterable<String> clientIds) =>
      _allClientImplementations.where((final c) => clientIds.contains(c.id));

  final CapabilitiesBloc _capabilitiesBloc;
  final AccountsBloc _accountsBloc;
  final Account _account;
  final Iterable<ClientImplementation> _allClientImplementations;
  final _clients = BehaviorSubject<Result<List<core.NavigationEntry>>>();

  @override
  void dispose() {
    unawaited(_clients.close());
    unawaited(clientImplementations.close());
    unawaited(notificationsClientImplementation.close());
    unawaited(activeClient.close());
    unawaited(openNotifications.close());
    unawaited(clientVersions.close());

    super.dispose();
  }

  @override
  BehaviorSubject<ClientImplementation> activeClient = BehaviorSubject();

  @override
  BehaviorSubject<Result<Iterable<ClientImplementation<Bloc, NextcloudClientOptions>>>> clientImplementations =
      BehaviorSubject();

  @override
  BehaviorSubject<Result<NotificationsClientInterface?>> notificationsClientImplementation = BehaviorSubject();

  @override
  BehaviorSubject<void> openNotifications = BehaviorSubject();

  @override
  BehaviorSubject<Map<String, String?>> clientVersions = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      _account.id,
      'apps-apps',
      _clients,
      _account.client.core.navigation.getAppsNavigationRaw(),
      (final response) => response.body.ocs.data.toList(),
    );
  }

  @override
  Future<void> setActiveClient(final String clientID, {final bool skipAlreadySet = false}) async {
    if (clientID == AppIDs.notifications) {
      openNotifications.add(null);
      return;
    }

    final clients = await clientImplementations.firstWhere((final c) => c.hasData);
    final client = clients.requireData.tryFind(clientID);
    if (client != null) {
      if ((!activeClient.hasValue || !skipAlreadySet) && activeClient.valueOrNull?.id != clientID) {
        activeClient.add(client);
      }
    } else {
      throw Exception('Client $clientID not found');
    }
  }

  T getClientBloc<T extends Bloc>(final ClientImplementation<T, dynamic> clientImplementation) =>
      clientImplementation.getBloc(_account);

  List<Provider<Bloc>> get clientBlocProviders =>
      _allClientImplementations.map((final clientImplementation) => clientImplementation.blocProvider).toList();
}
