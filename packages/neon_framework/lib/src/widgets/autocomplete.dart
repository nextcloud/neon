// ignore_for_file: public_member_api_docs

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/widgets/group_avatar.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';
import 'package:nextcloud/core.dart' as core;

class NeonAutocomplete extends StatelessWidget {
  const NeonAutocomplete({
    required this.account,
    required this.itemType,
    required this.itemId,
    required this.shareTypes,
    required this.onSelected,
    this.sorter,
    this.limit = 10,
    this.validator,
    this.decoration,
    this.onFieldSubmitted,
    super.key,
  });

  final Account account;

  final String itemType;
  final String itemId;
  final List<core.ShareType> shareTypes;
  final void Function(core.AutocompleteResult entry) onSelected;
  final String? sorter;
  final int limit;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) => Autocomplete<core.AutocompleteResult>(
        fieldViewBuilder: (
          context,
          controller,
          focusNode,
          onFieldSubmitted,
        ) =>
            TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          decoration: decoration,
          onFieldSubmitted: (value) {
            onFieldSubmitted();
            this.onFieldSubmitted?.call(value);
          },
        ),
        optionsBuilder: (text) async {
          final result = await account.client.core.autoComplete.$get(
            search: text.text,
            itemType: itemType,
            itemId: itemId,
            shareTypes: BuiltList(shareTypes.map((s) => s.index)),
          );
          return result.body.ocs.data;
        },
        displayStringForOption: (option) => option.id,
        optionsViewBuilder: (context, onSelected, options) => Material(
          elevation: 4,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              Widget? icon;
              switch (option.source) {
                case 'users':
                  icon = NeonUserAvatar(
                    username: option.id,
                  );
                case 'groups':
                  icon = const NeonGroupAvatar();
              }
              return ListTile(
                title: Text(option.label),
                subtitle: Text(option.id),
                leading: icon,
                onTap: () {
                  onSelected(option);
                },
              );
            },
          ),
        ),
        onSelected: onSelected,
      );
}
