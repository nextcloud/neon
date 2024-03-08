// ignore_for_file: public_member_api_docs

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/group_avatar.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';
import 'package:nextcloud/core.dart';

class NeonRichObject extends MatchText {
  NeonRichObject({
    required Map<String, dynamic> parameters,
    required TextStyle style,
    required bool fullContent,
  }) : super(
          onTap: (_) {},
          pattern: '{(${parameters.keys.join('|')})}',
          renderWidget: ({
            required pattern,
            required text,
          }) =>
              Builder(
            builder: (context) {
              final richObject = parameters[text.substring(1, text.length - 1)] as BuiltMap<String, JsonObject>;
              final type = (richObject['type']! as StringJsonObject).value;

              switch (type) {
                case 'user':
                  final account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
                  final id = (richObject['id']! as StringJsonObject).value;

                  final highlight = id == account.username;
                  return _buildChip(
                    context: context,
                    avatar: NeonUserAvatar.withAccount(
                      account: account,
                      username: id,
                      showStatus: false,
                      size: 20,
                    ),
                    label: Text(
                      (richObject['name']! as StringJsonObject).value,
                      style: style.copyWith(
                        color: highlight
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    highlight: highlight,
                  );
                case 'group':
                case 'call':
                  return _buildChip(
                    context: context,
                    avatar: const NeonGroupAvatar(
                      size: 10,
                    ),
                    label: Text(
                      (richObject['name']! as StringJsonObject).value,
                      style: style,
                    ),
                    highlight: true,
                  );
                case 'file':
                  void onTap() {
                    final link = Uri.parse((richObject['link']! as StringJsonObject).value);
                    final account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
                    context.go(account.completeUri(link).toString());
                  }
                  final previewAvailable = (richObject['preview-available']! as StringJsonObject).value == 'yes';
                  if (previewAvailable && fullContent) {
                    final id = int.parse((richObject['id']! as StringJsonObject).value);
                    final path = (richObject['path']! as StringJsonObject).value;
                    final etag = (richObject['etag']! as StringJsonObject).value;
                    final width = (richObject['width']! as NumJsonObject).value.toInt();
                    final height = (richObject['height']! as NumJsonObject).value.toInt();
                    return InkWell(
                      onTap: onTap,
                      child: NeonApiImage(
                        cacheKey: 'preview-$path-$width-$height',
                        etag: etag,
                        expires: null,
                        getImage: (client) => client.core.preview.getPreviewByFileIdRaw(
                          fileId: id,
                          x: width,
                          y: height,
                        ),
                      ),
                    );
                  } else {
                    final name = (richObject['name']! as StringJsonObject).value;
                    return InkWell(
                      onTap: onTap,
                      child: Text(
                        name,
                        style: style.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: style.color,
                        ),
                      ),
                    );
                  }
                default:
                  debugPrint('Rich message type $richObject not implemented yet');
                  return Text(
                    text,
                    style: style,
                  );
              }
            },
          ),
        );

  static Widget _buildChip({
    required BuildContext context,
    required Widget avatar,
    required Widget label,
    required bool highlight,
  }) =>
      Chip(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
        avatar: avatar,
        label: label,
        backgroundColor: highlight ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.only(right: 7.5),
      );
}
