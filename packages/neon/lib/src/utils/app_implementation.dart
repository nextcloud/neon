part of '../neon.dart';

List<AppImplementation> getAppImplementations(
  final SharedPreferences sharedPreferences,
  final RequestManager requestManager,
  final NeonPlatform platform,
) =>
    [
      FilesApp(sharedPreferences, requestManager, platform),
      NewsApp(sharedPreferences, requestManager, platform),
      NotesApp(sharedPreferences, requestManager, platform),
      NotificationsApp(sharedPreferences, requestManager, platform),
    ];

abstract class AppImplementation<T extends RxBlocBase, R extends NextcloudAppSpecificOptions> {
  AppImplementation(
    final SharedPreferences sharedPreferences,
    this.requestManager,
    this.platform,
  ) {
    final storage = Storage('app-$id', sharedPreferences);
    options = buildOptions(storage);
  }

  String get id;
  final RequestManager requestManager;
  final NeonPlatform platform;

  String nameFromLocalization(final AppLocalizations localizations);
  String name(final BuildContext context) => nameFromLocalization(AppLocalizations.of(context));

  late final R options;
  R buildOptions(final Storage storage);

  T buildBloc(final NextcloudClient client);

  BehaviorSubject<int>? getUnreadCounter(final AppsBloc appsBloc);

  Widget buildPage(final BuildContext context, final AppsBloc appsBloc);

  Widget buildIcon(
    final BuildContext context, {
    final double height = 32,
    final double width = 32,
  }) =>
      SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          'assets/apps/$id.svg',
          color: Theme.of(context).colorScheme.primary,
        ),
      );

  void dispose() {
    options.dispose();
  }
}
