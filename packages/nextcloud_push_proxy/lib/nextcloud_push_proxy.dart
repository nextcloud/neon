// ignore_for_file: public_member_api_docs

library nextcloud_push_proxy;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

/// Implements the listening part of a Nextcloud push proxy
class NextcloudPushProxy {
  HttpServer? _server;

  late StreamController<PushProxyDevice> _onNewDeviceController;
  late StreamController<PushProxyNotification> _onNewNotificationController;

  Stream<PushProxyDevice>? _onNewDeviceStream;
  Stream<PushProxyNotification>? _onNewNotificationStream;

  /// Listens for new devices
  Stream<PushProxyDevice> get onNewDevice {
    if (_onNewDeviceStream == null) {
      throw Exception('Server not created');
    }
    return _onNewDeviceStream!;
  }

  /// Listens for new notifications
  Stream<PushProxyNotification> get onNewNotification {
    if (_onNewNotificationStream == null) {
      throw Exception('Server not created');
    }
    return _onNewNotificationStream!;
  }

  late final _router = Router()
    ..post('/devices', _devicesHandler)
    ..post('/notifications', _notificationsHandler)
    ..get('/health', (final _) async => Response.ok(''));

  Future<Response> _devicesHandler(Request request) async {
    final data = Uri(query: await request.readAsString()).queryParameters;
    _onNewDeviceController.add(
      PushProxyDevice(
        pushToken: data['pushToken']!,
        deviceIdentifier: data['deviceIdentifier']!,
        deviceIdentifierSignature: data['deviceIdentifierSignature']!,
        userPublicKey: data['userPublicKey']!,
      ),
    );
    return Response.ok('');
  }

  Future<Response> _notificationsHandler(Request request) async {
    final data = Uri(query: await request.readAsString()).queryParameters;
    for (final notification in data.values) {
      final notificationData = json.decode(notification) as Map<String, dynamic>;
      _onNewNotificationController.add(
        PushProxyNotification(
          deviceIdentifier: notificationData['deviceIdentifier']! as String,
          pushTokenHash: notificationData['pushTokenHash']! as String,
          subject: notificationData['subject']! as String,
          signature: notificationData['signature']! as String,
          priority: notificationData['priority']! as String,
          type: notificationData['type']! as String,
        ),
      );
    }
    return Response.ok('');
  }

  /// Creates a server listening on the [port]
  Future create({
    final bool logging = true,
    final int port = 8080,
  }) async {
    if (_server != null) {
      throw Exception('Server already created');
    }

    _onNewDeviceController = StreamController<PushProxyDevice>();
    _onNewNotificationController = StreamController<PushProxyNotification>();
    _onNewDeviceStream = _onNewDeviceController.stream.asBroadcastStream();
    _onNewNotificationStream = _onNewNotificationController.stream.asBroadcastStream();

    var handler = Cascade().add(_router).handler;
    if (logging) {
      handler = logRequests().addHandler(handler);
    }
    final server = await serve(
      handler,
      InternetAddress.anyIPv4,
      port,
    );
    server.autoCompress = true;

    _server = server;
  }

  /// Closes the server
  Future close() async {
    if (_server != null) {
      await _server!.close();
      _server = null;
      await _onNewDeviceController.close();
      await _onNewNotificationController.close();
    }
  }
}

class PushProxyDevice {
  PushProxyDevice({
    required this.pushToken,
    required this.deviceIdentifier,
    required this.deviceIdentifierSignature,
    required this.userPublicKey,
  });

  factory PushProxyDevice.fromJson(Map<String, dynamic> data) => PushProxyDevice(
        pushToken: data['pushToken'] as String,
        deviceIdentifier: data['deviceIdentifier'] as String,
        deviceIdentifierSignature: data['deviceIdentifierSignature'] as String,
        userPublicKey: data['userPublicKey'] as String,
      );

  Map<String, dynamic> toJson() => {
        'pushToken': pushToken,
        'deviceIdentifier': deviceIdentifier,
        'deviceIdentifierSignature': deviceIdentifierSignature,
        'userPublicKey': userPublicKey,
      };

  final String pushToken;
  final String deviceIdentifier;
  final String deviceIdentifierSignature;
  final String userPublicKey;
}

class PushProxyNotification {
  PushProxyNotification({
    required this.deviceIdentifier,
    required this.pushTokenHash,
    required this.subject,
    required this.signature,
    required this.priority,
    required this.type,
  });

  final String deviceIdentifier;
  final String pushTokenHash;
  final String subject;
  final String signature;
  final String priority;
  final String type;

  Map<String, String> toPushNotificationData() => {
        'subject': subject,
        'signature': signature,
        'priority': priority,
        'type': type,
      };
}
