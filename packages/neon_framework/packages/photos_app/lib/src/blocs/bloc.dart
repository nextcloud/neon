import 'package:logging/src/logger.dart';
import 'package:photos_app/src/options.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';

abstract class PhotosBloc implements InteractiveBloc {
  factory PhotosBloc({
    required PhotosOptions options,
    required Account account,
  }) = _PhotosBloc;
}

class _PhotosBloc extends InteractiveBloc implements PhotosBloc {
  _PhotosBloc({
    required this.options,
    required this.account,
  });

  final PhotosOptions options;
  final Account account;

  @override
  Logger get log => Logger('PhotosBloc');

  @override
  Future<void> refresh() {
    return Future.value();
  }
}
