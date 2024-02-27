import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/weather_status.dart' as weather_status;
import 'package:rxdart/rxdart.dart';

/// Bloc for managing the weather status.
@sealed
abstract class WeatherStatusBloc implements InteractiveBloc {
  /// Create a new weather status bloc.
  factory WeatherStatusBloc(
    Stream<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities,
    Account account,
  ) =>
      _WeatherStatusBloc(
        account,
        capabilities,
      );

  /// Set the location to use.
  void setLocation(String address);

  /// Whether weather status is supported by the server.
  BehaviorSubject<bool> get isSupported;

  /// The current location.
  BehaviorSubject<Result<weather_status.$LocationInterface>> get location;

  /// Contains the forecasts.
  BehaviorSubject<Result<BuiltList<weather_status.Forecast>>> get forecasts;
}

class _WeatherStatusBloc extends InteractiveBloc implements WeatherStatusBloc {
  _WeatherStatusBloc(
    this.account,
    Stream<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>> capabilities,
  ) {
    capabilitiesSubscription = capabilities.listen((result) {
      final oldSupport = isSupported.valueOrNull ?? false;
      final newSupport = result.data?.capabilities.weatherStatusCapabilities?.weatherStatus.enabled ?? false;
      isSupported.add(newSupport);
      if (!oldSupport && newSupport) {
        unawaited(refresh());
      }
    });

    timer = TimerBloc().registerTimer(const Duration(minutes: 5), refresh);

    location.listen((locationResult) async {
      if (!locationResult.isLoading && locationResult.hasData) {
        if (locationResult.data?.address != null) {
          await refreshForecast();
        } else {
          location.add(Result.success(null));
        }
      }
    });
  }

  final Account account;
  late final StreamSubscription<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>>
      capabilitiesSubscription;
  late final NeonTimer timer;

  @override
  void dispose() {
    timer.cancel();
    unawaited(capabilitiesSubscription.cancel());
    unawaited(isSupported.close());
    unawaited(location.close());
    unawaited(forecasts.close());
    super.dispose();
  }

  @override
  final isSupported = BehaviorSubject<bool>();

  @override
  final location = BehaviorSubject<Result<weather_status.$LocationInterface>>();

  @override
  final forecasts = BehaviorSubject<Result<BuiltList<weather_status.Forecast>>>();

  @override
  Future<void> refresh() async {
    if (!(isSupported.valueOrNull ?? false)) {
      return;
    }

    await Future.wait([
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'weather_status-location',
        subject: location,
        rawResponse: account.client.weatherStatus.weatherStatus.getLocationRaw(),
        unwrap: (response) => response.body.ocs.data,
      ),
    ]);
  }

  Future<void> refreshForecast() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'weather_status-forecast',
      subject: forecasts,
      rawResponse: account.client.weatherStatus.weatherStatus.getForecastRaw(),
      unwrap: (response) => response.body.ocs.data.builtListForecast ?? BuiltList(),
    );
  }

  @override
  void setLocation(String address) {
    wrapAction(
      () async {
        final response = await account.client.weatherStatus.weatherStatus.setLocation(
          address: address,
        );
        location.add(Result.success(response.body.ocs.data));
      },
      refresh: () async {
        await refreshForecast();
      },
    );
  }
}
