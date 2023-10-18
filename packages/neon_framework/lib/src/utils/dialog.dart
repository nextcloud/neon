// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:neon_framework/src/widgets/dialog.dart';

Future<bool> showConfirmationDialog(final BuildContext context, final String title) async =>
    await showDialog<bool>(
      context: context,
      builder: (final context) => NeonConfirmationDialog(
        title: title,
      ),
    ) ??
    false;

Future<String?> showRenameDialog({
  required final BuildContext context,
  required final String title,
  required final String value,
  final Key? key,
}) async =>
    showDialog<String?>(
      context: context,
      builder: (final context) => RenameDialog(
        title: title,
        value: value,
        key: key,
      ),
    );
