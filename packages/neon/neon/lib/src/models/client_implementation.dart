import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/account_cache.dart';
import 'package:neon/src/models/disposable.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vector_graphics/vector_graphics.dart';

@immutable
abstract class ClientImplementation<T extends Bloc, R extends NextcloudClientOptions> implements Disposable {
  String get id;
  LocalizationsDelegate<Object> get localizationsDelegate;
  Iterable<Locale> get supportedLocales;

  String nameFromLocalization(final NeonLocalizations localizations) => localizations.clientImplementationName(id);
  String name(final BuildContext context) => nameFromLocalization(NeonLocalizations.of(context));

  @protected
  late final ClientStorage storage = ClientStorage(StorageKeys.clients, id);

  @mustBeOverridden
  R get options;

  /// Checks if the client is supported on the server of the [account].
  ///
  /// A `supported` value of `null` means that it can not be known if the client is supported.
  /// This is the case for clients that depend on the server version like files and we assume that the client is supported.
  /// The server support is handled differently.
  ///
  /// The first value of the record is the supported status and the second value is the supported minimum version.
  FutureOr<(bool? supported, String? minimumVersion)> isSupported(
    final Account account,
    final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  );

  final blocsCache = AccountCache<T>();

  T getBloc(final Account account) => blocsCache[account] ??= buildBloc(account);

  @protected
  T buildBloc(final Account account);

  Provider<T> get blocProvider => Provider<T>(
        create: (final context) {
          final accountsBloc = NeonProvider.of<AccountsBloc>(context);
          final account = accountsBloc.activeAccount.value!;

          return getBloc(account);
        },
      );

  BehaviorSubject<int>? getUnreadCounter(final T bloc) => null;

  Widget get page;

  NeonNavigationDestination destination(final BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final account = accountsBloc.activeAccount.value!;
    final bloc = getBloc(account);

    return NeonNavigationDestination(
      label: name(context),
      icon: buildIcon,
      notificationCount: getUnreadCounter(bloc),
    );
  }

  /// Main branch displayed in the home page.
  ///
  /// There's usually no need to override this.
  StatefulShellBranch get mainBranch => StatefulShellBranch(
        routes: [
          route,
        ],
      );

  /// Route for the client.
  ///
  /// All pages of the client must be specified as subroutes.
  /// If this is not [GoRoute] an initial route name must be specified by overriding [initialRouteName].
  RouteBase get route;

  /// Name of the initial route for this client.
  ///
  /// Subclasses that don't provide a [GoRoute] for [route] must override this.
  String get initialRouteName {
    final route = this.route;

    if (route is GoRoute && route.name != null) {
      return route.name!;
    }

    throw FlutterError('No name for the initial route provided.');
  }

  Widget buildIcon({
    final double? size,
    final Color? color,
  }) =>
      Builder(
        builder: (final context) {
          final realSize = size ?? IconTheme.of(context).size;
          return VectorGraphic(
            width: realSize,
            height: realSize,
            colorFilter: ColorFilter.mode(color ?? Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            loader: AssetBytesLoader(
              'assets/app.svg.vec',
              packageName: 'neon_$id',
            ),
            semanticsLabel: NeonLocalizations.of(context).nextcloudLogo,
          );
        },
      );

  @override
  @mustCallSuper
  void dispose() {
    options.dispose();
    blocsCache.dispose();
  }

  /// A custom theme that will be injected into the widget tree.
  ///
  /// You can later access it through `Theme.of(context).extension<ThemeName>()`.
  final ThemeExtension? theme = null;

  @override
  bool operator ==(final Object other) => other is ClientImplementation && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

extension ClientImplementationFind on Iterable<ClientImplementation> {
  ClientImplementation? tryFind(final String? clientID) => firstWhereOrNull((final client) => client.id == clientID);
  ClientImplementation find(final String clientID) => firstWhere((final client) => client.id == clientID);
}
