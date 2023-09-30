part of '../neon_files.dart';

class FilesBrowserNavigator extends StatelessWidget {
  const FilesBrowserNavigator({
    required this.path,
    required this.bloc,
    super.key,
  });

  final List<String> path;
  final FilesBrowserBloc bloc;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: ButtonTheme.of(context).height,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: path.length + 1,
          itemBuilder: (final context, final index) {
            if (index == 0) {
              return IconButton(
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                tooltip: AppLocalizations.of(context).goToPath(''),
                icon: const Icon(Icons.house),
                onPressed: () {
                  bloc.setPath([]);
                },
              );
            }

            final path = this.path.sublist(0, index);
            final label = path.join('/');

            return TextButton(
              onPressed: () {
                bloc.setPath(path);
              },
              child: Text(
                path.last,
                semanticsLabel: AppLocalizations.of(context).goToPath(label),
              ),
            );
          },
          separatorBuilder: (final context, final index) => const Icon(Icons.keyboard_arrow_right),
        ),
      );
}
