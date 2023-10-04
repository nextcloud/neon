import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';

/// The signature of a function reviving image data from the [cache].
typedef CacheReviver = FutureOr<Uint8List?> Function(CacheManager cache);

/// The signature of a function downloading image data.
typedef ImageDownloader = FutureOr<Uint8List> Function();

/// The signature of a function writing [image] data to the [cache].
typedef CacheWriter = Future<void> Function(CacheManager cache, Uint8List image);

/// The signature of a function building a widget displaying [error].
typedef ErrorWidgetBuilder = Widget? Function(BuildContext context, Object? error);

/// The signature of a function downloading image data from a the nextcloud api through [client].
typedef ApiImageDownloader = FutureOr<DynamiteResponse<Uint8List, dynamic>> Function(NextcloudClient client);

/// A widget painting an Image.
///
/// The image is cached in the [DefaultCacheManager] to avoid expensive
/// fetches.
///
/// See:
///  * [NeonApiImage] for an image from the [NextcloudClient]
///  * [NeonImageWrapper] for a wrapping widget for images
class NeonCachedImage extends StatefulWidget {
  /// Prints the data from [image] to the canvas.
  ///
  /// The data is not persisted in the cache.
  NeonCachedImage({
    required final Uint8List image,
    required Key super.key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
  }) : image = Future.value(image);

  /// Fetches the image from [url].
  ///
  /// The image is automatically cached.
  NeonCachedImage.url({
    required final String url,
    final Account? account,
    final Key? key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
  })  : image = _getImageFromUrl(url, account),
        super(key: key ?? Key(url));

  /// Custom image implementation.
  ///
  /// It is possible to provide custom [reviver] and [writeCache] functions to
  /// adjust the caching.
  NeonCachedImage.custom({
    required final ImageDownloader getImage,
    required final String cacheKey,
    final CacheReviver? reviver,
    final CacheWriter? writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
  })  : image = _customImageGetter(
          reviver,
          getImage,
          writeCache,
          cacheKey,
        ),
        super(key: Key(cacheKey));

  /// The image content.
  final Future<Uint8List> image;

  /// {@template NeonCachedImage.svgHint}
  /// Hint whether the image is an SVG.
  /// {@endtemplate}
  final bool isSvgHint;

  /// {@template NeonCachedImage.size}
  /// Dimensions for the painted image.
  /// {@endtemplate}
  final Size? size;

  /// {@template NeonCachedImage.fit}
  /// How to inscribe the image into the space allocated during layout.
  /// {@endtemplate}
  final BoxFit? fit;

  /// {@template NeonCachedImage.svgColorFilter}
  /// The color filter to use when drawing SVGs.
  /// {@endtemplate}
  final ColorFilter? svgColorFilter;

  /// {@template NeonCachedImage.errorBuilder}
  /// Builder function building the error widget.
  ///
  /// Defaults to a [NeonError] awaiting [image] again onRetry.
  /// {@endtemplate}
  final ErrorWidgetBuilder? errorBuilder;

  static Future<Uint8List> _getImageFromUrl(final String url, final Account? account) async {
    var uri = Uri.parse(url);
    if (account != null) {
      uri = account.completeUri(uri);
    }
    final file = await _cacheManager.getSingleFile(
      uri.toString(),
      headers: account != null && uri.host == account.serverURL.host && account.client.authentications.isNotEmpty
          ? account.client.authentications.first.headers
          : null,
    );
    return file.readAsBytes();
  }

  static Future<Uint8List> _customImageGetter(
    final CacheReviver? checkCache,
    final ImageDownloader getImage,
    final CacheWriter? writeCache,
    final String cacheKey,
  ) async {
    final cached = await checkCache?.call(_cacheManager) ?? await _defaultCacheReviver(cacheKey);
    if (cached != null) {
      return cached;
    }

    final data = await getImage();

    unawaited(writeCache?.call(_cacheManager, data) ?? _defaultCacheWriter(data, cacheKey));

    return data;
  }

  static Future<Uint8List?> _defaultCacheReviver(final String cacheKey) async {
    final cacheFile = await _cacheManager.getFileFromCache(cacheKey);
    if (cacheFile != null && cacheFile.validTill.isAfter(DateTime.now())) {
      return cacheFile.file.readAsBytes();
    }

    return null;
  }

  static Future<void> _defaultCacheWriter(
    final Uint8List data,
    final String cacheKey,
  ) async {
    await _cacheManager.putFile(
      cacheKey,
      data,
      maxAge: const Duration(days: 7),
    );
  }

  static final _cacheManager = DefaultCacheManager();

  @override
  State<NeonCachedImage> createState() => _NeonCachedImageState();
}

class _NeonCachedImageState extends State<NeonCachedImage> {
  @override
  Widget build(final BuildContext context) => Center(
        child: FutureBuilder(
          future: widget.image,
          builder: (final context, final fileSnapshot) {
            if (fileSnapshot.hasError) {
              return _buildError(fileSnapshot.error);
            }

            if (!fileSnapshot.hasData) {
              return SizedBox(
                width: widget.size?.width,
                child: const NeonLinearProgressIndicator(),
              );
            }

            final content = fileSnapshot.requireData;

            try {
              // TODO: Is this safe enough?
              if (widget.isSvgHint || utf8.decode(content).contains('<svg')) {
                return SvgPicture.memory(
                  content,
                  height: widget.size?.height,
                  width: widget.size?.width,
                  fit: widget.fit ?? BoxFit.contain,
                  colorFilter: widget.svgColorFilter,
                );
              }
            } catch (_) {
              // If the data is not UTF-8
            }

            return Image.memory(
              content,
              height: widget.size?.height,
              width: widget.size?.width,
              fit: widget.fit,
              gaplessPlayback: true,
              errorBuilder: (final context, final error, final stacktrace) => _buildError(error),
            );
          },
        ),
      );

  Widget _buildError(final Object? error) =>
      widget.errorBuilder?.call(context, error) ??
      NeonError(
        error,
        onRetry: () {
          setState(() {});
        },
        onlyIcon: true,
        iconSize: widget.size?.shortestSide,
      );
}

/// Nextcloud API image.
///
/// Extension for [NeonCachedImage] providing a [NextcloudClient] to the caller
/// to retrieve the image.
///
/// See:
///  * [NeonCachedImage] for a customized image
///  * [NeonImageWrapper] for a wrapping widget for images
class NeonApiImage extends StatelessWidget {
  /// Creates a new Neon API image with the active account.
  ///
  /// Use [NeonApiImage.custom] to specify fetching the image with a different account.
  const NeonApiImage({
    required this.getImage,
    required this.cacheKey,
    this.reviver,
    this.writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  }) : account = null;

  /// Creates a new Neon API image for a given account.
  ///
  /// Use [NeonApiImage] to fetch the image with the currently active account.
  const NeonApiImage.custom({
    required this.getImage,
    required this.cacheKey,
    required Account this.account,
    this.reviver,
    this.writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  });

  /// Optional account to use for the request.
  ///
  /// Defaults to the currently active account in [AccountsBloc.activeAccount].
  /// Use the [NeonApiImage.custom] constructor to specify a different account.
  final Account? account;

  /// Image downloader.
  final ApiImageDownloader getImage;

  /// Cache key used for [NeonCachedImage.key].
  final String cacheKey;

  /// Custom cache reviver function.
  final CacheReviver? reviver;

  /// Custom cache writer function.
  final CacheWriter? writeCache;

  /// {@macro NeonCachedImage.svgHint}
  final bool isSvgHint;

  /// {@macro NeonCachedImage.size}
  final Size? size;

  /// {@macro NeonCachedImage.fit}
  final BoxFit? fit;

  /// {@macro NeonCachedImage.svgColorFilter}
  final ColorFilter? svgColorFilter;

  /// {@macro NeonCachedImage.errorBuilder}
  final ErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(final BuildContext context) {
    final account = this.account ?? NeonProvider.of<AccountsBloc>(context).activeAccount.value!;

    return NeonCachedImage.custom(
      getImage: () async {
        final response = await getImage(account.client);
        return response.body;
      },
      cacheKey: '${account.id}-$cacheKey',
      reviver: reviver,
      writeCache: writeCache,
      isSvgHint: isSvgHint,
      size: size,
      fit: fit,
      svgColorFilter: svgColorFilter,
      errorBuilder: errorBuilder,
    );
  }
}

/// Nextcloud image wrapper widget.
///
/// Wraps a child (most commonly an image) into a uniformly styled container.
///
/// See:
///  * [NeonCachedImage] for a customized image
///  * [NeonApiImage] for an image widget from a [NextcloudClient].
class NeonImageWrapper extends StatelessWidget {
  /// Creates a new image wrapper.
  const NeonImageWrapper({
    required this.child,
    this.color = Colors.white,
    this.size,
    this.borderRadius,
    super.key,
  });

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The color to paint the background area with.
  final Color color;

  /// The size of the widget.
  final Size? size;

  /// The corners of this box are rounded by this [BorderRadius].
  ///
  /// If null defaults to `const BorderRadius.all(Radius.circular(8))`.
  ///
  /// {@macro flutter.painting.BoxDecoration.clip}
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => Container(
        height: size?.height,
        width: size?.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(8)),
          color: color,
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      );
}
