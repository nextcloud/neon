import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:nextcloud/weather_status.dart' as weather_status;
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:version/version.dart';

void main() {
  presets(
    'server',
    'weather_status',
    (preset) {
      late DockerContainer container;
      late NextcloudClient client;
      setUpAll(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(container);
      });
      tearDownAll(() async {
        await container.destroy();
      });

      test('Set mode', () async {
        final response = await client.weatherStatus.weatherStatus.setMode(
          $body: weather_status.WeatherStatusSetModeRequestApplicationJson(
            (b) => b..mode = 1,
          ),
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
      });

      test('Get location', () async {
        await client.weatherStatus.weatherStatus.setLocation(
          $body: weather_status.WeatherStatusSetLocationRequestApplicationJson(
            (b) => b..address = 'Berlin',
          ),
        );

        final response = await client.weatherStatus.weatherStatus.getLocation();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.mode, 2);
        expect(response.body.ocs.data.address, 'Berlin, Deutschland');
        expect(response.body.ocs.data.lat, isNotEmpty);
        expect(response.body.ocs.data.lon, isNotEmpty);
      });

      test('Set location', () async {
        var response = await client.weatherStatus.weatherStatus.setLocation(
          $body: weather_status.WeatherStatusSetLocationRequestApplicationJson(
            (b) => b..address = 'Hamburg',
          ),
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
        expect(response.body.ocs.data.address, 'Hamburg, Deutschland');
        expect(response.body.ocs.data.lat, isNotEmpty);
        expect(response.body.ocs.data.lon, isNotEmpty);

        response = await client.weatherStatus.weatherStatus.setLocation(
          $body: weather_status.WeatherStatusSetLocationRequestApplicationJson(
            (b) => b
              ..lat = 52.5170365
              ..lon = 13.3888599,
          ),
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
        expect(response.body.ocs.data.address, 'Berlin, 10117, Deutschland');
        expect(response.body.ocs.data.lat, null);
        expect(response.body.ocs.data.lon, null);
      });

      test(
        'Use personal address',
        () async {
          await client.weatherStatus.weatherStatus.setLocation(
            $body: weather_status.WeatherStatusSetLocationRequestApplicationJson(
              (b) => b..address = 'Hamburg',
            ),
          );

          await client.core.appPassword.confirmUserPassword(
            $body: core.AppPasswordConfirmUserPasswordRequestApplicationJson(
              (b) => b..password = 'user1',
            ),
          );

          await client.provisioningApi.users.editUser(
            userId: 'user1',
            $body: provisioning_api.UsersEditUserRequestApplicationJson(
              (b) => b
                ..key = 'address'
                ..value = 'Berlin',
            ),
          );

          final response = await client.weatherStatus.weatherStatus.usePersonalAddress();
          expect(response.statusCode, 200);
          expect(response.body.ocs.data.success, true);
          expect(response.body.ocs.data.address, 'Berlin, Deutschland');
          expect(response.body.ocs.data.lat, isNotEmpty);
          expect(response.body.ocs.data.lon, isNotEmpty);
        },
        skip: preset.version < Version(29, 0, 0),
      );

      test('Get forecast', () async {
        await client.weatherStatus.weatherStatus.setLocation(
          $body: weather_status.WeatherStatusSetLocationRequestApplicationJson(
            (b) => b..address = 'Berlin',
          ),
        );

        final response = await client.weatherStatus.weatherStatus.getForecast();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.builtListForecast, isNotNull);
        expect(response.body.ocs.data.builtListForecast, isNotEmpty);
      });

      test('Get favorites', () async {
        await client.weatherStatus.weatherStatus.setFavorites(
          $body: weather_status.WeatherStatusSetFavoritesRequestApplicationJson(
            (b) => b..favorites.replace(['a', 'b']),
          ),
        );

        final response = await client.weatherStatus.weatherStatus.getFavorites();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data, equals(['a', 'b']));
      });

      test('Set favorites', () async {
        final response = await client.weatherStatus.weatherStatus.setFavorites(
          $body: weather_status.WeatherStatusSetFavoritesRequestApplicationJson(
            (b) => b..favorites.replace(['a', 'b']),
          ),
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
