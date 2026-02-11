import 'package:flutter/material.dart';
import 'package:nextcloud/webdav.dart' as webdav;

/// Context for handling a MIME type.
///
/// [file] which needs to be handled and optionally [files] which are in the same directory.
/// The latter can be used for example to implement a gallery view for image files.
class MimeContext {
  /// Creates a new [MimeContext] with the given [file] and optional [files].
  MimeContext({
    required this.file,
    this.files,
  });

  /// The file which needs to be handled by the app.
  final webdav.WebDavFile file;

  /// Optional list of files in the same directory as [file].
  final List<webdav.WebDavFile>? files;
}

/// Provides a handler for a specific MIME type.
abstract class MimeHandler {
  /// Creates a new [MimeHandler] with the given [mimeType] regex.
  MimeHandler({
    required this.mimeType,
  });

  /// Regex pattern defining the MIME type this handler can handle.
  final RegExp mimeType;

  /// Checks if this handler can handle the given MIME type.
  bool canHandle(String mimeType) => this.mimeType.hasMatch(mimeType);

  /// Handler function provided by app implementation is expected to navigate to a screen which can handle the given MIME type.
  Future<void> handle(BuildContext context, MimeContext mimeContext) async =>
      Navigator.of(context).push(pageRoute(context, mimeContext));

  /// Provides the page route to navigate to when handling this MIME type.
  @protected
  MaterialPageRoute<void> pageRoute(BuildContext context, MimeContext mimeContext);
}

/// Filter for MIME types to be shown in different views.
@immutable
class MimeFilter {
  /// Creates a new [MimeFilter] with the given [activeMimeRegex] and [showDirectories] values.
  const MimeFilter({
    required this.activeMimeRegex,
    required this.showDirectories,
  });

  /// A [MimeFilter] which allows all MIME types and shows directories.
  const MimeFilter.files() : this(activeMimeRegex: '.*', showDirectories: true);

  /// A [MimeFilter] which allows only MIME types starting with "image/" and hides directories.
  const MimeFilter.images() : this(activeMimeRegex: 'image/.*', showDirectories: false);

  /// Regex pattern defining the active MIME types.
  final String activeMimeRegex;

  /// Whether to show directories.
  final bool showDirectories;
}
