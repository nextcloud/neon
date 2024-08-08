import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon_framework/theme.dart';
import 'package:rxdart/rxdart.dart';

/// Input field for profile properties of the user.
class NeonSettingsProfileField extends StatefulWidget {
  /// Creates a new [NeonSettingsProfileField].
  const NeonSettingsProfileField({
    required this.value,
    required this.scope,
    required this.labelText,
    required this.hintText,
    required this.onUpdateValue,
    required this.onUpdateScope,
    this.keyboardType,
    super.key,
  });

  /// Value of the profile property.
  final String value;

  /// Scope of the profile property.
  final String scope;

  /// Label for the profile property.
  final String labelText;

  /// Hint text for the profile property in the value is empty.
  final String hintText;

  /// Called when the value is updated.
  final void Function(String value) onUpdateValue;

  /// Called when the scope is updated.
  final void Function(String scope) onUpdateScope;

  /// Keyboard type used for the input field.
  final TextInputType? keyboardType;

  @override
  State<NeonSettingsProfileField> createState() => _NeonSettingsProfileFieldState();
}

class _NeonSettingsProfileFieldState extends State<NeonSettingsProfileField> {
  late final textEditingController = TextEditingController(
    text: widget.value,
  );
  final streamController = StreamController<String>();
  late final stream = streamController.stream.asBroadcastStream();
  late final StreamSubscription<String> subscription;
  late String submittedValue = widget.value;

  @override
  void initState() {
    super.initState();

    subscription = stream.debounceTime(const Duration(seconds: 1)).listen((value) {
      if (value != submittedValue) {
        setState(() {
          submittedValue = value;
          widget.onUpdateValue(value);
        });
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    unawaited(subscription.cancel());
    unawaited(streamController.close());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scopeButton = MenuAnchor(
      menuChildren: [
        for (final scope in ['v2-private', 'v2-local', 'v2-federated', 'v2-published'])
          MenuItemButton(
            leadingIcon: buildScopeIcon(scope),
            trailingIcon: scope == widget.scope ? const Icon(Icons.check) : null,
            onPressed: () {
              if (scope != widget.scope) {
                widget.onUpdateScope(scope);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Text(getScopeDescription(scope)),
              ),
            ),
          ),
      ],
      builder: (context, controller, child) => IconButton(
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        padding: const EdgeInsets.all(4),
        iconSize: 20,
        icon: buildScopeIcon(widget.scope),
        tooltip: getScopeDescription(widget.scope),
      ),
    );

    return CustomSettingsTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.labelText),
          const SizedBox(width: 5),
          scopeButton,
        ],
      ),
      subtitle: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: StreamBuilder(
            stream: stream,
            builder: (context, valueSnapshot) => valueSnapshot.data == submittedValue
                ? const Icon(
                    Icons.check,
                    color: NcColors.success,
                  )
                : const SizedBox(),
          ),
        ),
        keyboardType: widget.keyboardType,
        onChanged: streamController.add,
        onSubmitted: (value) {
          if (value != submittedValue) {
            setState(() {
              submittedValue = value;
              widget.onUpdateValue(value);
            });
          }
        },
      ),
    );
  }

  Icon buildScopeIcon(String scope) {
    return Icon(
      switch (scope) {
        'v2-private' => Icons.phone_android,
        'v2-local' || 'private' => Icons.lock,
        'v2-federated' || 'contacts' => Icons.groups,
        'v2-published' || 'public' => Icons.web,
        _ => throw UnimplementedError('Unknown scope $scope'), // coverage:ignore-line
      },
    );
  }

  String getScopeDescription(String scope) {
    final localizations = NeonLocalizations.of(context);

    return switch (scope) {
      'v2-private' => localizations.accountOptionsProfileScopePrivate,
      'v2-local' || 'private' => localizations.accountOptionsProfileScopeLocal,
      'v2-federated' || 'contacts' => localizations.accountOptionsProfileScopeFederated,
      'v2-published' || 'public' => localizations.accountOptionsProfileScopePublished,
      _ => throw UnimplementedError('Unknown scope $scope'), // coverage:ignore-line
    };
  }
}
