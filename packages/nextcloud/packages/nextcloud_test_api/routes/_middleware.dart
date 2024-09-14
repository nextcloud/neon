import 'package:dart_frog/dart_frog.dart';
import 'package:nextcloud_test_api/api.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(nextcloudTestStateProvider());
}
