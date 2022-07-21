part of '../neon.dart';

class Env {
  Env({
    this.testHost,
    this.testUsername,
    this.testPassword,
  });

  factory Env.fromMap(final Map<String, String> data) => Env(
        testHost: data['TEST_HOST'],
        testUsername: data['TEST_USER'],
        testPassword: data['TEST_PASSWORD'],
      );

  final String? testHost;
  final String? testUsername;
  final String? testPassword;
}
