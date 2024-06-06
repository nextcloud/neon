import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/props.dart';
import 'package:nextcloud/src/webdav/utils.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:timezone/timezone.dart' as tz;

// ignore: public_member_api_docs
extension WebDavMultistatusFile on WebDavMultistatus {
  /// Convert the [WebDavMultistatus] into a [WebDavFile] for easier handling
  List<WebDavFile> toWebDavFiles() =>
      responses.where((response) => response.href != null).map((response) => WebDavFile(response: response)).toList();
}

/// WebDavFile class
class WebDavFile {
  /// Creates a new WebDavFile object with the given path
  WebDavFile({
    required WebDavResponse response,
  }) : _response = response;

  final WebDavResponse _response;

  /// Get the props of the file
  late final WebDavProp props = _response.propstats.singleWhere((propstat) => propstat.status.contains('200')).prop;

  /// The path of file
  late final PathUri path = () {
    final href = PathUri.parse(Uri.decodeFull(_response.href!));
    return PathUri(
      isAbsolute: false,
      isDirectory: href.isDirectory,
      pathSegments: href.pathSegments.sublist(webdavBase.pathSegments.length),
    );
  }();

  /// The fileid namespaced by the instance id, globally unique
  late final String? id = props.ocId;

  /// The unique id for the file within the instance
  late final int? fileId = props.ocFileid;

  /// Whether this is a collection resource type
  late final bool? isCollection = props.davResourcetype != null ? props.davResourcetype!.collection != null : null;

  /// Mime-type of the file
  late final String? mimeType = props.davGetcontenttype;

  /// ETag of the file
  late final String? etag = props.davGetetag;

  /// File content length or folder size
  late final int? size = props.ocSize ?? props.davGetcontentlength;

  /// The user id of the owner of a shared file
  late final String? ownerId = props.ocOwnerId;

  /// The display name of the owner of a shared file
  late final String? ownerDisplay = props.ocOwnerDisplayName;

  /// Share note
  late final String? note = props.ncNote;

  /// Last modified date of the file.
  ///
  /// It will throw a [FormatException] if the date is invalid.
  late final tz.TZDateTime? lastModified = props.davGetlastmodified;

  /// Upload date of the file
  late final tz.TZDateTime? uploadedDate = props.ncUploadTime;

  /// Creation date of the file as provided by uploader
  late final tz.TZDateTime? createdDate = props.ncCreationTime;

  /// Whether this file is marked as favorite
  late final bool? favorite = props.ocFavorite;

  /// Whether this file has a preview image
  late final bool? hasPreview = props.ncHasPreview;

  /// The compact representation of an image preview.
  late final String? blurHash = props.ncMetadataBlurhash;

  /// Returns the decoded name of the file / folder without the whole path
  late final String name = path.name;

  /// Whether the file is hidden.
  late final bool isHidden = props.ncHidden ?? name.startsWith('.');

  /// Whether the file is a directory
  late final bool isDirectory = (isCollection ?? false) || path.isDirectory;
}
