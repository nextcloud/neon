import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/label_builder.dart';
import 'package:sort_box/sort_box.dart';

/// Sort box order labels used in an `SelectOption`.
final sortBoxOrderOptionValues = <SortBoxOrder, LabelBuilder>{
  SortBoxOrder.ascending: (final context) => NeonLocalizations.of(context).optionsSortOrderAscending,
  SortBoxOrder.descending: (final context) => NeonLocalizations.of(context).optionsSortOrderDescending,
};
