import 'dart:async';
import 'dart:ui' as ui;

import 'package:cacherine/cacherine.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:queue/queue.dart';

/// A bloc that manages the decoding of blur hashes into images.
/// It uses a [Queue] to limit the maximum number of concurrent decoding tasks,
/// and a LRU-Cache to cache the results of previously decoded blur hashes so that they can be reused without re-decoding.
class BlurBloc extends Bloc {
  final _blurHashQueue = Queue(parallel: 10);
  final _blurHashCash = SimpleLRUCache<String, BlurHashDecodeTask>(1000);

  @override
  void dispose() {
    _blurHashQueue.dispose();
    _blurHashCash.clear();
  }

  @override
  Logger get log => Logger('BlurBloc');

  /// Gets the decoded image for the given [blurHash] and [size].
  /// If the image is already cached, it returns the cached image.
  /// Otherwise, it creates a new [BlurHashDecodeTask] to decode the blur hash, and returns the result of that task.
  /// If [cache] is `true`, the result will be cached. [cache] does not have any effect on lookup.
  Future<ui.Image> getBlurHash(String blurHash, ui.Size size, {bool cache = true}) {
    final task = BlurHashDecodeTask(blurHash: blurHash, size: size);

    if (_blurHashCash.get(task.key) != null) {
      return _blurHashCash.get(task.key)!.result.future;
    }

    // We are offloading the decoding process to the schedular to allow for pre-caching of the blur hashes,
    // and to ensure that the decoding process does not block UI refreshes.
    // Please note that this only works as long as the decoding process is not too heavy,
    // as it could potentially still block the UI if it takes longer then a few milliseconds.
    unawaited(SchedulerBinding.instance.scheduleTask(task.execute, Priority.animation));

    if (cache) {
      _blurHashCash.set(task.key, task);
    }

    return task.result.future;
  }
}

/// A task to decode a blur hash into an image. The result is stored in a [Completer] so that it can be awaited by multiple callers.
class BlurHashDecodeTask {
  /// Creates a new [BlurHashDecodeTask] with the given [blurHash] and [size].
  /// The result is stored in a [Completer] so that it can be awaited by multiple callers.
  BlurHashDecodeTask({
    required this.blurHash,
    required this.size,
  });

  /// The blur hash to decode.
  final String blurHash;

  /// The size of the resulting image.
  final ui.Size size;

  /// The result of the decoding process, stored in a [Completer] so that it can be awaited by multiple callers.
  Completer<ui.Image> result = Completer();

  /// Executes the task by decoding the blur hash into an image and completing the [result] completer with the decoded image.
  Future<void> execute() async {
    result.complete(
      blurHashDecodeImage(
        blurHash: blurHash,
        width: size.width.toInt(),
        height: size.height.toInt(),
      ),
    );
  }

  /// A unique key for this task, based on the blur hash and the size of the resulting image.
  /// This is used to ensure that multiple callers can await the same task without creating duplicate tasks.
  String get key => '$blurHash-${size.width}x${size.height}';
}
