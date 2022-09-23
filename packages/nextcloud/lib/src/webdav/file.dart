part of '../../nextcloud.dart';

/// WebDavFile class
class WebDavFile {
  /// Creates a new WebDavFile object with the given path
  WebDavFile({
    required this.path,
    required final List<xml.XmlElement> props,
    required final Map<String, String> namespaces,
  })  : _props = props,
        _namespaces = namespaces;

  /// The path of file
  final String path;

  final List<xml.XmlElement> _props;
  final Map<String, String> _namespaces;

  /// Gets a prop by it's qualified name. It already does namespace matching
  xml.XmlElement? getProp(final String qualifiedName) {
    final name = xml.XmlName.fromString(qualifiedName);
    final namespaceUri = _namespaces.keys.singleWhere((final namespaceUri) => _namespaces[namespaceUri] == name.prefix);

    final matches =
        _props.where((final prop) => prop.name.local == name.local && prop.namespaceUri == namespaceUri).toList();
    if (matches.isNotEmpty) {
      return matches[0];
    }
    return null;
  }

  /// The fileid namespaced by the instance id, globally unique
  String? get id => getProp(WebDavProps.ocId.name)?.text;

  /// The unique id for the file within the instance
  String? get fileId => getProp(WebDavProps.ocFileId.name)?.text;

  /// Whether this is a collection resource type
  bool? get isCollection {
    final prop = getProp(WebDavProps.davResourceType.name);
    if (prop != null) {
      return prop.getElement('d:collection') != null;
    }
    return null;
  }

  /// Mime-type of the file
  String? get mimeType => getProp(WebDavProps.davContentType.name)?.text;

  /// ETag of the file
  String? get etag => getProp(WebDavProps.davETag.name)?.text;

  /// File content length or folder size
  int? get size {
    for (final prop in [
      getProp(WebDavProps.ocSize.name),
      getProp(WebDavProps.davContentLength.name),
    ]) {
      if (prop != null) {
        return int.parse(prop.text);
      }
    }
    return null;
  }

  /// The user id of the owner of a shared file
  String? get ownerId => getProp(WebDavProps.ocOwnerId.name)?.text;

  /// The display name of the owner of a shared file
  String? get ownerDisplay => getProp(WebDavProps.ocOwnerDisplayName.name)?.text;

  /// Share note
  String? get note => getProp(WebDavProps.ncNote.name)?.text;

  /// Last modified date of the file
  DateTime? get lastModified {
    final prop = getProp(WebDavProps.davLastModified.name);
    if (prop != null) {
      return DateFormat('E, d MMM yyyy HH:mm:ss', 'en_US').parseUtc(prop.text);
    }
    return null;
  }

  /// Upload date of the file
  DateTime? get uploadedDate {
    final prop = getProp(WebDavProps.ncUploadTime.name);
    if (prop != null) {
      return DateTime.fromMillisecondsSinceEpoch(int.parse(prop.text) * 1000);
    }
    return null;
  }

  /// Creation date of the file as provided by uploader
  DateTime? get createdDate {
    final prop = getProp(WebDavProps.ncCreationTime.name);
    if (prop != null) {
      return DateTime.fromMillisecondsSinceEpoch(int.parse(prop.text) * 1000);
    }
    return null;
  }

  /// List of types of shares of the file
  List<int>? get shareTypes {
    final prop = getProp(WebDavProps.ocShareTypes.name);
    if (prop != null) {
      return prop.findElements('oc:share-type').map((final element) => int.parse(element.text)).toList();
    }
    return null;
  }

  /// User IDs of sharees
  List<String>? get sharees {
    final prop = getProp(WebDavProps.ncShareees.name);
    if (prop != null) {
      return prop.findAllElements('nc:id').map((final e) => e.text).toList();
    }
    return null;
  }

  /// Whether this file is marked as favorite
  bool? get favorite {
    final prop = getProp(WebDavProps.ocFavorite.name);
    if (prop != null) {
      return prop.text == '1';
    }
    return null;
  }

  /// Whether this file has a preview image
  bool? get hasPreview {
    final prop = getProp(WebDavProps.ncHasPreview.name);
    if (prop != null) {
      return prop.text == 'true';
    }
    return null;
  }

  /// Returns the decoded name of the file / folder without the whole path
  String get name {
    // normalised path (remove trailing slash)
    final end = path.endsWith('/') ? path.length - 1 : path.length;
    final segments = Uri.parse(path, 0, end).pathSegments;
    if (segments.isNotEmpty) {
      return segments.last;
    }
    return '';
  }

  /// Returns if the file is a directory
  bool get isDirectory => path.endsWith('/') || (isCollection ?? false);

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      'WebDavFile{name: $name, id: $id, isDirectory: $isDirectory, path: $path, mimeType: $mimeType, size: $size, modificationTime: $lastModified, shareTypes: $shareTypes}';
}

/// Converts a single d:response to a [WebDavFile]
WebDavFile _fromWebDavXml(
  final String basePath,
  final Map<String, String> namespaces,
  final xml.XmlElement response,
) {
  final davItemName = response.findElements('d:href').single.text;
  final filePath = Uri.decodeFull(davItemName.substring(Uri.encodeFull(basePath).length, davItemName.length));
  final allProps = <xml.XmlElement>[];

  final propStatElements = response.findElements('d:propstat');
  for (final propStat in propStatElements) {
    final status = propStat.getElement('d:status')!.text;
    final props = propStat.getElement('d:prop');

    if (!status.contains('200')) {
      // Skip any props that are not returned correctly (e.g. not found)
      continue;
    }
    for (final prop in props!.nodes.whereType<xml.XmlElement>()) {
      if (prop.children.isNotEmpty && prop.text.isNotEmpty) {
        allProps.add(prop);
      }
    }
  }

  return WebDavFile(
    path: filePath,
    props: allProps,
    namespaces: namespaces,
  );
}

/// Extract a file from the webdav xml
WebDavFile fileFromWebDavXml(
  final String basePath,
  final Map<String, String> namespaces,
  final String xmlStr,
) {
  final xmlDocument = xml.XmlDocument.parse(xmlStr);
  return _fromWebDavXml(
    basePath,
    namespaces,
    xmlDocument.findAllElements('d:response').single,
  );
}

/// Extract the file tree from the webdav xml
List<WebDavFile> treeFromWebDavXml(
  final String basePath,
  final Map<String, String> namespaces,
  final String xmlStr,
) {
  // Initialize a list to store the FileInfo Objects
  final tree = [];

  // parse the xml using the xml.XmlDocument.parse method
  final xmlDocument = xml.XmlDocument.parse(xmlStr);

  // Iterate over the response to find all folders / files and parse the information
  for (final response in xmlDocument.findAllElements('d:response')) {
    tree.add(
      _fromWebDavXml(
        basePath,
        namespaces,
        response,
      ),
    );
  }
  return tree.cast<WebDavFile>();
}

/// Returns false if some updates have failed.
bool checkUpdateFromWebDavXml(final String xmlStr) {
  final xmlDocument = xml.XmlDocument.parse(xmlStr);
  final response = xmlDocument.findAllElements('d:response').single;
  final propStatElements = response.findElements('d:propstat');
  for (final propStat in propStatElements) {
    final status = propStat.getElement('d:status')!.text;
    if (!status.contains('200')) {
      return false;
    }
  }
  return true;
}
