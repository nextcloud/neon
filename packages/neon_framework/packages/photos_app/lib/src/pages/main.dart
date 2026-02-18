import 'dart:async';

import 'package:files_app/src/blocs/browser.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:files_app/src/options.dart';
import 'package:files_app/src/pages/main.dart';
import 'package:files_app/src/sort/files.dart';
import 'package:files_app/src/utils/dialog.dart';
import 'package:files_app/src/widgets/file_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart' as webdav;
import 'package:photos_app/src/blocs/bloc.dart';
import 'package:photos_app/src/options.dart';

class PhotosMainPage1 extends StatelessWidget {
  const PhotosMainPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PhotosOptions options = NeonProvider.of<PhotosOptions>(context);

    return ValueListenableBuilder(
      valueListenable: options.photosHomePathOption,
      // Just temporary to get everything started, I will create a proper timeline view next.
      builder: (context, value, child) => FilesMainPage(
        mimeFilter: const MimeFilter.images(),
        uri: value,
      ),
    );
  }
}

class PhotosMainPage extends StatefulWidget {
  const PhotosMainPage({
    super.key,
  });

  @override
  State<PhotosMainPage> createState() => _PhotosMainPageState();
}

class _PhotosMainPageState extends State<PhotosMainPage> {
  late PhotosOptions options;
  late PhotosBloc photosBloc;
  late FilesBloc filesBloc;
  late StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();
    options = NeonProvider.of<PhotosOptions>(context);
    photosBloc = NeonProvider.of<PhotosBloc>(context);
    filesBloc = NeonProvider.of<FilesBloc>(context);

    errorsSubscription = photosBloc.errors.listen((error) {
      if (mounted) {
        NeonError.showSnackbar(context, error);
      }
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: options.photosHomePathOption,
        builder: (context, value, child) => CategoryView(
          uri: value,
        ),
      ),
    );
  }
}


class CategoryView extends StatefulWidget {
  CategoryView({
    required this.uri,
    this.mimeFilter = const MimeFilter.images(),
  }) : super(key: Key(uri.toString()));

  final webdav.PathUri uri;
  final MimeFilter mimeFilter;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final FilesBloc filesBloc;
  late final FilesOptions options;
  late final FilesBrowserBloc bloc;
  late final StreamSubscription<Object> errorsSubscription;
  late final StickyHeaderController controller;

  @override
  void initState() {
    filesBloc = NeonProvider.of<FilesBloc>(context);
    options = NeonProvider.of<FilesOptions>(context);

    controller = StickyHeaderController();

    bloc = FilesBrowserBloc(
      filesBloc: filesBloc,
      options: options,
      account: NeonProvider.of<Account>(context),
      uri: widget.uri,
      mode: FilesBrowserMode.browser,
      mimeFilter: widget.mimeFilter,
    );

    errorsSubscription = bloc.errors.listen((error) {
      if (mounted) {
        NeonError.showSnackbar(context, error);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());
    bloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.files,
      builder: (context, filesSnapshot) => StreamBuilder(
        stream: filesBloc.tasks,
        builder: (context, tasksSnapshot) {
          final List<webdav.WebDavFile> sorted = filesSnapshot.data?.toList() ?? [];
          final box = (property: FilesSortProperty.modifiedDate, order: SortBoxOrder.descending);
          filesSortBox.sortList(sorted, box);

          Map<String, List<webdav.WebDavFile>> categories = {};
          
          sorted.forEach((file) {
            final key = '${file.lastModified!.year}-${file.lastModified!.month.toString().padLeft(2, '0')}';
            if(categories[key] == null) {
              categories[key] = [];
            }
            categories[key]!.add(file);
          });

          final List<Widget> slivers = categories.keys.map((key) => _buildCategory(key, categories[key]!, sorted, context)).toList();

          return CustomScrollView(
            slivers: slivers,
            physics: const AlwaysScrollableScrollPhysics(),
          );
        },
      ),
    );
  }

  Widget _buildHeader(String key, BuildContext context) {
    return Container(
      height: 30.0,
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        key,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  SliverStickyHeader _buildCategory(String key, List<webdav.WebDavFile> category, List<webdav.WebDavFile> sorted, BuildContext context) {
    final cut = 550;
    final minAxis = 3;
    double realdWidth = MediaQuery.sizeOf(context).width - 8;
    final axis = minAxis + minAxis * ((realdWidth-cut) ~/ cut);

    double width = (realdWidth / axis) - 4;

    return SliverStickyHeader(
      key: ValueKey(key),
      header: _buildHeader(key, context),
      controller: controller,
      sliver: SliverGrid(
        key: ValueKey("${key}_grid"),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final file = category[index];
            final details = FileDetails.fromWebDav(
              file: file,
            );
            
            return GestureDetector(
              onTap: () => _onTap(file, details, sorted),
              child: FilePreview(
                bloc: filesBloc,
                size: Size.square(width),
                details: details,
              ),
            );
          }, 
          childCount: category.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axis,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
      ),
    );
  }

  void _onTap(webdav.WebDavFile file, FileDetails details, List<webdav.WebDavFile> sorted) async {
    // size warning handling needs to be made global
    final sizeWarning = NeonProvider.of<FilesOptions>(context).downloadSizeWarning.value;
    if (sizeWarning != null && details.size != null && details.size! > sizeWarning) {
      final decision = await showDownloadConfirmationDialog(context, sizeWarning, details.size!);

      if (!decision) {
        return;
      }
    }

    final mimeHandler = NeonProvider.of<AppsBloc>(context).mimeTypeHandler(file.mimeType);

    if (mimeHandler != null) {
      await mimeHandler.handle(context, MimeContext(file: file, files: sorted));
    }
  }
}

