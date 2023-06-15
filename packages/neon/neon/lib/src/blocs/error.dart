part of 'blocs.dart';

typedef TranslationCallback = String Function(AppLocalizations l10n);

abstract class ErrorBlocEvents {
  /// Adds an error to the [ErrorBlocStates.globalErrors].
  ///
  /// Used to signal non app specific errors.
  void addGlobalError(final String message);

  /// Adds an error to the [ErrorBlocStates.appErrors].
  ///
  /// Used to signal errors specific to an app identified by [appId].
  void addAppError(final String appId, final String message);
}

abstract class ErrorBlocStates {
  /// Errors for the global neon framework.
  BehaviorSubject<String> get globalErrors;

  /// Errors for a specific app.
  Map<String, BehaviorSubject<String>> get appErrors;
}

/// Holds error messages to be displayed by the UI
///
/// It will cache the last emmited error.
/// The [ErrorBloc] is a singleton.
class ErrorBloc extends Bloc implements ErrorBlocEvents, ErrorBlocStates {
  factory ErrorBloc() => instance ??= ErrorBloc._();

  @visibleForTesting
  factory ErrorBloc.mocked(final ErrorBloc mock) => instance ??= mock;

  ErrorBloc._();

  @visibleForTesting
  static ErrorBloc? instance;

  AppLocalizations? l10n;

  @override
  final BehaviorSubject<String> globalErrors = BehaviorSubject();
  @override
  final Map<String, BehaviorSubject<String>> appErrors = {};

  @override
  void dispose() {
    ErrorBloc.instance = null;
  }

  @override
  void addGlobalError(final String message) {
    globalErrors.add(message);
  }

  @override
  void addAppError(final String appId, final String message) {
    if (appErrors[appId] == null) {
      appErrors[appId] = BehaviorSubject();
    }

    appErrors[appId]!.add(message);
  }

  void addVersionErrors(final Iterable<(String, Object?)> errors) {
    assert(l10n != null, 'Localization must be register to process version Errors.');

    final buffer = StringBuffer();

    for (final error in errors) {
      // TODO: reword errorUnsupportedVersion to support multiple errors
      // TODO: add version info

      final (appId, minVersion) = error;
      final appName = l10n!.appImplementationName(appId);
      final message = l10n!.errorUnsupportedVersion(appName);

      buffer.write(message);
    }

    if (buffer.isNotEmpty) {
      addGlobalError(buffer.toString());
    }
  }

  String translateError(final TranslationCallback callback) => callback(l10n!);
}
