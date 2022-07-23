part of '../neon.dart';

List<AppImplementation> getAppImplementations(
  final SharedPreferences sharedPreferences,
  final RequestManager requestManager,
  final NeonPlatform platform,
) =>
    [
      FilesApp(sharedPreferences, requestManager, platform),
      NewsApp(sharedPreferences, requestManager, platform),
      NotesApp(sharedPreferences, requestManager),
      NotificationsApp(sharedPreferences, requestManager),
    ];

abstract class AppImplementation<T extends RxBlocBase, R extends NextcloudAppSpecificOptions> {
  AppImplementation(
    this.id,
    this.nameFromLocalization,
    final SharedPreferences sharedPreferences,
    final R Function(Storage) buildOptions,
    this._buildBloc,
    this._buildPage,
  ) {
    final storage = Storage('app-$id', sharedPreferences);
    options = buildOptions(storage);
  }

  final String Function(AppLocalizations) nameFromLocalization;
  String name(BuildContext context) => nameFromLocalization(AppLocalizations.of(context));
  final String id;
  late final R options;
  final T Function(R options, NextcloudClient client) _buildBloc;
  final Widget Function(BuildContext context, T bloc) _buildPage;

  T buildBloc(final NextcloudClient client) => _buildBloc(options, client);

  Widget buildPage(final BuildContext context, final AppsBloc appsBloc) =>
      _buildPage(context, appsBloc.getAppBloc(this));

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
