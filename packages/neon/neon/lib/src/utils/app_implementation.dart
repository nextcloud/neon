part of '../../neon.dart';

abstract class AppImplementation<T extends Bloc, R extends NextcloudAppSpecificOptions> {
  AppImplementation(
    final SharedPreferences sharedPreferences,
    this.requestManager,
    this.platform,
  ) {
    final storage = AppStorage('app-$id', sharedPreferences);
    options = buildOptions(storage);
  }

  String get id;
  LocalizationsDelegate get localizationsDelegate;
  List<Locale> get supportedLocales;
  final RequestManager requestManager;
  final NeonPlatform platform;

  String nameFromLocalization(final AppLocalizations localizations) => localizations.appImplementationName(id);
  String name(final BuildContext context) => nameFromLocalization(AppLocalizations.of(context));

  late final R options;
  R buildOptions(final AppStorage storage);

  T buildBloc(final NextcloudClient client);

  Provider<T> blocProvider(final NextcloudClient client) => Provider<T>(
        create: (final _) => buildBloc(client),
      );

  BehaviorSubject<int>? getUnreadCounter(final AppsBloc appsBloc);

  Widget buildPage(final BuildContext context, final AppsBloc appsBloc);

  Widget buildIcon(
    final BuildContext context, {
    final Size size = const Size.square(32),
    final Color? color,
  }) =>
      SizedBox.fromSize(
        size: size,
        child: SvgPicture.asset(
          'assets/app.svg',
          package: 'neon_$id',
          colorFilter: ColorFilter.mode(color ?? Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        ),
      );

  void dispose() {
    options.dispose();
  }
}

extension AppImplementationFind on List<AppImplementation> {
  AppImplementation? find(final String appID) {
    for (final app in this) {
      if (app.id == appID) {
        return app;
      }
    }

    return null;
  }
}
