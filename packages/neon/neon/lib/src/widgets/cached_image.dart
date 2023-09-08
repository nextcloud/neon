import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:provider/provider.dart';

typedef CacheReviver = FutureOr<Uint8List?> Function(CacheManager cacheManager);
typedef ImageDownloader = FutureOr<Uint8List> Function();
typedef CacheWriter = Future<void> Function(CacheManager cacheManager, Uint8List image);
typedef ErrorWidgetBuilder = Widget? Function(BuildContext, dynamic);

typedef ApiImageDownloader = FutureOr<Uint8List> Function(NextcloudClient client);

class NeonCachedImage extends StatefulWidget {
  const NeonCachedImage({
    required this.image,
    required Key super.key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
    this.errorBuilder,
  });

  NeonCachedImage.url({
    required final String url,
    final Account? account,
    final Key? key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
    this.errorBuilder,
  })  : image = _getImageFromUrl(url, account),
        super(key: key ?? Key(url));

  NeonCachedImage.custom({
    required final ImageDownloader getImage,
    required final String cacheKey,
    final CacheReviver? reviver,
    final CacheWriter? writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
    this.errorBuilder,
  })  : image = _customImageGetter(
          reviver,
          getImage,
          writeCache,
          cacheKey,
        ),
        super(key: Key(cacheKey));

  final Future<Uint8List> image;
  final bool isSvgHint;

  final Size? size;
  final BoxFit? fit;

  final Color? svgColor;
  final Color? iconColor;

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
        child: FutureBuilder<Uint8List>(
          future: widget.image,
          builder: (final context, final fileSnapshot) {
            if (fileSnapshot.hasError) {
              return _buildError(fileSnapshot.error);
            }

            if (!fileSnapshot.hasData) {
              return SizedBox(
                width: widget.size?.width,
                child: NeonLinearProgressIndicator(
                  color: widget.iconColor,
                ),
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
                  colorFilter: widget.svgColor != null ? ColorFilter.mode(widget.svgColor!, BlendMode.srcIn) : null,
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

  Widget _buildError(final dynamic error) =>
      widget.errorBuilder?.call(context, error) ??
      NeonException(
        error,
        onRetry: () {
          setState(() {});
        },
        onlyIcon: true,
        iconSize: widget.size?.shortestSide,
      );
}

class NeonApiImage extends StatelessWidget {
  const NeonApiImage({
    required this.getImage,
    required this.cacheKey,
    this.reviver,
    this.writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
    this.errorBuilder,
    super.key,
  });

  final ApiImageDownloader getImage;
  final String cacheKey;
  final CacheReviver? reviver;
  final CacheWriter? writeCache;
  final bool isSvgHint;
  final Size? size;
  final BoxFit? fit;
  final Color? svgColor;
  final Color? iconColor;
  final ErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(final BuildContext context) {
    final account = Provider.of<AccountsBloc>(context, listen: false).activeAccount.value!;

    return NeonCachedImage.custom(
      getImage: () async => getImage(account.client),
      cacheKey: '${account.id}-$cacheKey',
    );
  }
}
