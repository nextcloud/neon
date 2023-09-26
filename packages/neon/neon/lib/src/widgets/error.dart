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

class NeonError extends StatelessWidget {
  const NeonError(
    this.error, {
    required this.onRetry,
    this.onlyIcon = false,
    this.iconSize,
    this.color,
    super.key,
  });

  final dynamic error;
  final VoidCallback onRetry;
  final bool onlyIcon;
  final double? iconSize;
  final Color? color;

  static void showSnackbar(final BuildContext context, final dynamic error) {
    final details = getDetails(context, error);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(details.text),
        action: details.isUnauthorized
            ? SnackBarAction(
                label: AppLocalizations.of(context).loginAgain,
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

    final details = getDetails(context, error);
    final color = this.color ?? Theme.of(context).colorScheme.error;

    final errorIcon = Icon(
      Icons.error_outline,
      size: iconSize ?? 30,
      color: color,
    );

    final message =
        details.isUnauthorized ? AppLocalizations.of(context).loginAgain : AppLocalizations.of(context).actionRetry;

    final onPressed = details.isUnauthorized ? () => _openLoginPage(context) : onRetry;

    if (onlyIcon) {
      return Semantics(
        tooltip: details.text,
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
                  details.text,
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

  @internal
  static ExceptionDetails getDetails(final BuildContext context, final dynamic error) {
    if (error is String) {
      return ExceptionDetails(
        text: error,
      );
    }

    if (error is MissingPermissionException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorMissingPermission(error.permission.toString().split('.')[1]),
      );
    }

    if (error is UnableToOpenFileException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorUnableToOpenFile,
      );
    }

    if (error is InvalidQRcodeException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorInvalidQRcode,
      );
    }

    if (error is DynamiteApiException) {
      if (error.statusCode == 401) {
        return ExceptionDetails(
          text: AppLocalizations.of(context).errorCredentialsForAccountNoLongerMatch,
          isUnauthorized: true,
        );
      }

      if (error.statusCode >= 500 && error.statusCode <= 599) {
        return ExceptionDetails(
          text: AppLocalizations.of(context).errorServerHadAProblemProcessingYourRequest,
        );
      }
    }

    if (error is SocketException) {
      return ExceptionDetails(
        text: error.address != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(error.address!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (error is ClientException) {
      return ExceptionDetails(
        text: error.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(error.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (error is HttpException) {
      return ExceptionDetails(
        text: error.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(error.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (error is TimeoutException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorConnectionTimedOut,
      );
    }

    return ExceptionDetails(
      text: AppLocalizations.of(context).errorSomethingWentWrongTryAgainLater,
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

@internal
class ExceptionDetails {
  ExceptionDetails({
    required this.text,
    this.isUnauthorized = false,
  });

  final String text;
  final bool isUnauthorized;
}
