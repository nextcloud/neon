import 'package:flutter/material.dart';
import 'package:neon_framework/src/models/app_implementation.dart';
import 'package:nextcloud/webdav.dart' as webdav;

/// Defines capabilities that apps can provide handlers for, allowing Neon or other apps to delegate certain actions to apps that can handle them.
/// Capabilities do also carry information required for handling a specific action, as well as an optional result in case the capability is a [ResultCapability].
abstract class AppCapability {}

/// Certain capabilities can produce a result, for example the [DirectorySelectionCapability] allows apps to return a selected directory back to Neon or other apps.
abstract class ResultCapability<T> extends AppCapability {
  /// The result of handling this capability. This can be set by the app providing the handler for this capability to return a result back to the caller.
  /// 
  /// There is no other way to provide a result to the caller. 
  /// A well behaved handler which produces a result should set this before returning the capability in the [AppCapabilityHandler.handle] method.
  /// Awaiting the capability should always lead to the result being available.
  T? result;
}

/// Apps can provide a handler for this capability to allow Neon to display images in the app instead of the system image viewer.
class ImageViewerCapability extends AppCapability {
  /// Creates a new [ImageViewerCapability] for the given file and optional list of files.
  ImageViewerCapability._({
    required this.file,
    this.files,
  });
  
  /// Creates a new [ImageViewerCapability] if the given file is an image that can be handled by this capability, otherwise returns null.
  static ImageViewerCapability? fromFile({required webdav.WebDavFile file, List<webdav.WebDavFile>? files}) {
    if(isImage(file)) {
      return ImageViewerCapability._(file: file, files: files);
    }
    return null;
  }

  /// Checks if the given file is an image that can be handled by this capability.
  static bool isImage(webdav.WebDavFile file) => file.mimeType != null && allImages.hasMatch(file.mimeType!);

  /// A constant representing all image MIME types.
  static RegExp allImages = RegExp('image/.*');

  /// The file to be handled.
  final webdav.WebDavFile file;

  /// An optional list of files representing the context of the file. This allowes us to open a carusel view without the need to reload the files list.
  final List<webdav.WebDavFile>? files;
}

/// Apps can provide a handler for this capability to allow Neon to delegate directory selection to the app, for example to allow users to select a directory in a file picker provided by the app instead of a system file picker.
class DirectorySelectionCapability extends ResultCapability<webdav.PathUri?> {
  /// Creates a new [DirectorySelectionCapability] for the given current directory.
  DirectorySelectionCapability(this.currentDirectory);

  /// The currently visible directory for the directory selection.
  final webdav.PathUri currentDirectory;
}

/// Base class for capabilities handling. Apps can provide handlers for specific capabilities by implementing [AppCapabilityHandler] and returning it in the [AppImplementation.appCapabilityHandler] method.
abstract class AppCapabilityHandler {
  /// Checks if this handler can handle the given capability.
  bool canHandle(AppCapability capability);

  /// Handles the given capability and returns the passed capability back to the caller. It is good practice to return the same object back.
  /// The returned capability can optionally contain a result if the capability is a [ResultCapability] and the handler sets the result before returning it.
  /// The return value is mainly syntactic sugar to allow for easier handling of capabilities.
  Future<C> handle<C extends AppCapability>(BuildContext context, C capability);
}
