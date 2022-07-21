part of 'app.dart';

class FilesAppSpecificOptions extends NextcloudAppSpecificOptions {
  FilesAppSpecificOptions(super.storage) {
    super.categories = [
      generalCategory,
    ];
    super.options = [
      showPreviewsOption,
      uploadQueueParallelism,
      downloadQueueParallelism,
      uploadSizeWarning,
      downloadSizeWarning,
    ];
  }

  final generalCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).optionsCategoryGeneral,
  );

  late final showPreviewsOption = ToggleOption(
    storage: super.storage,
    category: generalCategory,
    key: 'show-previews',
    label: (final context) => AppLocalizations.of(context).filesOptionsShowPreviews,
    defaultValue: BehaviorSubject.seeded(true),
  );

  late final uploadQueueParallelism = SelectOption<int>(
    storage: storage,
    category: generalCategory,
    key: 'upload-queue-parallelism',
    label: (final context) => AppLocalizations.of(context).filesOptionsUploadQueueParallelism,
    defaultValue: BehaviorSubject.seeded(4),
    values: BehaviorSubject.seeded({
      for (var i = 1; i <= 16; i = i * 2) ...{
        i: (final _) => i.toString(),
      },
    }),
  );

  late final downloadQueueParallelism = SelectOption<int>(
    storage: storage,
    category: generalCategory,
    key: 'download-queue-parallelism',
    label: (final context) => AppLocalizations.of(context).filesOptionsDownloadQueueParallelism,
    defaultValue: BehaviorSubject.seeded(4),
    values: BehaviorSubject.seeded({
      for (var i = 1; i <= 16; i = i * 2) ...{
        i: (final _) => i.toString(),
      },
    }),
  );

  late final _sizeWarningValues = <int?, String Function(BuildContext)>{
    null: (final context) => AppLocalizations.of(context).disabled,
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
    key: 'upload-size-warning',
    label: (final context) => AppLocalizations.of(context).filesOptionsUploadSizeWarning,
    defaultValue: BehaviorSubject.seeded(_mb(10)),
    values: BehaviorSubject.seeded(_sizeWarningValues),
  );

  late final downloadSizeWarning = SelectOption<int?>(
    storage: storage,
    category: generalCategory,
    key: 'download-size-warning',
    label: (final context) => AppLocalizations.of(context).filesOptionsDownloadSizeWarning,
    defaultValue: BehaviorSubject.seeded(_mb(10)),
    values: BehaviorSubject.seeded(_sizeWarningValues),
  );
}
