import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:photos_app/src/pages/image.dart';

class ImageHandler extends AppCapabilityHandler {
  ImageHandler();

  @override
  bool canHandle(AppCapability capability) => capability is ImageViewerCapability;

  @override
  Future<C> handle<C extends AppCapability>(BuildContext context, C capability) async {
    if (capability is ImageViewerCapability) {
      await Navigator.of(context).push(_pageRoute(context, capability));
    }
    return capability;
  }

  MaterialPageRoute<void> _pageRoute(BuildContext context, ImageViewerCapability mime) {
    return MaterialPageRoute<void>(
      builder: (context) => ImagePage(
        sorted: mime.files ?? [mime.file],
        file: mime.file,
      ),
    );
  }
}
