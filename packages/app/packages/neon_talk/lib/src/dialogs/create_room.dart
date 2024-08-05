import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;

/// The data that will be returned when the [TalkCreateRoomDialog] is closed.
typedef TalkCreateRoomDetails = ({
  spreed.RoomType type,
  String? roomName,
  core.AutocompleteResult? invite,
});

/// Dialog for creating a new room.
///
/// Room types can be [spreed.RoomType.oneToOne], [spreed.RoomType.group] or [spreed.RoomType.public].
class TalkCreateRoomDialog extends StatefulWidget {
  /// Creates a new Talk create room dialog.
  const TalkCreateRoomDialog({
    super.key,
  });

  @override
  State<TalkCreateRoomDialog> createState() => _TalkCreateRoomDialogState();
}

class _TalkCreateRoomDialogState extends State<TalkCreateRoomDialog> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final focusNode = FocusNode();

  spreed.RoomType? selectedType;
  core.AutocompleteResult? selectedResult;

  void changeType(spreed.RoomType? type) {
    controller.clear();

    setState(() {
      selectedResult = null;
      selectedType = type;
    });
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      final type = selectedType!;
      final isPublic = type == spreed.RoomType.public;

      Navigator.of(context).pop<TalkCreateRoomDetails>(
        (
          type: type,
          roomName: isPublic ? controller.text : null,
          invite: !isPublic ? selectedResult : null,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final type in [
          spreed.RoomType.oneToOne,
          spreed.RoomType.group,
          spreed.RoomType.public,
        ])
          RadioListTile.adaptive(
            title: Text(TalkLocalizations.of(context).roomType(type.name)),
            secondary: Icon(
              // coverage:ignore-start
              switch (type) {
                // coverage:ignore-end
                spreed.RoomType.oneToOne => AdaptiveIcons.person,
                spreed.RoomType.group => AdaptiveIcons.group,
                spreed.RoomType.public => AdaptiveIcons.link,
                _ => throw UnimplementedError('$type is not a valid type'), // coverage:ignore-line
              },
            ),
            value: type,
            groupValue: selectedType,
            onChanged: changeType,
          ),
        const Divider(),
        switch (selectedType) {
          spreed.RoomType.oneToOne || spreed.RoomType.group => buildAutocomplete(),
          spreed.RoomType.public => TextFormField(
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
          null => const SizedBox(),
          _ => throw StateError('$selectedType is not a valid type'), // coverage:ignore-line
        },
      ],
    );

    return NeonDialog(
      title: Text(TalkLocalizations.of(context).roomCreate),
      content: Form(
        key: formKey,
        child: body,
      ),
      actions: [
        NeonDialogAction(
          onPressed: selectedType == null ? null : submit,
          child: Text(TalkLocalizations.of(context).roomCreate),
        ),
      ],
    );
  }

  Widget buildAutocomplete() {
    final shareTypes = <core.ShareType>[];
    if (selectedType == spreed.RoomType.oneToOne) {
      shareTypes.add(core.ShareType.user);
    } else if (selectedType == spreed.RoomType.group) {
      shareTypes.add(core.ShareType.group);
    }

    return NeonAutocomplete(
      key: Key(selectedType!.index.toString()),
      itemType: 'call',
      itemId: 'new',
      shareTypes: shareTypes,
      validator: (input) => validateNotEmpty(context, input),
      decoration: InputDecoration(
        hintText: selectedType == spreed.RoomType.oneToOne
            ? TalkLocalizations.of(context).roomCreateUserName
            : TalkLocalizations.of(context).roomCreateGroupName,
      ),
      onFieldSubmitted: (_) {
        submit();
      },
      resultBuilder: buildResult,
      onSelected: (result) {
        setState(() {
          selectedResult = result;
        });
      },
    );
  }

  Widget buildResult(
    BuildContext context,
    core.AutocompleteResult result,
    void Function(core.AutocompleteResult)? onSelected,
  ) {
    final icon = switch (result.source) {
      'users' => NeonUserAvatar(
          username: result.id,
          account: NeonProvider.of<Account>(context),
          userStatusBloc: NeonProvider.of<UserStatusBloc>(context),
        ),
      'groups' => CircleAvatar(
          child: Icon(
            AdaptiveIcons.group,
          ),
        ),
      _ => throw UnimplementedError('Autocomplete source ${result.source} has no icon') // coverage:ignore-line
    };

    return ListTile(
      title: Text(result.label),
      subtitle: Text(result.id),
      leading: icon,
      onTap: onSelected != null ? () => onSelected(result) : null,
    );
  }
}
