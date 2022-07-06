import 'dart:typed_data';

import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/core/api.dart';

// ignore: public_member_api_docs
class NextcloudCoreClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudCoreClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: baseURL,
              authentication: authentication,
            ),
          ),
        );

  @override
  @Deprecated('Use getPreviewBytes instead')
  Future<String?> getPreview({
    final String? file,
    final int? x,
    final int? y,
    final String? mode,
    final bool? forceIcon,
    final bool? a,
  }) =>
      throw Exception('Use getPreviewBytes instead');

  /// Gets a preview image as bytes.
  ///
  /// The automatically generated method returns a String which is quite annoying in most cases, so this wraps around it.
  Future<Uint8List?> getPreviewBytes(
    final String file, {
    final int? width,
    final int? height,
    final String? mode,
    final bool? forceIcon,
    final bool? crop,
  }) async {
    final data = (await super.getPreview(
      file: file,
      x: width,
      y: height,
      mode: mode,
      forceIcon: forceIcon,
      a: crop,
    ))
        ?.codeUnits;
    if (data != null) {
      return Uint8List.fromList(data);
    }
    return null;
  }

  @override
  @Deprecated('Use getAvatarBytes instead')
  Future<String?> getAvatar(
    final String userId,
    final int size,
  ) =>
      throw Exception('Use getAvatarBytes instead');

  /// Gets a avatar image as bytes.
  ///
  /// The automatically generated method returns a String which is quite annoying in most cases, so this wraps around it.
  Future<Uint8List?> getAvatarBytes(
    final String userId,
    final int size,
  ) async {
    final data = (await super.getAvatar(
      userId,
      size,
    ))
        ?.codeUnits;
    if (data != null) {
      return Uint8List.fromList(data);
    }
    return null;
  }
}
