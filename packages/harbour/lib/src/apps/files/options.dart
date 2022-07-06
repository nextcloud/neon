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
    storage: super.storage,
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
    storage: super.storage,
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
}
