import 'package:nextcloud/src/clients/common/api.dart';

// ignore: public_member_api_docs
extension AuthenticationHeaders on Authentication {
  // ignore: public_member_api_docs
  Map<String, String> get headers {
    final headers = <String, String>{};
    applyToParams([], headers);
    return headers;
  }
}
