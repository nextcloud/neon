part of '../harbour.dart';

abstract class AppImplementation<T extends RxBlocBase, R extends NextcloudAppSpecificOptions> {
  AppImplementation(
    this.id,
    this.name,
    final SharedPreferences sharedPreferences,
    final R Function(Storage) buildOptions,
    this._buildBloc,
    this._buildPage,
  ) {
    final storage = Storage('app-$id', sharedPreferences);
    options = buildOptions(storage);
  }

  final String Function(BuildContext) name;
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
