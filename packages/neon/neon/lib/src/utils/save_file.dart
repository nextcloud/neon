import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:neon/src/platform/platform.dart';

Future<String?> saveFileWithPickDialog(final String fileName, final Uint8List data) async {
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
