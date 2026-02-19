import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/webdav.dart' as webdav;

class DirectorySelectionCapabilityHandler extends AppCapabilityHandler {
  @override
  bool canHandle(AppCapability capability) => capability is DirectorySelectionCapability;

  @override
  Future<C> handle<C extends AppCapability>(BuildContext context, C capability) async {
    if (capability is DirectorySelectionCapability) {
      capability.result = await showDialog<webdav.PathUri>(
        context: context,
        builder: (context) => _dialogBuilder(context, capability),
      );
    }
    return capability;
  }

  Widget _dialogBuilder(BuildContext context, DirectorySelectionCapability capability) {
    return FilesChooseFolderDialog(
      bloc: NeonProvider.of<FilesBloc>(context),
      uri: capability.currentDirectory,
    );
  }
}
