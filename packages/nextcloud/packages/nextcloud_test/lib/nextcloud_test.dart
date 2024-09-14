/// Nextcloud test library.
///
/// Handles the server setup and allows to run tests against different test presets.
/// All http requests of a test will be validated against predefined fixtures.
library;

export 'src/nextcloud_test.dart' show NextcloudTester, NextcloudTesterCallback, closeFixture, presets, resetFixture;
