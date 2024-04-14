import 'package:flutter/material.dart';

/// Defines the custom Talk theme.
class TalkTheme extends ThemeExtension<TalkTheme> {
  /// Creates a new Talk theme.
  const TalkTheme({
    this.messageConstraints = const BoxConstraints(
      maxWidth: 1120,
    ),
  });

  /// The constraints that are applied to message widgets.
  final BoxConstraints messageConstraints;

  @override
  TalkTheme copyWith({BoxConstraints? messageConstraints}) {
    return TalkTheme(
      messageConstraints: messageConstraints ?? this.messageConstraints,
    );
  }

  @override
  TalkTheme lerp(covariant TalkTheme? other, double t) {
    throw UnimplementedError();
  }
}
