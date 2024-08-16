import 'package:files_app/l10n/localizations.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:nextcloud/webdav.dart' as webdav;

class FilesBrowserNavigator extends StatelessWidget {
  const FilesBrowserNavigator({
    required this.uri,
    required this.bloc,
    required this.setPath,
    super.key,
  });

  final webdav.PathUri uri;
  final FilesBloc bloc;
  final void Function(webdav.PathUri uri) setPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ButtonTheme.of(context).height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: uri.pathSegments.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return IconButton(
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              tooltip: FilesLocalizations.of(context).goToPath(''),
              icon: Icon(AdaptiveIcons.house),
              onPressed: () => setPath(webdav.PathUri.cwd()),
            );
          }

          final partialPath = webdav.PathUri(
            isAbsolute: uri.isAbsolute,
            isDirectory: uri.isDirectory,
            pathSegments: uri.pathSegments.sublist(0, index),
          );
          return TextButton(
            onPressed: () => setPath(partialPath),
            child: Text(
              partialPath.name,
              semanticsLabel: FilesLocalizations.of(context).goToPath(partialPath.name),
            ),
          );
        },
        separatorBuilder: (context, index) => Icon(AdaptiveIcons.chevron_right),
      ),
    );
  }
}
