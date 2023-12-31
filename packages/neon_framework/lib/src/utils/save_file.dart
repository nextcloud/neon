import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:universal_io/io.dart';

/// Displays a dialog for selecting a location where to save a file with the [data] content.
///
/// Set the the suggested [fileName] to use when saving the file.
///
/// Returns the path of the saved file or `null` if the operation was cancelled.
Future<String?> saveFileWithPickDialog(String fileName, Uint8List data) async {
  if (NeonPlatform.instance.shouldUseFileDialog) {
    // TODO: https://github.com/nextcloud/neon/issues/8
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
