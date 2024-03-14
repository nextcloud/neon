/// Checks whether the server [version] is a dev, beta or RC version.
bool isDevelopmentServerVersion(String version) {
  return version.contains('dev') || version.contains('beta') || version.contains('RC');
}
