import 'package:flutter/material.dart';

class NeonValidationTile extends StatelessWidget {
  const NeonValidationTile({
    required this.title,
    required this.state,
    super.key,
  });

  final String title;
  final ValidationState state;

  @override
  Widget build(final BuildContext context) {
    const size = 32.0;

    final leading = switch (state) {
      ValidationState.loading => const SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      ValidationState.failure => Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
          size: size,
        ),
      ValidationState.canceled => Icon(
          Icons.cancel_outlined,
          color: Theme.of(context).disabledColor,
          size: size,
        ),
      ValidationState.success => Icon(
          Icons.check_circle,
          color: Theme.of(context).colorScheme.primary,
          size: size,
        ),
    };
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: state == ValidationState.canceled ? TextStyle(color: Theme.of(context).disabledColor) : null,
      ),
    );
  }
}

enum ValidationState {
  loading,
  failure,
  canceled,
  success,
}
