import 'package:account_repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

@internal
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AccountRepository accountRepository,
    Uri? serverURL,
    Credentials? credentials,
  })  : _accountRepository = accountRepository,
        super(
          LoginState.initial(
            serverURL: credentials?.serverURL ?? serverURL,
            credentials: credentials,
          ),
        ) {
    on<LoginUseQRCode>(_onLoginUseQRCode);
    on<LoginUrlEntered>(_onLoginUrlEntered);
    on<LoginServerChecked>(_onLoginServerChecked);
    on<LoginCredentialsEntered>(_onLoginCredentialsEntered);
    on<LoginAccountChecked>(_onLoginAccountChecked);
  }

  final AccountRepository _accountRepository;

  void _onLoginUseQRCode(LoginUseQRCode event, Emitter<LoginState> emit) {
    emit(const LoginStateScanQrCode());
  }

  void _onLoginUrlEntered(LoginUrlEntered event, Emitter<LoginState> emit) {
    emit(
      LoginStateCheckServer(
        serverURL: event.serverURL,
        credentials: event.credentials,
      ),
    );
  }

  void _onLoginServerChecked(LoginServerChecked event, Emitter<LoginState> emit) {
    switch (state) {
      case LoginStateCheckServer(:final credentials) when credentials != null:
        emit(LoginStateCheckAccount(credentials: credentials));

      case LoginStateCheckServer(:final serverURL):
        emit(LoginStateFlowV2(serverURL: serverURL));

      default:
        return;
    }
  }

  void _onLoginCredentialsEntered(LoginCredentialsEntered event, Emitter<LoginState> emit) {
    emit(LoginStateCheckAccount(credentials: event.credentials));
  }

  Future<void> _onLoginAccountChecked(LoginAccountChecked event, Emitter<LoginState> emit) async {
    await _accountRepository.logIn(event.account);
    emit(const LoginStateDone());
  }
}
