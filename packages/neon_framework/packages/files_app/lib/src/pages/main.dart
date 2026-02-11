import 'dart:async';

import 'package:files_app/l10n/localizations.dart';
import 'package:files_app/src/blocs/browser.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/utils/dialog.dart';
import 'package:files_app/src/widgets/browser_view.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart' as webdav;

class FilesMainPage extends StatefulWidget {
  const FilesMainPage({
    super.key,
    this.mimeFilter = const MimeFilter.files(),
    this.uri,
  });

  final MimeFilter mimeFilter;
  final webdav.PathUri? uri;

  @override
  State<FilesMainPage> createState() => _FilesMainPageState();
}

class _FilesMainPageState extends State<FilesMainPage> {
  late webdav.PathUri uri;
  late FilesBloc bloc;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();
    uri = widget.uri ?? webdav.PathUri.cwd();
    bloc = NeonProvider.of<FilesBloc>(context);

    errorsSubscription = bloc.errors.listen((error) {
      if (mounted) {
        NeonError.showSnackbar(context, error);
      }
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () async {
        final parent = uri.parent;
        if (parent != null) {
          setState(() {
            uri = parent;
          });
          return true;
        }
        return false;
      },
      child: Scaffold(
        body: FilesBrowserView(
          filesBloc: bloc,
          uri: uri,
          mode: FilesBrowserMode.browser,
          mimeFilter: widget.mimeFilter,
          setPath: (uri) {
            setState(() {
              this.uri = uri;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => showFilesCreateModal(context, uri),
          tooltip: FilesLocalizations.of(context).uploadFiles,
          child: Icon(AdaptiveIcons.add),
        ),
      ),
    );
  }
}
