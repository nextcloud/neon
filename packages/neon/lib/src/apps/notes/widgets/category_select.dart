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
  Widget build(final BuildContext context) => Autocomplete<String>(
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
        optionsViewBuilder: (final context, final onSelected, final options) => Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (final context, final index) {
                  final option = options.elementAt(index);
                  return InkWell(
                    onTap: () {
                      onSelected(option);
                    },
                    child: Builder(
                      builder: (final context) => ListTile(
                        leading: Icon(
                          MdiIcons.tag,
                          color: option != '' ? NotesCategoryColor.compute(option) : null,
                        ),
                        title: Text(
                          option != '' ? option : AppLocalizations.of(context).notesUncategorized,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        onSelected: (final value) {
          if (categories.contains(value)) {
            onChanged(value);
          }
        },
      );
}
