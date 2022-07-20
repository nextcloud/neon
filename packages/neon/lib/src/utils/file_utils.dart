part of '../neon.dart';

class FileUtils {
  static Future<String?> saveFileWithPickDialog(final String fileName, final Uint8List data) async {
    if (Platform.isAndroid || Platform.isIOS) {
      // TODO: https://github.com/jld3103/nextcloud-neon/issues/8
      return FlutterFileDialog.saveFile(
        params: SaveFileDialogParams(
          data: data,
          fileName: fileName,
        ),
      );
    } else {
      final result = await FilePicker.platform.saveFile(
        fileName: fileName,
      );
      if (result != null) {
        await File(result).writeAsBytes(data);
      }

      return result;
    }
  }

  static Future<FilePickerResult?> loadFileWithPickDialog({
    final bool withData = false,
    final bool allowMultiple = false,
    final FileType type = FileType.any,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      withData: withData,
      allowMultiple: allowMultiple,
      type: type,
    );

    return result;
  }

  static Future<String?> pickDirectory() async => FilePicker.platform.getDirectoryPath();
}
