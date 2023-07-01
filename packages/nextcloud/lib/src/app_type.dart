/// Different app types to register for
enum AppType {
  /// Will only receive Talk notifications
  talk('Mozilla/5.0 (Android) Nextcloud-Talk'),

  /// Will receive all notifications except Talk notifications if another Talk
  /// app is already registered for the user
  nextcloud('Mozilla/5.0 (Android) Nextcloud-android'),

  /// Default. Same problem with notifications as the [nextcloud] type
  unknown(null);

  // ignore: public_member_api_docs
  const AppType(this.userAgent);

  // ignore: public_member_api_docs
  final String? userAgent;
}
