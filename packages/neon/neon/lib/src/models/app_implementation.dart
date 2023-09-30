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

/// Base implementation of a Neon app.
///
/// It is mandatory to provide a precompiled svg under `assets/app.svg.vec`.
/// SVGs can be precompiled with `https://pub.dev/packages/vector_graphics_compiler`
@immutable
abstract class AppImplementation<T extends Bloc, R extends NextcloudAppOptions> implements Disposable {
  /// The unique id of an app.
  ///
  /// It is common to specify them in `AppIDs`.
  String get id;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  LocalizationsDelegate<Object> get localizationsDelegate;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  Iterable<Locale> get supportedLocales;

  /// Default localized app name used in [name].
  ///
  /// Defaults to the frameworks mapping of the [id] to a localized name.
  String nameFromLocalization(final NeonLocalizations localizations) => localizations.appImplementationName(id);

  /// Localized name of this app.
  String name(final BuildContext context) => nameFromLocalization(NeonLocalizations.of(context));

  /// The [SettingsStorage] for this app.
  @protected
  late final AppStorage storage = AppStorage(StorageKeys.apps, id);

  /// The options associated with this app.
  ///
  /// Options will be added to the settings page providing a global place to
  /// adjust the behavior of an app.
  @mustBeOverridden
  R get options;

  /// Checks if the app is supported on the server of the [account].
  ///
  /// A `supported` value of `null` means that it can not be known if the app is supported.
  /// This is the case for apps that depend on the server version like files and we assume that the app is supported.
  /// The server support is handled differently.
  ///
  /// The first value of the record is the supported status and the second value is the supported minimum version.
  FutureOr<(bool? supported, String? minimumVersion)> isSupported(
    final Account account,
    final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  );

  /// Cache for all blocs.
  ///
  /// To access a bloc use [getBloc] instead.
  final blocsCache = AccountCache<T>();

  /// Returns a bloc [T] from the [blocsCache] or builds a new one if absent.
  T getBloc(final Account account) => blocsCache[account] ??= buildBloc(account);

  /// Build the bloc [T] for the given [account].
  ///
  /// Blocs are long lived and should not be rebuilt for subsequent calls.
  /// Use [getBloc] which also handles caching.
  @protected
  T buildBloc(final Account account);

  /// The [Provider] building the bloc [T] the currently active account.
  ///
  /// Blocs will not be disposed on disposal of the provider. You must handle
  /// the [blocsCache] manually.
  Provider<T> get blocProvider => Provider<T>(
        create: (final context) {
          final accountsBloc = NeonProvider.of<AccountsBloc>(context);
          final account = accountsBloc.activeAccount.value!;

          return getBloc(account);
        },
      );

  /// The count of unread notifications.
  ///
  /// If null no label will be displayed.
  BehaviorSubject<int>? getUnreadCounter(final T bloc) => null;

  /// The main page of this app.
  ///
  /// The framework will insert [blocProvider] into the widget tree before.
  Widget get page;

  /// The drawer destination used in widgets like [NavigationDrawer].
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

  /// Route for the app.
  ///
  /// All pages of the app must be specified as sub routes.
  /// If this is not [GoRoute] an initial route name must be specified by overriding [initialRouteName].
  RouteBase get route;

  /// Name of the initial route for this app.
  ///
  /// Subclasses that don't provide a [GoRoute] for [route] must override this.
  String get initialRouteName {
    final route = this.route;

    if (route is GoRoute && route.name != null) {
      return route.name!;
    }

    throw FlutterError('No name for the initial route provided.');
  }

  /// Builds the app icon.
  ///
  /// It is mandatory to provide a precompiled svg under `assets/app.svg.vec`.
  /// SVGs can be precompiled with `https://pub.dev/packages/vector_graphics_compiler`
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
  bool operator ==(final Object other) => other is AppImplementation && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// Extension to find an app implementation by id in a Iterable.
extension AppImplementationFind on Iterable<AppImplementation> {
  /// Returns the first [AppImplementation] matching  [appID] by [AppImplementation.id].
  ///
  /// If no `AppImplementation` can be identified `null` is returned.
  AppImplementation? tryFind(final String? appID) => firstWhereOrNull((final app) => app.id == appID);

  /// Returns the first [AppImplementation] matching  [appID] by [AppImplementation.id].
  ///
  /// Throws a [StateError] if no `AppImplementation` can be identified.
  /// Use [tryFind] to get a nullable result.
  AppImplementation find(final String appID) => firstWhere((final app) => app.id == appID);
}
