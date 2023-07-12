import 'package:flutter/material.dart';
import 'package:neon/src/theme/neon.dart';

/// Custom app branding
///
/// Descendant widgets obtain the current [Branding] object using
/// `Branding.of(context)`. Instances of [Branding] can be customized with
/// [Branding.copyWith].
@immutable
class Branding {
  /// Creates a custom branding
  const Branding({
    required this.name,
    required this.logo,
    this.legalese,
    this.showLoginWithNextcloud = false,
  });

  /// App name
  final String name;

  /// Logo of the app shown on various places in the app.
  final Widget logo;

  /// A string to show in small print.
  ///
  /// Typically this is a copyright notice shown as the [AboutDialog.applicationLegalese].
  final String? legalese;

  /// Whether to show the Nextcloud logo on the LoginPage
  final bool showLoginWithNextcloud;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  Branding copyWith({
    final String? name,
    final Widget? logo,
    final String? legalese,
  }) =>
      Branding(
        name: name ?? this.name,
        logo: logo ?? this.logo,
        legalese: legalese ?? this.legalese,
      );

  /// The data from the closest [Branding] instance given the build context.
  static Branding of(final BuildContext context) => Theme.of(context).extension<NeonTheme>()!.branding;

  @override
  int get hashCode => Object.hashAll([
        name,
        logo,
        legalese,
      ]);

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Branding && name == other.name && logo == other.logo && legalese == other.legalese;
  }
}
