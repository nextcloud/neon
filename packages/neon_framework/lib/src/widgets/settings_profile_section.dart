import 'package:flutter/material.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/settings/widgets/settings_category.dart';
import 'package:neon_framework/src/utils/password_confirmation.dart';
import 'package:neon_framework/src/widgets/settings_profile_field.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;

/// A settings section allowing the user to view and edit their profile properties.
class NeonSettingsProfileSection extends StatelessWidget {
  /// Creates a new [NeonSettingsProfileSection].
  const NeonSettingsProfileSection({
    required this.userDetails,
    required this.onUpdateProperty,
    super.key,
  });

  /// All detailed properties of the user.
  final provisioning_api.UserDetails userDetails;

  /// Called when a property is updated.
  final void Function(String key, String value) onUpdateProperty;

  @override
  Widget build(BuildContext context) {
    return SettingsCategory(
      title: Text(NeonLocalizations.of(context).accountOptionsCategoryProfile),
      tiles: _buildFields(context, userDetails).toList(),
    );
  }

  Iterable<Widget> _buildFields(BuildContext context, provisioning_api.UserDetails userDetails) sync* {
    final data = userDetails.toJson();
    final localizations = NeonLocalizations.of(context);

    yield _buildField(
      context,
      data,
      key: 'displayname',
      label: localizations.accountOptionsProfileDisplayNameLabel,
      hint: localizations.accountOptionsProfileDisplayNameHint,
    );

    yield _buildField(
      context,
      data,
      key: 'email',
      label: localizations.accountOptionsProfileEmailLabel,
      hint: localizations.accountOptionsProfileEmailHint,
      keyboardType: TextInputType.emailAddress,
    );

    yield _buildField(
      context,
      data,
      key: 'phone',
      label: localizations.accountOptionsProfilePhoneLabel,
      hint: localizations.accountOptionsProfilePhoneHint,
      keyboardType: TextInputType.phone,
    );

    yield _buildField(
      context,
      data,
      key: 'address',
      label: localizations.accountOptionsProfileAddressLabel,
      hint: localizations.accountOptionsProfileAddressHint,
      keyboardType: TextInputType.streetAddress,
    );

    // Language and locale fields are omitted intentionally as these only make sense for the Web UI
    // and do not affect the app settings.

    yield _buildField(
      context,
      data,
      key: 'website',
      label: localizations.accountOptionsProfileWebsiteLabel,
      hint: localizations.accountOptionsProfileWebsiteHint,
      keyboardType: TextInputType.url,
    );

    yield _buildField(
      context,
      data,
      key: 'twitter',
      label: localizations.accountOptionsProfileTwitterLabel,
      hint: localizations.accountOptionsProfileTwitterHint,
    );

    yield _buildField(
      context,
      data,
      key: 'fediverse',
      label: localizations.accountOptionsProfileFediverseLabel,
      hint: localizations.accountOptionsProfileFediverseHint,
    );

    yield _buildField(
      context,
      data,
      key: 'organisation',
      label: localizations.accountOptionsProfileOrganisationLabel,
      hint: localizations.accountOptionsProfileOrganisationHint,
    );

    yield _buildField(
      context,
      data,
      key: 'role',
      label: localizations.accountOptionsProfileRoleLabel,
      hint: localizations.accountOptionsProfileRoleHint,
    );

    yield _buildField(
      context,
      data,
      key: 'headline',
      label: localizations.accountOptionsProfileHeadlineLabel,
      hint: localizations.accountOptionsProfileHeadlineHint,
    );

    yield _buildField(
      context,
      data,
      key: 'biography',
      label: localizations.accountOptionsProfileBiographyLabel,
      hint: localizations.accountOptionsProfileBiographyHint,
    );
  }

  Widget _buildField(
    BuildContext context,
    Map<String, dynamic> userDetails, {
    required String key,
    required String label,
    required String hint,
    TextInputType? keyboardType,
  }) {
    final value = userDetails[key] as String;
    final scopeKey = '${key}Scope';
    final scopeValue = userDetails[scopeKey] as String;

    return NeonSettingsProfileField(
      value: value,
      scope: scopeValue,
      labelText: label,
      hintText: hint,
      onUpdateValue: (value) async {
        if (await confirmPassword(context)) {
          onUpdateProperty(key, value);
        }
      },
      onUpdateScope: (scope) async {
        if (await confirmPassword(context)) {
          onUpdateProperty(scopeKey, scope);
        }
      },
      keyboardType: keyboardType,
    );
  }
}
