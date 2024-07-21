import 'package:file_picker/file_picker.dart';

class FileUtils {
  FileUtils._();

  static Future<FilePickerResult?> loadFileWithPickDialog({
    bool withData = false,
    bool allowMultiple = false,
    FileType type = FileType.any,
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
