import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/src/blocs/push_notifications.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _PermissionHandlerPlatformMock extends Mock
    with MockPlatformInterfaceMixin
    implements PermissionHandlerPlatform {}

// ignore: missing_override_of_must_be_overridden
class _SelectOptionMock<T> extends Mock implements SelectOption<T> {}

class _GlobalOptionsMock extends Mock implements GlobalOptions {}

class _NotificationsPushRepositoryMock extends Mock implements NotificationsPushRepository {}

void main() {
  late PermissionHandlerPlatform permissionHandlerPlatform;
  void Function()? listener;
  late SelectOption<String?> distributorOption;
  late GlobalOptions globalOptions;
  late NotificationsPushRepository notificationsPushRepository;
  late PushNotificationsBloc pushNotificationsBloc;

  setUp(() {
    permissionHandlerPlatform = _PermissionHandlerPlatformMock();
    PermissionHandlerPlatform.instance = permissionHandlerPlatform;

    distributorOption = _SelectOptionMock<String?>();
    when(() => distributorOption.addListener(any())).thenAnswer((invocation) {
      listener = invocation.positionalArguments[0] as void Function();
    });
    when(() => distributorOption.removeListener(any())).thenAnswer((invocation) {
      listener = null;
    });

    globalOptions = _GlobalOptionsMock();
    when(() => globalOptions.pushNotificationsDistributor).thenReturn(distributorOption);

    notificationsPushRepository = _NotificationsPushRepositoryMock();
    // ignore: discarded_futures
    when(() => notificationsPushRepository.changeDistributor(any())).thenAnswer((_) async {});
  });

  tearDown(() {
    pushNotificationsBloc.dispose();
    verify(() => globalOptions.pushNotificationsDistributor).called(1);
    verify(() => distributorOption.removeListener(any())).called(1);
    expect(listener, null);

    verifyNoMoreInteractions(permissionHandlerPlatform);
    verifyNoMoreInteractions(distributorOption);
    verifyNoMoreInteractions(globalOptions);
    verifyNoMoreInteractions(notificationsPushRepository);
  });

  test('null', () async {
    when(() => distributorOption.value).thenReturn(null);

    pushNotificationsBloc = PushNotificationsBloc(
      globalOptions: globalOptions,
      notificationsPushRepository: notificationsPushRepository,
    );
    await Future<void>.delayed(const Duration(milliseconds: 1));

    verify(() => distributorOption.addListener(any())).called(1);
    verify(() => globalOptions.pushNotificationsDistributor).called(2);
    verify(() => distributorOption.value).called(1);
    verify(() => notificationsPushRepository.changeDistributor(null)).called(1);

    listener!();
    await Future<void>.delayed(const Duration(milliseconds: 1));

    verify(() => globalOptions.pushNotificationsDistributor).called(1);
    verify(() => distributorOption.value).called(1);
    verify(() => notificationsPushRepository.changeDistributor(null)).called(1);
  });

  group('Permission', () {
    test('Granted', () async {
      when(() => distributorOption.value).thenReturn('distributor');

      when(() => permissionHandlerPlatform.requestPermissions(any())).thenAnswer(
        (invocation) async => {
          for (final permission in invocation.positionalArguments[0] as List<Permission>)
            permission: PermissionStatus.granted,
        },
      );

      pushNotificationsBloc = PushNotificationsBloc(
        globalOptions: globalOptions,
        notificationsPushRepository: notificationsPushRepository,
      );
      await Future<void>.delayed(const Duration(milliseconds: 1));

      verify(() => distributorOption.addListener(any())).called(1);
      verify(() => globalOptions.pushNotificationsDistributor).called(2);
      verify(() => distributorOption.value).called(1);
      verify(() => permissionHandlerPlatform.requestPermissions(any(that: containsAll([Permission.notification]))))
          .called(1);
      verify(() => notificationsPushRepository.changeDistributor('distributor')).called(1);

      listener!();
      await Future<void>.delayed(const Duration(milliseconds: 1));

      verify(() => globalOptions.pushNotificationsDistributor).called(1);
      verify(() => distributorOption.value).called(1);
      verify(() => permissionHandlerPlatform.requestPermissions(any(that: containsAll([Permission.notification]))))
          .called(1);
      verify(() => notificationsPushRepository.changeDistributor('distributor')).called(1);
    });

    test('Denied', () async {
      when(() => distributorOption.value).thenReturn('distributor');

      when(() => permissionHandlerPlatform.requestPermissions(any())).thenAnswer(
        (invocation) async => {
          for (final permission in invocation.positionalArguments[0] as List<Permission>)
            permission: PermissionStatus.denied,
        },
      );

      pushNotificationsBloc = PushNotificationsBloc(
        globalOptions: globalOptions,
        notificationsPushRepository: notificationsPushRepository,
      );
      await Future<void>.delayed(const Duration(milliseconds: 1));

      verify(() => distributorOption.addListener(any())).called(1);
      verify(() => globalOptions.pushNotificationsDistributor).called(3);
      verify(() => distributorOption.value).called(1);
      verify(() => permissionHandlerPlatform.requestPermissions(any(that: containsAll([Permission.notification]))))
          .called(1);
      verify(() => distributorOption.reset()).called(1);

      listener!();
      await Future<void>.delayed(const Duration(milliseconds: 1));

      verify(() => globalOptions.pushNotificationsDistributor).called(2);
      verify(() => distributorOption.value).called(1);
      verify(() => permissionHandlerPlatform.requestPermissions(any(that: containsAll([Permission.notification]))))
          .called(1);
      verify(() => distributorOption.reset()).called(1);
    });
  });
}
