import 'dart:convert';
import 'dart:typed_data';

import 'package:account_repository/account_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/utils/push_utils.dart';
import 'package:neon_framework/storage.dart';
import 'package:neon_framework/theme.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:package_info_plus_platform_interface/package_info_data.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:timezone/timezone.dart' as tz;

class _NextcloudClientMock extends Mock implements NextcloudClient {}

class _OnPushNotificationReceivedCallbackMock extends Mock {
  Future<void> call(String accountID);
}

class _PushNotificationFake extends Fake implements PushNotification {}

class _OnLocalNotificationClickedCallbackMock extends Mock {
  Future<void> call(PushNotification notification);
}

class _AndroidFlutterLocalNotificationsPluginMock extends Mock
    with MockPlatformInterfaceMixin
    implements AndroidFlutterLocalNotificationsPlugin {}

class _SingleValueStoreMock extends Mock implements SingleValueStore {}

class _NeonStorageMock extends Mock implements NeonStorage {}

class _PackageInfoPlatformMock extends Mock with MockPlatformInterfaceMixin implements PackageInfoPlatform {}

class _HttpRequestCallbackMock extends Mock {
  http.StreamedResponse call(String method, Uri url, BuiltMap<String, String> headers, Uint8List body);
}

class _HttpClientMock extends Mock implements http.Client {
  _HttpClientMock(this._callback);

  final _HttpRequestCallbackMock _callback;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final body = await request.finalize().toBytes();
    return _callback(
      request.method.toUpperCase(),
      request.url,
      BuiltMap(request.headers),
      body,
    );
  }
}

Uint8List _encryptPushNotifications(RSAKeypair keypair, List<Map<String, dynamic>> pushNotifications) {
  return utf8.encode(
    Uri(
      queryParameters: {
        for (final (index, pushNotification) in pushNotifications.indexed)
          index.toString(): json.encode({
            'priority': pushNotification['priority'] as String,
            'type': pushNotification['type'] as String,
            'subject': keypair.publicKey.encrypt(json.encode(pushNotification['subject'] as Map<String, dynamic>)),
          }),
      },
    ).query,
  );
}

void main() {
  group('onMessage', () {
    final credentials = Credentials(
      (b) => b
        ..serverURL = Uri.parse('https://example.com')
        ..username = 'username'
        ..appPassword = 'appPassword',
    );
    final account = Account(
      (b) => b
        ..credentials.replace(credentials)
        ..client = _NextcloudClientMock(),
    );

    late _OnPushNotificationReceivedCallbackMock onPushNotificationReceivedCallback;
    late _OnLocalNotificationClickedCallbackMock onLocalNotificationClickedCallback;
    late AndroidFlutterLocalNotificationsPlugin localNotificationsPlatform;
    late DidReceiveNotificationResponseCallback onDidReceiveNotificationResponseCallback;
    late RSAKeypair keypair;
    late SingleValueStore devicePrivateKeyPersistence;
    late NeonStorage storage;
    late PackageInfoPlatform packageInfoPlatform;

    setUp(() async {
      onPushNotificationReceivedCallback = _OnPushNotificationReceivedCallbackMock();
      PushUtils.onPushNotificationReceived = onPushNotificationReceivedCallback.call;
      when(() => onPushNotificationReceivedCallback(any())).thenAnswer((_) async {});

      registerFallbackValue(_PushNotificationFake());

      onLocalNotificationClickedCallback = _OnLocalNotificationClickedCallbackMock();
      PushUtils.onLocalNotificationClicked = onLocalNotificationClickedCallback.call;
      when(() => onLocalNotificationClickedCallback(any())).thenAnswer((_) async {});

      registerFallbackValue(const AndroidInitializationSettings(''));

      // Tests default to target platform Android, so we have to mock that specific implementation as the generic one won't work.
      localNotificationsPlatform = _AndroidFlutterLocalNotificationsPluginMock();
      FlutterLocalNotificationsPlatform.instance = localNotificationsPlatform;
      when(
        () => localNotificationsPlatform.initialize(
          any(
            that: predicate(
              (s) => s is AndroidInitializationSettings && s.defaultIcon == '@drawable/ic_launcher_outline',
            ),
          ),
          onDidReceiveNotificationResponse: any(named: 'onDidReceiveNotificationResponse'),
        ),
      ).thenAnswer((invocation) async {
        onDidReceiveNotificationResponseCallback =
            invocation.namedArguments[#onDidReceiveNotificationResponse] as DidReceiveNotificationResponseCallback;
        return true;
      });
      when(
        () => localNotificationsPlatform.show(
          any(),
          any(),
          any(),
          notificationDetails: any(named: 'notificationDetails'),
          payload: any(named: 'payload'),
        ),
      ).thenAnswer((_) async {});
      when(() => localNotificationsPlatform.cancel(any(), tag: any(named: 'tag'))).thenAnswer((_) async {});
      when(() => localNotificationsPlatform.cancelAll()).thenAnswer((_) async {});
      when(() => localNotificationsPlatform.getActiveNotifications()).thenAnswer((_) async => []);

      keypair = RSAKeypair.fromRandom();

      devicePrivateKeyPersistence = _SingleValueStoreMock();
      when(() => devicePrivateKeyPersistence.getString()).thenReturn(keypair.privateKey.toPEM());

      storage = _NeonStorageMock();
      when(() => storage.init()).thenAnswer((_) async {});
      when(() => storage.singleValueStore(StorageKeys.notificationsDevicePrivateKey))
          .thenReturn(devicePrivateKeyPersistence);
      NeonStorage.mocked(storage);

      packageInfoPlatform = _PackageInfoPlatformMock();
      PackageInfoPlatform.instance = packageInfoPlatform;
      when(() => packageInfoPlatform.getAll(baseUrl: any(named: 'baseUrl'))).thenAnswer(
        (_) async => PackageInfoData(
          appName: 'app',
          packageName: 'package',
          version: '1.0.0',
          buildNumber: '1',
          buildSignature: '',
        ),
      );
    });

    tearDown(() async {
      verify(() => onPushNotificationReceivedCallback(account.id)).called(1);
      verifyNoMoreInteractions(onPushNotificationReceivedCallback);

      verifyNoMoreInteractions(onLocalNotificationClickedCallback);

      verify(
        () => localNotificationsPlatform.initialize(
          any(),
          onDidReceiveNotificationResponse: any(named: 'onDidReceiveNotificationResponse'),
        ),
      ).called(1);
      verifyNoMoreInteractions(localNotificationsPlatform);

      verify(() => devicePrivateKeyPersistence.getString()).called(1);
      verifyNoMoreInteractions(devicePrivateKeyPersistence);

      verify(() => storage.init()).called(1);
      verify(() => storage.singleValueStore(StorageKeys.notificationsDevicePrivateKey)).called(1);
      verifyNoMoreInteractions(storage);

      // The package_info_plus package caches the result of getAll() so we can not verify for each test that the call happens/doesn't happen as it depends on the order.
      // This means we can not verify that no more interactions take place.
    });

    test('Delete', () async {
      final payload = {
        'priority': '',
        'type': 'background',
        'subject': {
          'nid': 1,
          'delete': true,
        },
      };

      await PushUtils.onMessage(_encryptPushNotifications(keypair, [payload]), account.id);

      verify(() => localNotificationsPlatform.cancel(PushUtils.getNotificationID(account.id, 1))).called(1);
      verify(() => localNotificationsPlatform.getActiveNotifications()).called(1);
    });

    test('Delete multiple', () async {
      final payload = {
        'priority': '',
        'type': 'background',
        'subject': {
          'nids': [1, 2],
          'delete-multiple': true,
        },
      };

      await PushUtils.onMessage(_encryptPushNotifications(keypair, [payload]), account.id);

      verify(() => localNotificationsPlatform.cancel(PushUtils.getNotificationID(account.id, 1))).called(1);
      verify(() => localNotificationsPlatform.cancel(PushUtils.getNotificationID(account.id, 2))).called(1);
      verify(() => localNotificationsPlatform.getActiveNotifications()).called(1);
    });

    test('Delete all', () async {
      final payload = {
        'priority': '',
        'type': 'background',
        'subject': {
          'delete-all': true,
        },
      };

      await PushUtils.onMessage(_encryptPushNotifications(keypair, [payload]), account.id);

      verify(() => localNotificationsPlatform.cancelAll()).called(1);
      verify(() => localNotificationsPlatform.getActiveNotifications()).called(1);
    });

    test('Background', () async {
      final payload = {
        'priority': '',
        'type': 'background',
        'subject': <String, dynamic>{},
      };

      await PushUtils.onMessage(_encryptPushNotifications(keypair, [payload]), account.id);
      verify(() => localNotificationsPlatform.getActiveNotifications()).called(1);
    });

    test('Cancel summary notification', () async {
      when(() => localNotificationsPlatform.getActiveNotifications()).thenAnswer(
        (_) async => [
          const ActiveNotification(
            id: 123,
            groupKey: 'app1',
          ),
          const ActiveNotification(
            id: 456,
            groupKey: 'app2',
          ),
          const ActiveNotification(
            id: 789,
            groupKey: 'app2',
          ),
        ],
      );

      final payload = {
        'priority': '',
        'type': 'background',
        'subject': {
          'nid': 1,
          'delete': true,
        },
      };

      await PushUtils.onMessage(_encryptPushNotifications(keypair, [payload]), account.id);

      verify(() => localNotificationsPlatform.cancel(PushUtils.getNotificationID(account.id, 1))).called(1);
      verify(() => localNotificationsPlatform.getActiveNotifications()).called(1);
      verify(() => localNotificationsPlatform.cancel(PushUtils.getGroupSummaryID(account.id, 'app1'))).called(1);
    });

    group('Message', () {
      late SingleValueStore accountsPersistence;
      late SingleValueStore lastUsedAccountPersistence;

      setUp(() {
        accountsPersistence = _SingleValueStoreMock();
        when(() => accountsPersistence.hasValue()).thenReturn(true);
        when(() => accountsPersistence.getStringList()).thenReturn(BuiltList([json.encode(credentials.toJson())]));

        lastUsedAccountPersistence = _SingleValueStoreMock();

        when(() => storage.singleValueStore(StorageKeys.accounts)).thenReturn(accountsPersistence);
        when(() => storage.singleValueStore(StorageKeys.lastUsedAccount)).thenReturn(lastUsedAccountPersistence);
      });

      tearDown(() async {
        verify(() => storage.singleValueStore(StorageKeys.accounts)).called(1);
        verify(() => storage.singleValueStore(StorageKeys.lastUsedAccount)).called(1);
        verify(() => storage.cookieStore(accountID: account.id, serverURL: credentials.serverURL)).called(1);

        verify(() => accountsPersistence.hasValue()).called(1);
        verify(() => accountsPersistence.getStringList()).called(1);
        verifyNoMoreInteractions(accountsPersistence);

        verifyNoMoreInteractions(lastUsedAccountPersistence);
      });

      test('On click', () async {
        final notification = {
          'priority': '',
          'type': '',
          'subject': {
            'nid': 1,
            'app': 'app',
            'subject': 'subject',
            'type': 'type',
            'id': 'id',
          },
        };
        final payload = json.encode({
          'accountID': account.id,
          ...notification,
        });

        await PushUtils.onMessage(_encryptPushNotifications(keypair, [notification]), account.id);

        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getNotificationID(account.id, 1),
            'subject',
            null,
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'app' &&
                    d.channelName == 'app' &&
                    d.subText == null &&
                    d.groupKey == 'app' &&
                    d.icon == null &&
                    d.largeIcon == null &&
                    d.when == null &&
                    d.color == NcColors.primary &&
                    d.category == null &&
                    d.importance == Importance.max &&
                    d.priority == Priority.defaultPriority,
              ),
            ),
            payload: payload,
          ),
        ).called(1);
        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getGroupSummaryID(account.id, 'app'),
            null,
            null,
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'app' &&
                    d.channelName == 'app' &&
                    d.subText == null &&
                    d.groupKey == 'app' &&
                    d.icon == null &&
                    d.largeIcon == null &&
                    d.when == null &&
                    d.color == NcColors.primary &&
                    d.category == null &&
                    d.importance == Importance.defaultImportance &&
                    d.priority == Priority.defaultPriority,
              ),
            ),
          ),
        ).called(1);

        onDidReceiveNotificationResponseCallback(
          NotificationResponse(
            notificationResponseType: NotificationResponseType.selectedNotification,
            payload: payload,
          ),
        );

        verify(
          () => onLocalNotificationClickedCallback(
            PushNotification.fromJson(json.decode(payload) as Map<String, dynamic>),
          ),
        ).called(1);
      });

      test('With notification and icon', () async {
        final notificationDate = tz.TZDateTime.utc(2024, 10, 4, 16, 15, 24);
        final notification = {
          'priority': '',
          'type': '',
          'subject': {
            'nid': 1,
            'app': 'app',
            'subject': 'subject',
            'type': 'type',
            'id': 'id',
          },
        };
        final payload = json.encode({
          'accountID': account.id,
          ...notification,
        });

        registerFallbackValue(Uri());
        registerFallbackValue(BuiltMap<String, String>());
        registerFallbackValue(Uint8List(0));

        final httpRequest = _HttpRequestCallbackMock();
        when(
          () => httpRequest(
            'GET',
            Uri.parse('${credentials.serverURL}/ocs/v2.php/apps/notifications/api/v2/notifications/1'),
            BuiltMap({
              'Accept': 'application/json',
              'Authorization': 'Bearer appPassword',
              'OCS-APIRequest': 'true',
              'user-agent': 'Neon 1.0.0+1',
            }),
            Uint8List(0),
          ),
        ).thenAnswer(
          (_) => http.StreamedResponse(
            Stream.value(
              utf8.encode(
                json.encode({
                  'ocs': {
                    'meta': {'status': '', 'statuscode': 0},
                    'data': {
                      'notification_id': 1,
                      'app': 'files',
                      'user': 'user',
                      'datetime': notificationDate.toIso8601String(),
                      'object_type': 'object_type',
                      'object_id': 'object_id',
                      'subject': 'other subject',
                      'message': 'message',
                      'link': 'https://example.com/link',
                      'actions': <dynamic>[],
                      'icon': 'https://example.com/image.svg',
                    },
                  },
                }),
              ),
            ),
            200,
            headers: {
              'content-type': 'application/json',
            },
          ),
        );
        when(
          () => httpRequest(
            'GET',
            Uri.parse('https://example.com/image.svg'),
            BuiltMap({
              'Authorization': 'Bearer appPassword',
              'user-agent': 'Neon 1.0.0+1',
            }),
            Uint8List(0),
          ),
        ).thenAnswer(
          (_) => http.StreamedResponse(
            Stream.value(
              utf8.encode(
                '<svg width="1" height="1" xmlns="http://www.w3.org/2000/svg"><rect style="fill:red" width="1" height="1"/></svg>',
              ),
            ),
            200,
            headers: {
              'content-type': 'image/svg+xml',
            },
          ),
        );

        await PushUtils.onMessage(
          _encryptPushNotifications(keypair, [notification]),
          account.id,
          httpClient: _HttpClientMock(httpRequest),
        );

        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getNotificationID(account.id, 1),
            'Files: other subject',
            'message',
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'files' &&
                    d.channelName == 'Files' &&
                    d.subText == null &&
                    d.groupKey == 'files' &&
                    d.icon == null &&
                    d.largeIcon != null &&
                    d.when == notificationDate.millisecondsSinceEpoch &&
                    d.color == NcColors.primary &&
                    d.category == null &&
                    d.importance == Importance.max &&
                    d.priority == Priority.defaultPriority,
              ),
            ),
            payload: payload,
          ),
        ).called(1);
        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getGroupSummaryID(account.id, 'files'),
            null,
            null,
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'files' &&
                    d.channelName == 'Files' &&
                    d.subText == null &&
                    d.groupKey == 'files' &&
                    d.icon == null &&
                    d.largeIcon == null &&
                    d.when == null &&
                    d.color == NcColors.primary &&
                    d.category == null &&
                    d.importance == Importance.defaultImportance &&
                    d.priority == Priority.defaultPriority,
              ),
            ),
          ),
        ).called(1);

        verify(() => storage.requestCache).called(1);
      });

      test('VoIP', () async {
        final notification = {
          'priority': 'high',
          'type': 'voip',
          'subject': {
            'nid': 1,
            'app': 'app',
            'subject': 'subject',
            'type': 'type',
            'id': 'id',
          },
        };
        final payload = json.encode({
          'accountID': account.id,
          ...notification,
        });

        await PushUtils.onMessage(_encryptPushNotifications(keypair, [notification]), account.id);

        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getNotificationID(account.id, 1),
            'subject',
            null,
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'app' &&
                    d.channelName == 'app' &&
                    d.subText == null &&
                    d.groupKey == 'app' &&
                    d.icon == null &&
                    d.largeIcon == null &&
                    d.when == null &&
                    d.color == NcColors.primary &&
                    d.category == AndroidNotificationCategory.call &&
                    d.importance == Importance.max &&
                    d.priority == Priority.max,
              ),
            ),
            payload: payload,
          ),
        ).called(1);
        verify(
          () => localNotificationsPlatform.show(
            PushUtils.getGroupSummaryID(account.id, 'app'),
            null,
            null,
            notificationDetails: any(
              named: 'notificationDetails',
              that: predicate<AndroidNotificationDetails>(
                (d) =>
                    d.channelId == 'app' &&
                    d.channelName == 'app' &&
                    d.subText == null &&
                    d.groupKey == 'app' &&
                    d.icon == null &&
                    d.largeIcon == null &&
                    d.when == null &&
                    d.color == NcColors.primary &&
                    d.category == null &&
                    d.importance == Importance.defaultImportance &&
                    d.priority == Priority.defaultPriority,
              ),
            ),
          ),
        ).called(1);
      });
    });
  });
}
