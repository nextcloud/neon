import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:photos_app/src/pages/image.dart';

class ImageHandler extends MimeHandler {
  ImageHandler() : super(mimeType: RegExp('image/.*'));

  @override
  MaterialPageRoute<void> pageRoute(BuildContext context, MimeContext mimeContext) {
    return MaterialPageRoute<void>(
      builder: (context) => ImagePage(
        sorted: mimeContext.files ?? [mimeContext.file],
        file: mimeContext.file,
      ),
    );
  }
}
