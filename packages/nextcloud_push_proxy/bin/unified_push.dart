import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:nextcloud_push_proxy/nextcloud_push_proxy.dart';

Future main(final List<String> args) async {
  if (args.length != 1) {
    throw Exception('Provide the file where to store devices');
  }
  final devices = <PushProxyDevice>[];
  final devicesFile = File(args[0]);
  if (devicesFile.existsSync()) {
    devices.addAll(
      (json.decode(devicesFile.readAsStringSync()) as List)
          .map((final d) => PushProxyDevice.fromJson(d as Map<String, dynamic>)),
    );
  }

  final server = NextcloudPushProxy();

  watchSignals((final signal) async {
    print('Got exit signal, shutting down');
    await server.close();
    exit(1);
  });

  await server.create();

  server.onNewDevice.listen((final device) {
    if (!devices.map((final d) => d.pushToken).contains(device.pushToken)) {
      devices.add(device);
      devicesFile
        ..createSync(recursive: true)
        ..writeAsString(json.encode(devices.map((final d) => d.toJson()).toList()));
    }
  });

  server.onNewNotification.listen((final notification) async {
    for (final device in devices) {
      if (notification.pushTokenHash == sha512.convert(utf8.encode(device.pushToken)).toString()) {
        final request = await HttpClient().postUrl(Uri.parse(device.pushToken))
          ..followRedirects = false
          ..persistentConnection = true
          ..add(utf8.encode(json.encode(notification.toPushNotificationData())));

        final response = await request.close();
        if (response.statusCode > 299) {
          print('Failed to send notification');
        }
      }
    }
  });

  print('Listening on *:8080');
}

void watchSignals(final Function(ProcessSignal signal) callback) {
  for (final signal in [
    ProcessSignal.sighup,
    ProcessSignal.sigint,
    ProcessSignal.sigterm,
    ProcessSignal.sigusr1,
    ProcessSignal.sigusr2,
  ]) {
    signal.watch().listen(callback);
  }
}
