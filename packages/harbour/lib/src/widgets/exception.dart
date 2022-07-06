part of '../harbour.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget(
    this.exception, {
    required this.onRetry,
    super.key,
  });

  final dynamic exception;
  final Function() onRetry;

  static void showSnackbar(final BuildContext context, final dynamic exception) {
    final details = _getExceptionDetails(context, exception);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(details.text),
        action: details.isUnauthorized
            ? SnackBarAction(
                label: AppLocalizations.of(context).loginAgain,
                onPressed: () async => _openLoginPage(context),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => exception == null
      ? Container()
      : Padding(
          padding: const EdgeInsets.all(5),
          child: Builder(
            builder: (final context) {
              final details = _getExceptionDetails(context, exception);

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 30,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          details.text,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (details.isUnauthorized) ...[
                    ElevatedButton(
                      onPressed: () async => _openLoginPage(context),
                      child: Text(AppLocalizations.of(context).loginAgain),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () async => onRetry(),
                      child: Text(AppLocalizations.of(context).retry),
                    ),
                  ],
                ],
              );
            },
          ),
        );

  static _ExceptionDetails _getExceptionDetails(final BuildContext context, final dynamic exception) {
    if (exception is String) {
      return _ExceptionDetails(
        text: exception,
      );
    }

    if (exception is MissingPermissionException) {
      return _ExceptionDetails(
        text: AppLocalizations.of(context).errorMissingPermission(exception.permission.toString().split('.')[1]),
      );
    }

    if (exception is ApiException) {
      if (exception.code == 401) {
        return _ExceptionDetails(
          text: AppLocalizations.of(context).errorCredentialsForAccountNoLongerMatch,
          isUnauthorized: true,
        );
      }

      if (exception.code >= 500 && exception.code <= 599) {
        return _ExceptionDetails(
          text: AppLocalizations.of(context).errorServerHadAProblemProcessingYourRequest,
        );
      }
    }

    final socketException = _getSpecificExceptionForException<SocketException>(exception);
    if (socketException != null) {
      return _ExceptionDetails(
        text: socketException.address != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(socketException.address!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    final clientException = _getSpecificExceptionForException<ClientException>(exception);
    if (clientException != null) {
      return _ExceptionDetails(
        text: clientException.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(clientException.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    final httpException = _getSpecificExceptionForException<HttpException>(exception);
    if (httpException != null) {
      return _ExceptionDetails(
        text: httpException.uri != null
            ? AppLocalizations.of(context).errorUnableToReachServerAt(httpException.uri!.host)
            : AppLocalizations.of(context).errorUnableToReachServer,
      );
    }

    if (exception is TimeoutException) {
      return _ExceptionDetails(
        text: AppLocalizations.of(context).errorConnectionTimedOut,
      );
    }

    return _ExceptionDetails(
      text: AppLocalizations.of(context).errorSomethingWentWrongTryAgainLater,
    );
  }

  static T? _getSpecificExceptionForException<T extends Exception>(final dynamic exception) {
    if (exception is T) {
      return exception;
    }
    if (exception is ApiException && exception.innerException != null && exception.innerException is T) {
      return exception.innerException! as T;
    }

    return null;
  }

  static Future _openLoginPage(final BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final context) => LoginPage(
          serverURL: RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!.serverURL,
        ),
      ),
    );
  }
}

class _ExceptionDetails {
  _ExceptionDetails({
    required this.text,
    this.isUnauthorized = false,
  });

  final String text;
  final bool isUnauthorized;
}
