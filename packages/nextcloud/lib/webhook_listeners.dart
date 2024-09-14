import 'package:nextcloud/src/api/webhook_listeners/webhook_listeners.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/webhook_listeners/webhook_listeners.openapi.dart';

/// ID for the webhook_listeners app.
const String appID = 'webhook_listeners';

/// Client for the webhook_listeners APIs.
extension WebhookListenersExtension on NextcloudClient {
  static final _webhookListeners = Expando<$Client>();

  /// Client for the webhook_listeners APIs.
  $Client get webhookListeners => _webhookListeners[this] ??= $Client.fromClient(this);
}
