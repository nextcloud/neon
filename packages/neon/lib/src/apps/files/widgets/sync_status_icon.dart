part of '../app.dart';

class FilesSyncStatusIcon extends StatelessWidget {
  const FilesSyncStatusIcon({
    required this.status,
    this.size,
    super.key,
  });

  final bool? status;
  final double? size;

  @override
  Widget build(final BuildContext context) {
    // Status unknown
    if (status == null) {
      return Icon(
        Icons.cloud_off,
        color: Colors.red,
        size: size,
      );
    }
    // Partially synced
    if (!status!) {
      return Icon(
        Icons.cloud_queue,
        color: Colors.orange,
        size: size,
      );
    }
    // Completely sync
    return Icon(
      Icons.cloud_done,
      color: Colors.green,
      size: size,
    );
  }
}
