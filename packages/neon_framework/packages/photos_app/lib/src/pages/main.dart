import 'package:files_app/src/pages/main.dart';
import 'package:flutter/material.dart';
import 'package:photos_app/src/options.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/models.dart';

class PhotosMainPage extends StatelessWidget {
  const PhotosMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PhotosOptions options = NeonProvider.of<PhotosOptions>(context);

    return ValueListenableBuilder(
      valueListenable: options.photosHomePathOption,
      // Just temporary to get everything started, I will create a proper timeline view next.
      builder: (context, value, child) => FilesMainPage(
        mimeFilter: const MimeFilter.images(),
        uri: value,
      ),
    );
  }
}
