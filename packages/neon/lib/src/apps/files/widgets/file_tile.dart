part of '../app.dart';

class FilesFileTile extends StatelessWidget {
  const FilesFileTile({
    required this.filesBloc,
    required this.details,
    this.titleOverride,
    this.trailing,
    this.visualDensity,
    this.onTap,
    this.uploadProgress,
    this.downloadProgress,
    super.key,
  });

  final FilesBloc filesBloc;
  final FilesFileDetails details;
  final Widget? titleOverride;
  final Widget? trailing;
  final VisualDensity? visualDensity;
  final Function(FilesFileDetails)? onTap;
  final int? uploadProgress;
  final int? downloadProgress;

  @override
  Widget build(final BuildContext context) => ListTile(
        visualDensity: visualDensity,
        onTap: () {
          onTap?.call(details);
        },
        title: titleOverride ??
            Text(
              details.name,
              overflow: TextOverflow.ellipsis,
            ),
        subtitle: Row(
          children: [
            Text(CustomTimeAgo.format(details.lastModified)),
            if (details.size > 0) ...[
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  filesize(details.size, 1),
                  style: DefaultTextStyle.of(context).style.copyWith(
                        color: Colors.grey,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
        leading: SizedBox(
          height: 40,
          width: 40,
          child: Stack(
            children: [
              Center(
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
                        withBackground: true,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
              ),
              if (details.isFavorite ?? false) ...[
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ],
          ),
        ),
        trailing: trailing,
      );
}
