import 'package:neon_framework/settings.dart';
import 'package:photos_app/l10n/localizations.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/webdav.dart' as webdav;

class PhotosOptions extends AppImplementationOptions {
  PhotosOptions(super.storage) {
    super.categories = [
      generalCategory,
    ];
    super.options = [
      photosHomePathOption,
      cacheImagesOption,
    ];
  }

  final generalCategory = OptionsCategory(
    name: (context) => PhotosLocalizations.of(context).general,
  );

  late final photosHomePathOption = PathUriOption(
    storage: super.storage,
    category: generalCategory,
    key: PhotosOptionKeys.photosHomePath,
    label: (context) => PhotosLocalizations.of(context).optionsPhotosHomePath,
    defaultValue: webdav.PathUri.cwd(),
  );

  late final cacheImagesOption = ToggleOption(
    storage: super.storage,
    category: generalCategory,
    key: PhotosOptionKeys.cacheImages,
    label: (context) => PhotosLocalizations.of(context).optionsCacheImages,
    defaultValue: true,
  );
}

enum PhotosOptionKeys implements Storable {
  photosHomePath._('photosHomePath'),
  cacheImages._('cacheImages');

  const PhotosOptionKeys._(this.value);

  @override
  final String value;
}
