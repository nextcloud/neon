import 'package:nextcloud/src/clients/common/api.dart';

// ignore: public_member_api_docs
class NoAuthentication extends Authentication {
  @override
  Future applyToParams(
    final List<QueryParam> queryParams,
    final Map<String, String> headerParams,
  ) async {}
}
