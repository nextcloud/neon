part of '../neon.dart';

final sortBoxOrderOptionValues = <SortBoxOrder, LabelBuilder>{
  SortBoxOrder.ascending: (final context) => AppLocalizations.of(context).optionsSortOrderAscending,
  SortBoxOrder.descending: (final context) => AppLocalizations.of(context).optionsSortOrderDescending,
};
