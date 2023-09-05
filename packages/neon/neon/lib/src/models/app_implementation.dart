import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/widgets/drawer_destination.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

@immutable
abstract class AppImplementation<T extends Bloc, R extends NextcloudAppOptions> {
  AppImplementation();

  String get id;
  LocalizationsDelegate get localizationsDelegate;
  List<Locale> get supportedLocales;

  String nameFromLocalization(final AppLocalizations localizations) => localizations.appImplementationName(id);
  String name(final BuildContext context) => nameFromLocalization(AppLocalizations.of(context));

  @protected
  late final AppStorage storage = AppStorage(StorageKeys.apps, id);

  @mustBeOverridden
  R get options;

  final Map<String, T> _blocs = {};

  T getBloc(final Account account) => _blocs[account.id] ??= buildBloc(account);

  @protected
  T buildBloc(final Account account);

  Provider<T> get blocProvider => Provider<T>(
        create: (final context) {
          final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
          final account = accountsBloc.activeAccount.value!;

          return getBloc(account);
        },
      );

  BehaviorSubject<int>? getUnreadCounter(final T bloc) => null;

  Widget get page;

  NeonNavigationDestination destination(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
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
  /// All pages of the app must be specified as subroutes.
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

  Widget buildIcon({
    final Size size = const Size.square(32),
    final Color? color,
  }) =>
      Builder(
        builder: (final context) => SizedBox.fromSize(
          size: size,
          child: SvgPicture.asset(
            'assets/app.svg',
            package: 'neon_$id',
            colorFilter: ColorFilter.mode(color ?? Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          ),
        ),
      );

  @mustCallSuper
  void dispose() {
    options.dispose();
    _blocs.disposeAll();
  }

  /// A custom theme that will be injected into the widget tree.
  ///
  /// You can later access it through `Theme.of(context).extension<ThemeName>()`.
  final ThemeExtension? theme = null;
}

extension AppImplementationFind on Iterable<AppImplementation> {
  AppImplementation? tryFind(final String? appID) => firstWhereOrNull((final app) => app.id == appID);
  AppImplementation find(final String appID) => firstWhere((final app) => app.id == appID);
}
