import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/src/storage/keys.dart';

@internal
@immutable
class SyncMappingOptions extends OptionsCollection {
  SyncMappingOptions(super.storage);

  @override
  late final List<Option<dynamic>> options = [
    automaticSync,
  ];

  late final automaticSync = ToggleOption(
    storage: storage,
    key: SyncMappingOptionKeys.automaticSync,
    label: (context) => NeonLocalizations.of(context).syncOptionsAutomaticSync,
    defaultValue: true,
  );
}

enum SyncMappingOptionKeys implements Storable {
  automaticSync._('automatic-sync');

  const SyncMappingOptionKeys._(this.value);

  @override
  final String value;
}
