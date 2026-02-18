import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photos_app/src/options.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:nextcloud/webdav.dart' as webdav;
import 'package:neon_framework/utils.dart';
import 'dart:ui' as ui show Codec, ImmutableBuffer;
import 'package:universal_io/io.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({
    super.key,
    required this.sorted,
    required this.file,
  });

  final List<webdav.WebDavFile> sorted;
  final webdav.WebDavFile file;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late PageController pageController;
  late int _currentIndex;
  late List<webdav.WebDavFile> _files;
  var _showAppBar = true;

  @override
  void initState() {
    super.initState();

    _files = widget.sorted.where((file) => file.mimeType?.startsWith(RegExp('image/.*')) ?? false).toList();
    _currentIndex = _files.indexOf(widget.file);

    pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = NeonProvider.of<FilesBloc>(context);
    final options = NeonProvider.of<PhotosOptions>(context);

    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
              title: Text(_files[_currentIndex].name),
            )
          : null,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showAppBar = !_showAppBar;
            _showAppBar
                ? SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values)
                : SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
          });
        },
        child: CallbackShortcuts(
          bindings: <ShortcutActivator, VoidCallback>{
            const SingleActivator(LogicalKeyboardKey.arrowRight): navigateRight,
            const SingleActivator(LogicalKeyboardKey.pageDown): navigateRight,
            const SingleActivator(LogicalKeyboardKey.arrowLeft): navigateLeft,
            const SingleActivator(LogicalKeyboardKey.pageUp): navigateLeft,
          },
          child: Focus(
            autofocus: true,
            child: Stack(
              children: [
                PhotoViewGallery.builder(
                  itemCount: _files.length,
                  pageController: pageController,
                  onPageChanged: _onPageChanged,
                  builder: (context, index) {
                    final file = _files[index];
                    return PhotoViewGalleryPageOptions(
                      minScale: PhotoViewComputedScale.contained,
                      imageProvider: NeonImageProvider(file: file, bloc: bloc, options: options),
                    );
                  },
                  loadingBuilder: (context, event) => Center(
                    child: CircularProgressIndicator(
                      value: event?.cumulativeBytesLoaded != null ? event!.cumulativeBytesLoaded.toDouble() / event.expectedTotalBytes! : null,
                    ),
                  ),
                ),
                ..._buildDesktopButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDesktopButtons(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return [];
    }

    var buttons = <Widget>[];

    if (_currentIndex > 0) {
      buttons.add(_buildDesktopNavButton(
        context: context,
        child: const Icon(Icons.arrow_back),
        onPressed: navigateLeft,
        alignment: Alignment.centerLeft,
        key: LogicalKeyboardKey.arrowLeft,
      ));
    }

    if (_currentIndex < _files.length - 1) {
      buttons.add(_buildDesktopNavButton(
        context: context,
        child: const Icon(Icons.arrow_forward),
        onPressed: navigateRight,
        alignment: Alignment.centerRight,
        key: LogicalKeyboardKey.arrowRight,
      ));
    }

    return buttons;
  }

  void navigateLeft() => pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );

  void navigateRight() => pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );

  Widget _buildDesktopNavButton({
    required BuildContext context,
    required Widget child,
    required Function() onPressed,
    required Alignment alignment,
    required LogicalKeyboardKey key,
  }) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: FloatingActionButton(
          heroTag: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}

class NeonImageProvider extends ImageProvider<webdav.WebDavFile> {
  NeonImageProvider({required this.file, required this.bloc, required this.options});

  final webdav.WebDavFile file;
  final FilesBloc bloc;
  final PhotosOptions options;

  @override
  Future<webdav.WebDavFile> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<webdav.WebDavFile>(file);
  }

  @override
  @protected
  ImageStreamCompleter loadImage(webdav.WebDavFile key, ImageDecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(decode),
      scale: 1.0,
      debugLabel: file.path.toString(),
      informationCollector: () => <DiagnosticsNode>[
        ErrorDescription('Path: ${file.path}'),
      ],
      chunkEvents: _chunkEvents(),
    );
  }

  Future<ui.Codec> _loadAsync(ImageDecoderCallback decode) async {
    final data = await bloc.fetchFile(file.path, file.etag!, cache: options.cacheImagesOption.value);
    return decode(await ui.ImmutableBuffer.fromUint8List(data));
  }

  Stream<ImageChunkEvent> _chunkEvents() {
    final task = bloc.getDownloadTask(file.path);
    if (task == null) {
      return bloc.downloadTasks
        .where((task) => task != null && task.uri == file.path)
        .asyncExpand((task) => task!.progress.map(_toChunkEvent));
    }

    return task.progress.map(_toChunkEvent);
  }

  ImageChunkEvent _toChunkEvent(double progress) => ImageChunkEvent(
    cumulativeBytesLoaded: (progress * 100).toInt(),
    expectedTotalBytes: 100,
  );  
}
