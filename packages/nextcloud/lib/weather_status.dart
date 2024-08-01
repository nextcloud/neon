import 'package:nextcloud/src/api/weather_status/weather_status.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/weather_status/weather_status.openapi.dart';

/// ID for the weather_status app.
const String appID = 'weather_status';

/// Client for the weather_status APIs.
extension WeatherStatusExtension on NextcloudClient {
  static final _weatherStatus = Expando<$Client>();

  /// Client for the weather_status APIs.
  $Client get weatherStatus => _weatherStatus[this] ??= $Client.fromClient(this);
}
