import 'package:account_repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/core.dart' as core;

part 'login_check_server_event.dart';
part 'login_check_server_state.dart';

@internal
class LoginCheckServerBloc extends Bloc<LoginCheckServerEvent, LoginCheckServerState> {
  LoginCheckServerBloc({
    required AccountRepository accountRepository,
    required Uri serverURL,
  })  : _accountRepository = accountRepository,
        super(LoginCheckServerState(serverURL: serverURL)) {
    on<LoginCheckServer>(
      _onLoginCheckServer,
      transformer: droppable(),
    );
  }

  final AccountRepository _accountRepository;

  Future<void> _onLoginCheckServer(LoginCheckServer event, Emitter<LoginCheckServerState> emit) async {
    emit(
      state.copyWith(
        serverVersionState: const ServerVersionStateLoading(),
        maintenanceModeState: const MaintenanceModeStateLoading(),
      ),
    );

    try {
      final status = await _accountRepository.getServerStatus(
        state.serverURL,
      );

      emit(
        state.copyWith(
          serverVersionState: status.versionCheck.isSupported
              ? ServerVersionStateSuccess(serverVersion: status.versionstring)
              : ServerVersionStateFailure(serverVersion: status.versionstring),
          maintenanceModeState:
              status.maintenance ? const MaintenanceModeStateFailure() : const MaintenanceModeStateSuccess(),
        ),
      );
    } on FetchStatusFailure catch (error, stackTrace) {
      emit(
        state.copyWith(
          serverVersionState: const ServerVersionStateCanceled(),
          maintenanceModeState: const MaintenanceModeStateCanceled(),
        ),
      );

      addError(error.error, stackTrace);
    }
  }
}
