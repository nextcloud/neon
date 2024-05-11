import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:nextcloud/weather_status.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:test_api/src/backend/invoker.dart';
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
        if (Invoker.current!.liveTest.errors.isNotEmpty) {
          print(await container.allLogs());
        }
        container.destroy();
      });

      test('Set mode', () async {
        final response = await client.weatherStatus.weatherStatus.setMode(
          mode: 1,
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
      });

      test('Get location', () async {
        await client.weatherStatus.weatherStatus.setLocation(
          address: 'Berlin',
        );

        final response = await client.weatherStatus.weatherStatus.getLocation();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.mode, 2);
        expect(response.body.ocs.data.address, 'Berlin, Deutschland');
        expect(response.body.ocs.data.lat, '52.5170365');
        expect(response.body.ocs.data.lon, '13.3888599');
      });

      test('Set location', () async {
        var response = await client.weatherStatus.weatherStatus.setLocation(
          address: 'Hamburg',
        );
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
        expect(response.body.ocs.data.address, 'Hamburg, Deutschland');
        expect(response.body.ocs.data.lat, '53.550341');
        expect(response.body.ocs.data.lon, '10.000654');

        response = await client.weatherStatus.weatherStatus.setLocation(
          lat: 52.5170365,
          lon: 13.3888599,
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
            address: 'Hamburg',
          );

          await client.core.appPassword.confirmUserPassword(
            password: 'user1',
          );

          await client.provisioningApi.users.editUser(
            key: 'address',
            value: 'Berlin',
            userId: 'user1',
          );

          final response = await client.weatherStatus.weatherStatus.usePersonalAddress();
          expect(response.statusCode, 200);
          expect(response.body.ocs.data.success, true);
          expect(response.body.ocs.data.address, 'Berlin, Deutschland');
          expect(response.body.ocs.data.lat, '52.5170365');
          expect(response.body.ocs.data.lon, '13.3888599');
        },
        skip: preset.version < Version(29, 0, 0),
      );

      test('Get forecast', () async {
        await client.weatherStatus.weatherStatus.setLocation(
          address: 'Berlin',
        );

        final response = await client.weatherStatus.weatherStatus.getForecast();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.builtListForecast, isNotNull);
        expect(response.body.ocs.data.builtListForecast, isNotEmpty);
      });

      test('Get favorites', () async {
        await client.weatherStatus.weatherStatus.setFavorites(favorites: BuiltList(['a', 'b']));

        final response = await client.weatherStatus.weatherStatus.getFavorites();
        expect(response.statusCode, 200);
        expect(response.body.ocs.data, equals(['a', 'b']));
      });

      test('Set favorites', () async {
        final response = await client.weatherStatus.weatherStatus.setFavorites(favorites: BuiltList(['a', 'b']));
        expect(response.statusCode, 200);
        expect(response.body.ocs.data.success, true);
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
