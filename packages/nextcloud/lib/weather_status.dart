import 'package:nextcloud/src/api/weather_status.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/weather_status.openapi.dart';

// ignore: public_member_api_docs
extension WeatherStatusExtension on NextcloudClient {
  static final _weatherStatus = Expando<WeatherStatusClient>();

  /// Client for the weather_status APIs
  WeatherStatusClient get weatherStatus => _weatherStatus[this] ??= WeatherStatusClient.fromClient(this);
}
