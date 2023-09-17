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

class NeonException extends StatelessWidget {
  const NeonException(
    this.exception, {
    required this.onRetry,
    this.onlyIcon = false,
    this.iconSize,
    this.color,
    super.key,
  });

  final dynamic exception;
  final VoidCallback onRetry;
  final bool onlyIcon;
  final double? iconSize;
  final Color? color;

  static void showSnackbar(final BuildContext context, final dynamic exception) {
    final details = getDetails(context, exception);

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
    if (exception == null) {
      return const SizedBox();
    }

    final details = getDetails(context, exception);
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
  static ExceptionDetails getDetails(final BuildContext context, final dynamic exception) {
    if (exception is String) {
      return ExceptionDetails(
        text: exception,
      );
    }

    if (exception is MissingPermissionException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorMissingPermission(exception.permission.toString().split('.')[1]),
      );
    }

    if (exception is UnableToOpenFileException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorUnableToOpenFile,
      );
    }

    if (exception is InvalidQrcodeException) {
      return ExceptionDetails(
        text: AppLocalizations.of(context).errorInvalidQrcode,
      );
    }

    if (exception is DynamiteApiException) {
      if (exception.statusCode == 401) {
        return ExceptionDetails(
          text: AppLocalizations.of(context).errorCredentialsForAccountNoLongerMatch,
          isUnauthorized: true,
        );
      }

      if (exception.statusCode >= 500 && exception.statusCode <= 599) {
        return ExceptionDetails(
          text: AppLocalizations.of(context).errorServerHadAProblemProcessingYourRequest,
        );
      }
    }

    if (exception is SocketException) {
      return ExceptionDetails(
        text: exception.address != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(exception.address!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (exception is ClientException) {
      return ExceptionDetails(
        text: exception.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(exception.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (exception is HttpException) {
      return ExceptionDetails(
        text: exception.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(exception.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (exception is TimeoutException) {
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
