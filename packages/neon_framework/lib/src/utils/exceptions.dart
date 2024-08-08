import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/models/label_builder.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

/// Details of a [NeonException].
class NeonExceptionDetails {
  /// Creates new [NeonExceptionDetails].
  ///
  /// [isUnauthorized] defaults to false.
  const NeonExceptionDetails({
    required this.getText,
    this.isUnauthorized = false,
  });

  /// Creates the details from the given [error].
  factory NeonExceptionDetails.fromError(Object? error) {
    return switch (error) {
      String() => NeonExceptionDetails(
          getText: (_) => error,
        ),
      NeonException() => error.details,
      DynamiteStatusCodeException(statusCode: 401) => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorCredentialsForAccountNoLongerMatch,
          isUnauthorized: true,
        ),
      DynamiteStatusCodeException(statusCode: 429) => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorBruteforceThrottled,
        ),
      DynamiteStatusCodeException(statusCode: >= 500 && <= 599) => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorServerHadAProblemProcessingYourRequest,
        ),
      SocketException(:final address) when address != null => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServerAt(address.host),
        ),
      SocketException() => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServer,
        ),
      ClientException(:final uri) when uri != null => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServerAt(uri.host),
        ),
      ClientException() => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServer,
        ),
      HttpException(:final uri) when uri != null => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServerAt(uri.host),
        ),
      HttpException() => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorUnableToReachServer,
        ),
      TimeoutException() => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorConnectionTimedOut,
        ),
      _ => NeonExceptionDetails(
          getText: (context) => NeonLocalizations.of(context).errorSomethingWentWrongTryAgainLater,
        ),
    };
  }

  /// Text that will be displayed in the UI
  final LabelBuilder getText;

  /// If the [Exception] is the result of an unauthorized API request this should be set to `true`.
  ///
  /// The user will then be shown a button to update the credentials of the account instead of retrying the action.
  final bool isUnauthorized;
}

/// Extensible [Exception] to be used for displaying custom errors in the UI.
@immutable
abstract class NeonException implements Exception {
  /// Creates a NeonException
  const NeonException();

  /// Details that will be rendered by the UI.
  NeonExceptionDetails get details;
}

/// [Exception] that should be thrown when a native permission is denied.
class MissingPermissionException extends NeonException {
  /// Creates a MissingPermissionException
  const MissingPermissionException(this.permission);

  /// Permission that was denied
  final Permission permission;

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (context) => NeonLocalizations.of(context).errorMissingPermission(permission.toString().split('.')[1]),
      );
}
