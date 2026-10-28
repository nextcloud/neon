import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'login_flow_v2_event.dart';
part 'login_flow_v2_state.dart';

final _log = Logger('LoginFlowV2Bloc');

@internal
class LoginFlowV2Bloc extends Bloc<LoginFlowV2Event, LoginFlowV2State> {
  LoginFlowV2Bloc({
    required AccountRepository accountRepository,
    required Uri serverURL,
  })  : _accountRepository = accountRepository,
        super(LoginFlowV2StateInitial(serverURL: serverURL)) {
    on<LoginFlowV2Init>(_onLoginFlowV2Init);
    on<LoginFlowV2OpenPage>(_onLoginFlowV2OpenPage);
    on<_LoginFlowV2Poll>(_onLoginFlowV2Poll, transformer: droppable());
  }

  final AccountRepository _accountRepository;

  String? _lastLoggedError;

  Timer? _pollTimer;

  Future<void> _onLoginFlowV2Init(LoginFlowV2Init event, Emitter<LoginFlowV2State> emit) async {
    _pollTimer?.cancel();

    try {
      final (loginUrl, token) = await _accountRepository.loginFlowInit(state.serverURL);

      emit(
        LoginFlowV2StatePolling(
          serverURL: state.serverURL,
          loginEndpoint: loginUrl,
          token: token,
        ),
      );

      add(const LoginFlowV2OpenPage());
      _pollTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        add(const _LoginFlowV2Poll());
      });
    } on InitLoginFailure catch (error, stackTrace) {
      addError(error.error, stackTrace);
    }
  }

  Future<void> _onLoginFlowV2OpenPage(LoginFlowV2OpenPage event, Emitter<LoginFlowV2State> emit) async {
    final state = this.state;
    if (state is! LoginFlowV2StatePolling) {
      return;
    }

    await launchUrl(
      state.loginEndpoint,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _onLoginFlowV2Poll(_LoginFlowV2Poll event, Emitter<LoginFlowV2State> emit) async {
    final state = this.state;
    if (state is! LoginFlowV2StatePolling) {
      return;
    }

    try {
      final credentials = await _accountRepository.loginFlowPoll(
        state.serverURL,
        state.token,
      );

      if (credentials != null) {
        _pollTimer?.cancel();
        emit(
          LoginFlowV2StateSuccess(
            serverURL: state.serverURL,
            credentials: credentials,
          ),
        );
      }
    } on PollLoginFailure catch (error, stackTrace) {
      // Do not abort polling here, because app could be simply in background waiting for user to return.
      addError(error.error, stackTrace);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    final errorSignature = error.toString();
    if (_lastLoggedError != errorSignature) {
      // Avoid repeating identical error logs while polling continues to fail the same way.
      _log.warning('Login flow error.', error, stackTrace);
      _lastLoggedError = errorSignature;
    }
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() async {
    _pollTimer?.cancel();
    await super.close();
  }
}
