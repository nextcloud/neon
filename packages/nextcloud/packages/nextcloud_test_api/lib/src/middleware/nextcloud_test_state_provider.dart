import 'package:dart_frog/dart_frog.dart';
import 'package:nextcloud_test_api/src/nextcloud_test_state/nextcloud_test_state.dart';

final _nextcloudTestState = NextcloudTestState();

/// Provides a [NextcloudTestState] to the current [RequestContext].
Middleware nextcloudTestStateProvider() {
  return (handler) {
    return handler.use(provider<NextcloudTestState>((_) => _nextcloudTestState));
  };
}
