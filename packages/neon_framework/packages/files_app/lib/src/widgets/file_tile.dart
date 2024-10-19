import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:files_app/src/widgets/file_preview.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';

class FilesFileTile extends StatelessWidget {
  const FilesFileTile({
    required this.filesBloc,
    required this.details,
    this.trailing,
    this.onTap,
    this.uploadProgress,
    this.downloadProgress,
    this.showFullPath = false,
    super.key,
  });

  final FilesBloc filesBloc;
  final FileDetails details;
  final Widget? trailing;
  final GestureTapCallback? onTap;
  final int? uploadProgress;
  final int? downloadProgress;
  final bool showFullPath;

  @override
  Widget build(BuildContext context) {
    Widget icon = Center(
      child: uploadProgress != null || downloadProgress != null
          ? Column(
              children: [
                Icon(
                  uploadProgress != null ? MdiIcons.upload : MdiIcons.download,
                  color: Theme.of(context).colorScheme.primary,
                ),
                LinearProgressIndicator(
                  value: (uploadProgress ?? downloadProgress)! / 100,
                ),
              ],
            )
          : FilePreview(
              bloc: filesBloc,
              details: details,
            ),
    );
    if (details.isFavorite ?? false) {
      icon = Stack(
        children: [
          icon,
          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.star,
              size: 14,
              color: NcColors.starredColor,
            ),
          ),
        ],
      );
    }

    return ListTile(
      onTap: onTap,
      title: Text(
        showFullPath ? details.uri.path : details.name,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          if (details.lastModified != null) ...[
            RelativeTime(
              date: details.lastModified!,
            ),
          ],
          if (details.size != null && details.size! > 0) ...[
            const SizedBox(
              width: 10,
            ),
            Text(
              filesize(details.size, 1),
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ],
      ),
      leading: SizedBox.square(
        dimension: 40,
        child: icon,
      ),
      trailing: trailing,
    );
  }
}
