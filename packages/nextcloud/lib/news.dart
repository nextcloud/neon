// coverage:ignore-file
import 'package:nextcloud/src/api/news/news.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/news/news.openapi.dart';
export 'src/api/news/news_helpers.dart';

// ignore: public_member_api_docs
extension NewsExtension on NextcloudClient {
  static final _news = Expando<$Client>();

  /// Client for the news APIs
  $Client get news => _news[this] ??= $Client.fromClient(this);
}
