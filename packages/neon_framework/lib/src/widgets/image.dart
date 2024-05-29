import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/image_utils.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

/// The signature of a function building a widget displaying [error].
typedef ErrorWidgetBuilder = Widget? Function(BuildContext context, Object? error);

/// A widget painting an Image.
///
/// See:
///  * [NeonApiImage] for an image widget from an Nextcloud API endpoint.
///  * [NeonUriImage] for an image widget from an arbitrary URL.
///  * [NeonImageWrapper] for a wrapping widget for images
@internal
class NeonImage extends StatelessWidget {
  /// Custom image implementation.
  const NeonImage({
    required this.image,
    required this.onRetry,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    this.blurHash,
    super.key,
  });

  /// {@template NeonImage.image}
  /// The subject containing the image data.
  /// {@endtemplate}
  final BehaviorSubject<Result<Uint8List>> image;

  /// {@template NeonImage.onRetry}
  /// The function called to retry loading the image if it failed.
  /// {@endtemplate}
  final VoidCallback onRetry;

  /// {@template NeonImage.svgHint}
  /// Hint whether the image is an SVG.
  /// {@endtemplate}
  final bool isSvgHint;

  /// {@template NeonImage.size}
  /// Dimensions for the painted image.
  /// {@endtemplate}
  final Size? size;

  /// {@template NeonImage.fit}
  /// How to inscribe the image into the space allocated during layout.
  /// {@endtemplate}
  final BoxFit? fit;

  /// {@template NeonImage.svgColorFilter}
  /// The color filter to use when drawing SVGs.
  /// {@endtemplate}
  final ColorFilter? svgColorFilter;

  /// {@template NeonImage.errorBuilder}
  /// Builder function building the error widget.
  ///
  /// Defaults to a [NeonError].
  /// {@endtemplate}
  final ErrorWidgetBuilder? errorBuilder;

  /// {@template NeonImage.blurHash}
  /// The compact representation of an image preview.
  ///
  /// See: https://blurha.sh
  /// {@endtemplate}
  final String? blurHash;

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: image,
      builder: (context, imageResult) {
        final data = imageResult.data;
        if (data != null) {
          try {
            // TODO: Is this safe enough?
            if (isSvgHint || utf8.decode(data).contains('<svg')) {
              return SvgPicture.memory(
                data,
                height: size?.height,
                width: size?.width,
                fit: fit ?? BoxFit.contain,
                colorFilter: svgColorFilter,
              );
            }
          } catch (_) {
            // If the data is not UTF-8
          }

          return Image.memory(
            data,
            height: size?.height,
            width: size?.width,
            fit: fit,
            gaplessPlayback: true,
            errorBuilder: (context, error, stacktrace) => _buildError(context, error),
          );
        }

        if (blurHash != null) {
          return BlurHash(
            hash: blurHash!,
            imageFit: fit ?? BoxFit.cover,
            decodingHeight: size?.height.toInt() ?? 32,
            decodingWidth: size?.width.toInt() ?? 32,
          );
        }

        if (imageResult.hasError) {
          return _buildError(context, imageResult.error);
        }

        return SizedBox(
          width: size?.width,
          child: const NeonLinearProgressIndicator(),
        );
      },
    );
  }

  Widget _buildError(BuildContext context, Object? error) =>
      errorBuilder?.call(context, error) ??
      NeonError(
        error,
        onRetry: onRetry,
        type: NeonErrorType.iconOnly,
        iconSize: size?.shortestSide,
      );
}

/// A widget painting an Image fetched from the Nextcloud API.
///
/// The image is cached in the [RequestManager] to avoid expensive
/// fetches.
///
/// See:
///  * [NeonImage] for a customized image
///  * [NeonUriImage] for an image widget from an arbitrary URL.
///  * [NeonImageWrapper] for a wrapping widget for images
class NeonApiImage extends StatefulWidget {
  /// Creates a new Neon API image fetching the image with the currently active account.
  const NeonApiImage({
    required this.getRequest,
    required this.cacheKey,
    required this.etag,
    required this.expires,
    required this.account,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    this.blurHash,
    super.key,
  });

  /// The account to use for the request.
  final Account account;

  /// Callback for creating the HTTP request downloading the image data.
  ///
  /// Every time it is called a new [http.Request] has to be created.
  /// Re-using the same will not work when retrying failed requests.
  final http.Request Function(NextcloudClient) getRequest;

  /// The unique key used for caching the image.
  final String cacheKey;

  /// The ETag used for invalidating the cache.
  final String? etag;

  /// The expiration date used for invalidating the cache.
  final tz.TZDateTime? expires;

  /// {@macro NeonImage.svgHint}
  final bool isSvgHint;

  /// {@macro NeonImage.size}
  final Size? size;

  /// {@macro NeonImage.fit}
  final BoxFit? fit;

  /// {@macro NeonImage.svgColorFilter}
  final ColorFilter? svgColorFilter;

  /// {@macro NeonImage.errorBuilder}
  final ErrorWidgetBuilder? errorBuilder;

  /// {@macro NeonImage.blurHash}
  final String? blurHash;

  @override
  State<NeonApiImage> createState() => _NeonApiImageState();
}

class _NeonApiImageState extends State<NeonApiImage> {
  final image = BehaviorSubject<Result<Uint8List>>();

  @override
  void initState() {
    super.initState();

    unawaited(load());
  }

  @override
  void dispose() {
    unawaited(image.close());

    super.dispose();
  }

  Future<void> load() async {
    await RequestManager.instance.wrapBinary(
      account: widget.account,
      cacheKey: widget.cacheKey,
      getCacheParameters: () async => CacheParameters(
        etag: widget.etag,
        expires: widget.expires,
      ),
      getRequest: () => widget.getRequest(widget.account.client),
      unwrap: (data) {
        try {
          return utf8.encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
        } catch (_) {}
        return data;
      },
      subject: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeonImage(
      image: image,
      onRetry: load,
      isSvgHint: widget.isSvgHint,
      size: widget.size,
      fit: widget.fit,
      svgColorFilter: widget.svgColorFilter,
      errorBuilder: widget.errorBuilder,
      blurHash: widget.blurHash,
    );
  }
}

/// A widget painting an Image fetched from an arbitrary URI.
///
/// The image is cached in the [RequestManager] to avoid expensive
/// fetches.
///
/// See:
///  * [NeonImage] for a customized image
///  * [NeonApiImage] for an image widget from an Nextcloud API endpoint.
///  * [NeonImageWrapper] for a wrapping widget for images
class NeonUriImage extends StatefulWidget {
  /// Creates a new Neon URL image with the active account.
  const NeonUriImage({
    required this.uri,
    required this.account,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    this.blurHash,
    super.key,
  });

  /// The account to use for the request.
  final Account account;

  /// Image URI.
  ///
  /// This can also be a data URI.
  final Uri uri;

  /// {@macro NeonImage.svgHint}
  final bool isSvgHint;

  /// {@macro NeonImage.size}
  final Size? size;

  /// {@macro NeonImage.fit}
  final BoxFit? fit;

  /// {@macro NeonImage.svgColorFilter}
  final ColorFilter? svgColorFilter;

  /// {@macro NeonImage.errorBuilder}
  final ErrorWidgetBuilder? errorBuilder;

  /// {@macro NeonImage.blurHash}
  final String? blurHash;

  @override
  State<NeonUriImage> createState() => _NeonUriImageState();
}

class _NeonUriImageState extends State<NeonUriImage> {
  final image = BehaviorSubject<Result<Uint8List>>();

  @override
  void initState() {
    super.initState();

    unawaited(load());
  }

  @override
  void dispose() {
    unawaited(image.close());

    super.dispose();
  }

  Future<void> load() async {
    if (widget.uri.data != null) {
      var data = widget.uri.data!.contentAsBytes();
      try {
        data = utf8.encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
      } catch (_) {}
      image.add(Result.success(data));
      return;
    }

    final completedUri = widget.account.completeUri(widget.uri);

    await RequestManager.instance.wrapUri(
      account: widget.account,
      uri: completedUri,
      unwrap: (data) {
        try {
          return utf8.encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
        } catch (_) {}
        return data;
      },
      subject: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeonImage(
      image: image,
      onRetry: load,
      isSvgHint: widget.isSvgHint || (widget.uri.data?.mimeType.contains('svg') ?? false),
      size: widget.size,
      fit: widget.fit,
      svgColorFilter: widget.svgColorFilter,
      errorBuilder: widget.errorBuilder,
      blurHash: widget.blurHash,
    );
  }
}

/// Nextcloud image wrapper widget.
///
/// Wraps a child (most commonly an image) into a uniformly styled container.
///
/// See:
///  * [NeonImage] for a customized image
///  * [NeonApiImage] for an image widget from an Nextcloud API endpoint.
///  * [NeonUriImage] for an image widget from an arbitrary URL.
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
  /// The shape or the [borderRadius] won't clip the children of the decorated [Container].
  /// If the clip is required, insert a clip widget (e.g., [ClipRect], [ClipRRect], [ClipPath])
  /// as the child of the [Container]. Be aware that clipping may be costly in terms of performance.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
