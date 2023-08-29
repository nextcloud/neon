part of 'neon_files.dart';

class FilesAppSpecificOptions extends NextcloudAppOptions {
  FilesAppSpecificOptions(super.storage) {
    super.categories = [
      generalCategory,
    ];
    super.options = [
      filesSortPropertyOption,
      filesSortBoxOrderOption,
      showPreviewsOption,
      uploadQueueParallelism,
      downloadQueueParallelism,
      uploadSizeWarning,
      downloadSizeWarning,
    ];
  }

  final generalCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).general,
  );

  late final filesSortPropertyOption = SelectOption<FilesSortProperty>(
    storage: super.storage,
    category: generalCategory,
    key: FilesOptionKeys.sortProperty,
    label: (final context) => AppLocalizations.of(context).optionsFilesSortProperty,
    defaultValue: FilesSortProperty.name,
    values: {
      FilesSortProperty.name: (final context) => AppLocalizations.of(context).optionsFilesSortPropertyName,
      FilesSortProperty.modifiedDate: (final context) =>
          AppLocalizations.of(context).optionsFilesSortPropertyModifiedDate,
      FilesSortProperty.size: (final context) => AppLocalizations.of(context).optionsFilesSortPropertySize,
    },
  );

  late final filesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: generalCategory,
    key: FilesOptionKeys.sortOrder,
    label: (final context) => AppLocalizations.of(context).optionsFilesSortOrder,
    defaultValue: SortBoxOrder.ascending,
    values: sortBoxOrderOptionValues,
  );

  late final showPreviewsOption = ToggleOption(
    storage: super.storage,
    category: generalCategory,
    key: FilesOptionKeys.showPreviews,
    label: (final context) => AppLocalizations.of(context).optionsShowPreviews,
    defaultValue: true,
  );

  late final uploadQueueParallelism = SelectOption<int>(
    storage: storage,
    category: generalCategory,
    key: FilesOptionKeys.uploadQueueParallelism,
    label: (final context) => AppLocalizations.of(context).optionsUploadQueueParallelism,
    defaultValue: 4,
    values: {
      for (var i = 1; i <= 16; i = i * 2) ...{
        i: (final _) => i.toString(),
      },
    },
  );

  late final downloadQueueParallelism = SelectOption<int>(
    storage: storage,
    category: generalCategory,
    key: FilesOptionKeys.downloadQueueParallelism,
    label: (final context) => AppLocalizations.of(context).optionsDownloadQueueParallelism,
    defaultValue: 4,
    values: {
      for (var i = 1; i <= 16; i = i * 2) ...{
        i: (final _) => i.toString(),
      },
    },
  );

  late final _sizeWarningValues = <int?, String Function(BuildContext)>{
    null: (final context) => AppLocalizations.of(context).optionsSizeWarningDisabled,
    for (final i in [
      1,
      10,
      100,
      1024,
      2 * 2024,
      6 * 1024,
      10 * 1024,
    ]) ...{
      _mb(i): (final _) => filesize(_mb(i)),
    },
  };

  int _mb(final int i) => i * 1024 * 1024;

  late final uploadSizeWarning = SelectOption<int?>(
    storage: storage,
    category: generalCategory,
    key: FilesOptionKeys.uploadQueueParallelism,
    label: (final context) => AppLocalizations.of(context).optionsUploadSizeWarning,
    defaultValue: _mb(10),
    values: _sizeWarningValues,
  );

  late final downloadSizeWarning = SelectOption<int?>(
    storage: storage,
    category: generalCategory,
    key: FilesOptionKeys.downloadSizeWarning,
    label: (final context) => AppLocalizations.of(context).optionsDownloadSizeWarning,
    defaultValue: _mb(10),
    values: _sizeWarningValues,
  );
}

enum FilesOptionKeys implements Storable {
  sortProperty._('files-sort-property'),
  sortOrder._('files-sort-box-order'),
  showPreviews._('show-previews'),
  uploadQueueParallelism._('upload-queue-parallelism'),
  downloadQueueParallelism._('download-queue-parallelism'),
  uploadSizeWarning._('upload-size-warning'),
  downloadSizeWarning._('download-size-warning');

  const FilesOptionKeys._(this.value);

  @override
  final String value;
}

enum FilesSortProperty {
  name,
  modifiedDate,
  size,
}
