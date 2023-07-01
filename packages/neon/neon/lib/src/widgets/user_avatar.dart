// ignore_for_file: use_late_for_private_fields_and_variables
// ^ This is a really strange false positive, it goes of at a very random place without any meaning. Hopefully fixed soon?

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/result.dart';
import 'package:neon/src/widgets/cached_image.dart';
import 'package:neon/src/widgets/result_builder.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

const kAvatarSize = 40.0;

class NeonUserAvatar extends StatefulWidget {
  NeonUserAvatar({
    required this.account,
    final String? username,
    this.showStatus = true,
    this.size = kAvatarSize,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  }) : username = username ?? account.client.username!;

  final Account account;
  final String username;
  final bool showStatus;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  State<NeonUserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<NeonUserAvatar> {
  late final _userStatusBloc = Provider.of<AccountsBloc>(context, listen: false).getUserStatusesBlocFor(widget.account);
  late double size;

  @override
  void initState() {
    super.initState();

    if (widget.showStatus) {
      unawaited(_userStatusBloc.load(widget.username));
    }
  }

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) {
          final brightness = Theme.of(context).brightness;
          size = constraints.constrain(Size.square(widget.size)).shortestSide;
          final pixelSize = (size * MediaQuery.of(context).devicePixelRatio).toInt();
          return Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size / 2,
                backgroundColor: widget.backgroundColor,
                child: ClipOval(
                  child: NeonCachedImage.custom(
                    cacheKey: '${widget.account.id}-avatar-${widget.username}-$brightness$pixelSize',
                    getImage: () async {
                      if (brightness == Brightness.dark) {
                        return widget.account.client.core.getDarkAvatar(
                          userId: widget.username,
                          size: pixelSize,
                        );
                      } else {
                        return widget.account.client.core.getAvatar(
                          userId: widget.username,
                          size: pixelSize,
                        );
                      }
                    },
                  ),
                ),
              ),
              if (widget.showStatus) ...[
                ResultBuilder<UserStatusPublicStatus?>(
                  stream: _userStatusBloc.statuses.mapNotNull((final statuses) => statuses[widget.username]),
                  builder: _userStatusIconBuilder,
                ),
              ],
            ],
          );
        },
      );

  Widget _userStatusIconBuilder(final BuildContext context, final Result<UserStatusPublicStatus?> result) {
    final hasEmoji = result.data?.icon != null;
    final scaledSize = size / (hasEmoji ? 2 : 3);

    Widget? child;
    Decoration? decoration;
    if (result.isLoading) {
      child = CircularProgressIndicator(
        strokeWidth: 1.5,
        color: widget.foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
      );
    } else if (result.hasError) {
      child = Icon(
        Icons.error_outline,
        size: scaledSize,
        color: Theme.of(context).colorScheme.error,
      );
    } else if (hasEmoji) {
      child = Text(
        result.data!.icon!,
        style: const TextStyle(
          fontSize: 16,
        ),
      );
    } else if (result.hasData) {
      decoration = BoxDecoration(
        shape: BoxShape.circle,
        color: _userStatusToColor(result.data!.status),
      );
    }

    return SizedBox.square(
      dimension: size,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: scaledSize,
          height: scaledSize,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }

  Color? _userStatusToColor(final UserStatusType userStatusType) => switch (userStatusType) {
        UserStatusType.online => const Color(0xFF49B382),
        UserStatusType.away => const Color(0xFFF4A331),
        UserStatusType.dnd => const Color(0xFFED484C),
        _ => null,
      };
}
