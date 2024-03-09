import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/image_utils.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

/// The signature of a function building a widget displaying [error].
typedef ErrorWidgetBuilder = Widget? Function(
  BuildContext context,
  Object? error,
);

/// The signature of a function downloading image data from a the nextcloud api
/// through [client].
typedef ApiImageDownloader = FutureOr<DynamiteResponse<Uint8List, dynamic>>
    Function(NextcloudClient client);

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
            errorBuilder: (context, error, stacktrace) =>
                _buildError(context, error),
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
  /// Creates a new Neon API image fetching the image with the currently active
  /// account.
  ///
  /// See [NeonApiImage.withAccount] to fetch the image using with a account.
  const NeonApiImage({
    required this.getImage,
    required this.cacheKey,
    required this.etag,
    required this.expires,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  }) : account = null;

  /// Creates a new Neon API image fetching the image with the given [account].
  ///
  /// See [NeonApiImage] to fetch the image using the currently active account.
  const NeonApiImage.withAccount({
    required this.getImage,
    required this.cacheKey,
    required this.etag,
    required this.expires,
    required Account this.account,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  });

  /// The account to use for the request.
  ///
  /// Defaults to the currently active account in [AccountsBloc.activeAccount].
  final Account? account;

  /// Callback for downloading the image data.
  final ApiImageDownloader getImage;

  /// The unique key used for caching the image.
  final String cacheKey;

  /// The ETag used for invalidating the cache.
  final String? etag;

  /// The expiration date used for invalidating the cache.
  final DateTime? expires;

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

  @override
  State<NeonApiImage> createState() => _NeonApiImageState();
}

class _NeonApiImageState extends State<NeonApiImage> {
  late Account account;
  final image = BehaviorSubject<Result<Uint8List>>();

  @override
  void initState() {
    super.initState();

    account = widget.account ??
        NeonProvider.of<AccountsBloc>(context).activeAccount.value!;

    unawaited(load());
  }

  @override
  void dispose() {
    unawaited(image.close());

    super.dispose();
  }

  Future<void> load() async {
    await RequestManager.instance.wrapBinary(
      account: account,
      cacheKey: widget.cacheKey,
      getCacheParameters: () async => CacheParameters(
        etag: widget.etag,
        expires: widget.expires,
      ),
      rawResponse: () async => widget.getImage(account.client),
      unwrap: (data) {
        try {
          return utf8
              .encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
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
  ///
  /// See [NeonUriImage.withAccount] for using a specific account.
  const NeonUriImage({
    required this.uri,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  }) : account = null;

  /// Creates a new Neon URL image with the given [account].
  ///
  /// See [NeonUriImage] for using the active account.
  const NeonUriImage.withAccount({
    required this.uri,
    required Account this.account,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColorFilter,
    this.errorBuilder,
    super.key,
  });

  /// The account to use for the request.
  ///
  /// Defaults to the currently active account in [AccountsBloc.activeAccount].
  final Account? account;

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

  @override
  State<NeonUriImage> createState() => _NeonUriImageState();
}

class _NeonUriImageState extends State<NeonUriImage> {
  late Account account;
  final image = BehaviorSubject<Result<Uint8List>>();

  @override
  void initState() {
    super.initState();

    account = widget.account ??
        NeonProvider.of<AccountsBloc>(context).activeAccount.value!;

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

    final completedUri = account.completeUri(widget.uri);

    await RequestManager.instance.wrapUri(
      account: account,
      uri: completedUri,
      unwrap: (data) {
        try {
          return utf8
              .encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
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
      isSvgHint: widget.isSvgHint ||
          (widget.uri.data?.mimeType.contains('svg') ?? false),
      size: widget.size,
      fit: widget.fit,
      svgColorFilter: widget.svgColorFilter,
      errorBuilder: widget.errorBuilder,
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
  /// The shape or the [borderRadius] won't clip the children of the decorated
  /// [Container]. If the clip is required, insert a clip widget
  /// (e.g., [ClipRect], [ClipRRect], [ClipPath]) as the child of the
  /// [Container]. Be aware that clipping may be costly in terms of performance.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.height,
      width: size?.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
