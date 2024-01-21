import 'package:flutter/material.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/widgets.dart';

/// Dialog for setting the weather location.
class DashboardSetWeatherLocationDialog extends StatefulWidget {
  /// Create a new dialog for setting the weather location.
  const DashboardSetWeatherLocationDialog({
    required this.currentAddress,
    super.key,
  });

  /// The current weather address.
  final String? currentAddress;

  @override
  State<DashboardSetWeatherLocationDialog> createState() => _DashboardSetWeatherLocationDialogState();
}

class _DashboardSetWeatherLocationDialogState extends State<DashboardSetWeatherLocationDialog> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = widget.currentAddress ?? '';
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void submit() {
    Navigator.pop(context, controller.text.isNotEmpty ? controller.text : null);
  }

  @override
  Widget build(BuildContext context) => NeonDialog(
        title: Text(DashboardLocalizations.of(context).locationSet),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.streetAddress,
          decoration: InputDecoration(
            hintText: DashboardLocalizations.of(context).address,
          ),
          onSubmitted: (_) {
            submit();
          },
        ),
        actions: [
          NeonDialogAction(
            isDefaultAction: true,
            onPressed: submit,
            child: Text(NeonLocalizations.of(context).actionDone),
          ),
        ],
      );
}
