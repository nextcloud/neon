import 'dart:math';

/// The default username used in nextcloud tests.
const String defaultTestUsername = 'user1';

/// Generates a random unprivileged port.
int randomPort() => 1024 + Random().nextInt(65535 - 1024);
