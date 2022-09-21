part of '../neon.dart';

class CachedURLImage extends StatelessWidget {
  const CachedURLImage({
    required this.url,
    required this.requestManager,
    required this.client,
    this.height,
    this.width,
    this.fit,
    this.color,
    super.key,
  });

  final String url;
  final RequestManager requestManager;
  final NextcloudClient client;

  final double? height;
  final double? width;
  final BoxFit? fit;

  /// Only works for SVGs
  final Color? color;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: ResultStreamBuilder<Uint8List>(
            // TODO: Cache this properly. It was not working in listviews where the old image was still rendered in the same index, until it was scrolled out of view.
            stream: requestManager.wrapBytes(
              client.id,
              'image-${base64.encode(url.codeUnits)}',
              () async => (await http.get(
                Uri.parse(url),
                headers: client.baseHeaders,
              ))
                  .bodyBytes,
              preferCache: true,
            ),
            builder: (
              final context,
              final data,
              final error,
              final loading,
            ) =>
                Stack(
              children: [
                if (data != null) ...[
                  SizedBox(
                    height: height,
                    width: width,
                    child: Builder(
                      builder: (final context) {
                        try {
                          // TODO: Is this safe enough? Research in XML spec if a space is allowed between the < and the tag name
                          if (utf8.decode(data).contains('<svg')) {
                            return SvgPicture.memory(
                              data,
                              color: color,
                            );
                          }
                        } catch (_) {
                          // If the data is not UTF-8
                        }

                        return Image.memory(
                          data,
                          fit: fit,
                        );
                      },
                    ),
                  ),
                ],
                if (error != null) ...[
                  Icon(
                    Icons.error_outline,
                    size: height != null && width != null ? min(height!, width!) : height ?? width,
                  ),
                ],
                if (loading) ...[
                  Container(
                    margin: const EdgeInsets.all(3),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
