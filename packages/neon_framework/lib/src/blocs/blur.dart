import 'dart:async';
import 'dart:ui' as ui;

import 'package:cacherine/cacherine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';

/// A bloc that manages the decoding of blur hashes into images.
/// It uses a [compute] to offload the decoding process to a separate isolate, as it can be CPU intensive.
/// Results are cached in a [SimpleLRUCache] so that they can be reused without re-decoding with a limit of 1000 entries.
class BlurBloc extends Bloc {
  final _blurHashCash = SimpleLRUCache<String, BlurHashDecodeTask>(1000);

  @override
  void dispose() {
    _blurHashCash.clear();
  }

  @override
  Logger get log => Logger('BlurBloc');

  /// Gets the decoded image for the given [blurHash] and [size].
  /// If the image is already cached, it returns the cached [BlurHashDecodeTask].
  /// If the image is not cached, it creates a new [BlurHashDecodeTask] to decode the blur hash.
  /// The result of the decoding process is stored in a [ValueNotifier] within the [BlurHashDecodeTask].
  BlurHashDecodeTask getBlurHash(String blurHash, ui.Size size) {
    final key = '$blurHash-${size.width}x${size.height}';

    final cachedTask = _blurHashCash.get(key);
    if (cachedTask != null) {
      return cachedTask;
    }

    final task = BlurHashDecodeTask(blurHash: blurHash, size: size);
    unawaited(task.execute());
    _blurHashCash.set(key, task);
    return task;
  }
}

/// A task to decode a blur hash into an image. The result is stored in a [ValueNotifier].
class BlurHashDecodeTask {
  /// Creates a new [BlurHashDecodeTask] with the given [blurHash] and [size].
  /// The result is stored in a [ValueNotifier] so that cashed blurs can be displayed without any flickering.
  BlurHashDecodeTask({
    required String blurHash,
    required ui.Size size,
  }) : _blurHashMeta = _BlurHashComputeTask(
          blurHash: blurHash,
          width: size.width.toInt(),
          height: size.height.toInt(),
        );

  /// The blur hash to decode.
  final _BlurHashComputeTask _blurHashMeta;

  /// The result of the decoding process, stored in a [ValueNotifier] so that cashed blurs can be displayed without any flickering.
  ValueNotifier<ui.Image?> blur = ValueNotifier<ui.Image?>(null);

  /// Executes the task by computing the blur in an isolate and then decoding the resulting pixels into an image.
  Future<void> execute() async {
    final pixels = await _computePixels();

    // We are using the scheduler to decode the image just to be on the safe side.
    await SchedulerBinding.instance.scheduleTask(
      () => ui.decodeImageFromPixels(
        pixels,
        _blurHashMeta.width,
        _blurHashMeta.height,
        ui.PixelFormat.rgba8888,
        (image) => blur.value = image,
      ),
      Priority.animation,
    );
  }

  /// Computes the pixels for the blur image either by using [SchedulerBinding] for web or [compute] for other platforms
  /// to offload the decoding process to a separate isolate,
  /// as it can be CPU intensive and we don't want to block the UI thread.
  Future<Uint8List> _computePixels() async {
    if (kIsWeb) {
      return SchedulerBinding.instance.scheduleTask(
        () => optimizedBlurHashDecode(
          blurHash: _blurHashMeta.blurHash,
          width: _blurHashMeta.width,
          height: _blurHashMeta.height,
        ),
        Priority.animation,
      );
    }

    return compute(
      (blurHashMeta) => optimizedBlurHashDecode(
        blurHash: blurHashMeta.blurHash,
        width: blurHashMeta.width,
        height: blurHashMeta.height,
      ),
      _blurHashMeta,
    );
  }
}

/// Helper object to carry the necessary data into the compute isolate.
class _BlurHashComputeTask {
  _BlurHashComputeTask({
    required this.blurHash,
    required this.width,
    required this.height,
  });

  // The blur hash to decode.
  final String blurHash;

  // The width of the resulting image.
  final int width;

  // The height of the resulting image.
  final int height;
}
