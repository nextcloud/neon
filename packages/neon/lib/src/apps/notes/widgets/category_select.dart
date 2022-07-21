part of '../app.dart';

class NotesCategorySelect extends StatelessWidget {
  NotesCategorySelect({
    required this.categories,
    required this.onChanged,
    required this.onSubmitted,
    this.initialValue,
    super.key,
  }) {
    if (initialValue != null) {
      onChanged(initialValue!);
    }
  }

  final List<String> categories;
  final String? initialValue;
  final Function(String category) onChanged;
  final Function() onSubmitted;

  late final _categories = categories..sort((final a, final b) => a.compareTo(b));

  @override
  Widget build(final BuildContext context) => CustomAutocomplete<String>(
        initialValue: initialValue != null
            ? TextEditingValue(
                text: initialValue!,
              )
            : null,
        optionsBuilder: (final value) {
          final categories = [
            if (!_categories.contains('')) ...{
              '',
            },
            ..._categories,
          ];

          if (value.text == '') {
            return categories;
          }
          return categories.where((final category) => category.toLowerCase().contains(value.text.toLowerCase()));
        },
        fieldViewBuilder: (
          final context,
          final textEditingController,
          final focusNode,
          final onFieldSubmitted,
        ) =>
            TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).notesCategory,
          ),
          onFieldSubmitted: (final value) {
            onChanged(value);
            onSubmitted();
            onFieldSubmitted();
          },
          onChanged: onChanged,
        ),
        displayWidgetForOption: (final category) => Row(
          children: [
            Icon(
              MdiIcons.tag,
              color: category != '' ? NotesCategoryColor.compute(category) : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              category != '' ? category : AppLocalizations.of(context).notesUncategorized,
            ),
          ],
        ),
        onSelected: (final value) {
          if (categories.contains(value)) {
            onChanged(value);
          }
        },
      );
}
