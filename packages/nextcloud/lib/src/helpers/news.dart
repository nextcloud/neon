// ignore_for_file: public_member_api_docs

import 'package:nextcloud/src/api/news.openapi.dart' as news;

/// API version of the news app supported
const supportedVersion = 'v1-3';

extension NewsVersionSupported on news.Client {
  /// Check if the news app version is supported by this client
  ///
  /// Also returns the supported API version number
  Future<(bool, String)> isSupported() async {
    final response = await getSupportedApiVersions();
    return (
      response.body.apiLevels!.contains(supportedVersion),
      supportedVersion,
    );
  }
}

/// See https://github.com/nextcloud/news/blob/4a107b3d53c4fe651ac704251b99e04a53cd587f/lib/Db/ListType.php
enum ListType {
  feed,
  folder,
  starred,
  allItems,
  shared,
  explore,
  unread,
}
