import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;

class TalkCreateRoomDialog extends StatefulWidget {
  const TalkCreateRoomDialog({
    super.key,
  });

  @override
  State<TalkCreateRoomDialog> createState() => _TalkCreateRoomDialogState();
}

class _TalkCreateRoomDialogState extends State<TalkCreateRoomDialog> {
  late final values = {
    spreed.RoomType.oneToOne: TalkLocalizations.of(context).roomTypeOneToOne,
    spreed.RoomType.group: TalkLocalizations.of(context).roomTypeGroup,
    spreed.RoomType.public: TalkLocalizations.of(context).roomTypePublic,
  };

  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final focusNode = FocusNode();

  spreed.RoomType? selectedType;
  core.AutocompleteResult? selectedAutocompleteEntry;

  void changeType(spreed.RoomType? type) {
    controller.clear();
    setState(() {
      selectedType = type;
    });
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(
        TalkCreateRoomDetails(
          selectedType!,
          selectedType! == spreed.RoomType.public ? controller.text : null,
          selectedType! != spreed.RoomType.public ? selectedAutocompleteEntry : null,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => NeonDialog(
        title: Text(TalkLocalizations.of(context).roomCreate),
        content: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final type in values.keys)
                ListTile(
                  title: Text(values[type]!),
                  leading: Icon(
                    type == spreed.RoomType.oneToOne
                        ? Icons.person
                        : type == spreed.RoomType.group
                            ? Icons.group
                            : Icons.public,
                  ),
                  trailing: Radio(
                    value: type,
                    groupValue: selectedType,
                    onChanged: changeType,
                  ),
                  onTap: () {
                    changeType(type);
                  },
                ),
              const Divider(),
              if (selectedType == spreed.RoomType.oneToOne || selectedType == spreed.RoomType.group)
                NeonAutocomplete(
                  key: Key(selectedType!.index.toString()),
                  account: NeonProvider.of<AccountsBloc>(context).activeAccount.value!,
                  itemType: 'call',
                  itemId: 'new',
                  shareTypes: [
                    if (selectedType == spreed.RoomType.oneToOne)
                      core.ShareType.user
                    else if (selectedType == spreed.RoomType.group)
                      core.ShareType.group,
                  ],
                  validator: (input) => validateNotEmpty(context, input),
                  decoration: InputDecoration(
                    hintText: selectedType == spreed.RoomType.oneToOne
                        ? TalkLocalizations.of(context).roomCreateUserName
                        : TalkLocalizations.of(context).roomCreateGroupName,
                  ),
                  onSelected: (entry) {
                    setState(() {
                      selectedAutocompleteEntry = entry;
                    });
                  },
                  onFieldSubmitted: (_) {
                    submit();
                  },
                ),
              if (selectedType == spreed.RoomType.public)
                TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  validator: (input) => validateNotEmpty(context, input),
                  decoration: InputDecoration(
                    hintText: TalkLocalizations.of(context).roomCreateRoomName,
                  ),
                  onFieldSubmitted: (_) {
                    submit();
                  },
                ),
            ],
          ),
        ),
        actions: [
          NeonDialogAction(
            onPressed: selectedType == null ? null : submit,
            child: Text(TalkLocalizations.of(context).roomCreate),
          ),
        ],
      );
}

class TalkCreateRoomDetails {
  TalkCreateRoomDetails(
    this.type,
    this.roomName,
    this.invite,
  );

  final spreed.RoomType type;

  final String? roomName;

  final core.AutocompleteResult? invite;
}
