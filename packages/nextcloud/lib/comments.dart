// coverage:ignore-file
import 'package:nextcloud/src/api/comments.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/comments.openapi.dart';

// ignore: public_member_api_docs
extension CommentsExtension on NextcloudClient {
  static final _comments = Expando<Client>();

  /// Client for the comments APIs
  Client get comments => _comments[this] ??= Client.fromClient(this);
}
