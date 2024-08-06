import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;

/// Widget for completing search queries using the Nextcloud core Autocomplete API.
class NeonAutocomplete extends StatefulWidget {
  /// Creates a new autocomplete for the active account.
  const NeonAutocomplete({
    required this.itemType,
    required this.itemId,
    required this.shareTypes,
    required this.resultBuilder,
    required this.onSelected,
    this.limit,
    this.validator,
    this.decoration,
    this.onFieldSubmitted,
    super.key,
  });

  /// The type of the item.
  ///
  /// This is hardcoded by the Nextcloud apps and has to be looked up in the respective PHP source code.
  final String itemType;

  /// The ID of the item.
  ///
  /// This is hardcoded by the Nextcloud apps and has to be looked up in the respective PHP source code.
  final String itemId;

  /// The allowed share types.
  ///
  /// This is hardcoded by the Nextcloud apps and has to be looked up in the respective PHP source code.
  final List<core.ShareType> shareTypes;

  /// Builder function called for each result.
  final Widget Function(
    BuildContext context,
    core.AutocompleteResult result,
    void Function(core.AutocompleteResult) onSelected,
  ) resultBuilder;

  /// Called when the user selects a result.
  final void Function(core.AutocompleteResult result) onSelected;

  /// Maximum number of items to return.
  ///
  /// Defaults to 10.
  final int? limit;

  /// Validator for the TextField.
  final FormFieldValidator<String>? validator;

  /// Decoration for the TextField.
  final InputDecoration? decoration;

  /// Called when the TextField is submitted e.g. by pressing enter.
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<NeonAutocomplete> createState() => _NeonAutocompleteState();
}

class _NeonAutocompleteState extends State<NeonAutocomplete> {
  final _textFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final account = NeonProvider.of<Account>(context);

    return Autocomplete<core.AutocompleteResult>(
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) => TextFormField(
        key: _textFieldKey,
        controller: controller,
        focusNode: focusNode,
        validator: widget.validator,
        decoration: widget.decoration,
        onFieldSubmitted: (value) {
          onFieldSubmitted();
          widget.onFieldSubmitted?.call(value);
        },
      ),
      optionsBuilder: (text) async {
        if (text.text.isEmpty) {
          return [];
        }

        final response = await account.client.core.autoComplete.$get(
          search: text.text,
          itemType: widget.itemType,
          itemId: widget.itemId,
          shareTypes: BuiltList(widget.shareTypes.map((s) => s.index)),
          limit: widget.limit,
        );
        return response.body.ocs.data;
      },
      displayStringForOption: (option) => option.id,
      optionsViewBuilder: (context, onSelected, results) {
        // The autocomplete widget is a bit broken, so we need to get the width of the text field manually
        // and apply it to the result list to avoid it from going off screen.
        // See https://github.com/flutter/flutter/issues/78746#issuecomment-1055988296
        final width = (_textFieldKey.currentContext!.findRenderObject()! as RenderBox).size.width;

        final body = ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: results.length,
          itemBuilder: (context, index) => Builder(
            builder: (context) {
              final highlight = AutocompleteHighlightedOption.of(context) == index;
              if (highlight) {
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) async => Scrollable.ensureVisible(context, alignment: 0.5),
                );
              }

              return Container(
                color: highlight ? Theme.of(context).focusColor : null,
                child: widget.resultBuilder(
                  context,
                  results.elementAt(index),
                  onSelected,
                ),
              );
            },
          ),
        );

        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: width,
            child: Material(
              elevation: 4,
              child: body,
            ),
          ),
        );
      },
      onSelected: widget.onSelected,
    );
  }
}
