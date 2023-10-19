import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:nextcloud/nextcloud.dart';

/// An indicator that an [error] has occurred.
///
/// The action that lead to the error can be retried.
class NeonError extends StatelessWidget {
  /// Creates a NeonError.
  const NeonError(
    this.error, {
    required this.onRetry,
    this.onlyIcon = false,
    this.iconSize,
    this.color,
    super.key,
  });

  /// The error object.
  ///
  /// Can be of type [String] or [Exception], various subtypes of `Exception` are also handled separately.
  final Object? error;

  /// A function that's called when the user decides to retry the action that lead to the error.
  final VoidCallback onRetry;

  /// Changes whether the text is displayed additionally or not.
  final bool onlyIcon;

  /// The size of the icon in logical pixels.
  ///
  /// Defaults to a size of `30`.
  final double? iconSize;

  /// The color to use when drawing the error indicator.
  ///
  /// Defaults to the nearest [IconTheme]'s [ColorScheme.error].
  final Color? color;

  /// Shows a [SnackBar] popup for the [error].
  static void showSnackbar(final BuildContext context, final Object? error) {
    final details = getDetails(error);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(details.getText(context)),
        action: details.isUnauthorized
            ? SnackBarAction(
                label: NeonLocalizations.of(context).loginAgain,
                onPressed: () => _openLoginPage(context),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    if (error == null) {
      return const SizedBox();
    }

    final details = getDetails(error);
    final color = this.color ?? Theme.of(context).colorScheme.error;

    final errorIcon = Icon(
      Icons.error_outline,
      size: iconSize ?? 30,
      color: color,
    );

    final message =
        details.isUnauthorized ? NeonLocalizations.of(context).loginAgain : NeonLocalizations.of(context).actionRetry;

    final onPressed = details.isUnauthorized ? () => _openLoginPage(context) : onRetry;

    if (onlyIcon) {
      return Semantics(
        tooltip: details.getText(context),
        child: IconButton(
          icon: errorIcon,
          padding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          tooltip: message,
          onPressed: onPressed,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              errorIcon,
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  details.getText(context),
                  style: TextStyle(
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(message),
          ),
        ],
      ),
    );
  }

  /// Gets the details for a given [error].
  @internal
  static NeonExceptionDetails getDetails(final Object? error) {
    switch (error) {
      case String():
        return NeonExceptionDetails(
          getText: (final _) => error,
        );
      case NeonException():
        return error.details;
      case DynamiteApiException():
        if (error.statusCode == 401) {
          return NeonExceptionDetails(
            getText: (final context) => NeonLocalizations.of(context).errorCredentialsForAccountNoLongerMatch,
            isUnauthorized: true,
          );
        }
        if (error.statusCode >= 500 && error.statusCode <= 599) {
          return NeonExceptionDetails(
            getText: (final context) => NeonLocalizations.of(context).errorServerHadAProblemProcessingYourRequest,
          );
        }
      case SocketException():
        return NeonExceptionDetails(
          getText: (final context) => error.address != null
              ? NeonLocalizations.of(context).errorUnableToReachServerAt(error.address!.host)
              : NeonLocalizations.of(context).errorUnableToReachServer,
        );
      case ClientException():
        return NeonExceptionDetails(
          getText: (final context) => error.uri != null
              ? NeonLocalizations.of(context).errorUnableToReachServerAt(error.uri!.host)
              : NeonLocalizations.of(context).errorUnableToReachServer,
        );
      case HttpException():
        return NeonExceptionDetails(
          getText: (final context) => error.uri != null
              ? NeonLocalizations.of(context).errorUnableToReachServerAt(error.uri!.host)
              : NeonLocalizations.of(context).errorUnableToReachServer,
        );
      case TimeoutException():
        return NeonExceptionDetails(
          getText: (final context) => NeonLocalizations.of(context).errorConnectionTimedOut,
        );
    }

    return NeonExceptionDetails(
      getText: (final context) => NeonLocalizations.of(context).errorSomethingWentWrongTryAgainLater,
    );
  }

  static void _openLoginPage(final BuildContext context) {
    unawaited(
      LoginCheckServerStatusRoute(
        serverUrl: NeonProvider.of<AccountsBloc>(context).activeAccount.value!.serverURL,
      ).push(context),
    );
  }
}
