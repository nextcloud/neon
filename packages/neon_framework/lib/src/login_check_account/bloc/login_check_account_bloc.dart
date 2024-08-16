import 'package:account_repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_check_account_event.dart';
part 'login_check_account_state.dart';

@internal
class LoginCheckAccountBloc extends Bloc<LoginCheckAccountEvent, LoginCheckAccountState> {
  LoginCheckAccountBloc({
    required AccountRepository accountRepository,
    required Credentials credentials,
  })  : _accountRepository = accountRepository,
        super(LoginCheckAccountStateLoading(credentials: credentials)) {
    on<LoginCheckAccount>(
      _onLoginCheckAccount,
      transformer: droppable(),
    );
  }

  final AccountRepository _accountRepository;

  Future<void> _onLoginCheckAccount(LoginCheckAccount event, Emitter<LoginCheckAccountState> emit) async {
    emit(
      LoginCheckAccountStateLoading(
        credentials: state.credentials,
      ),
    );

    try {
      final account = await _accountRepository.getAccount(state.credentials);

      emit(
        LoginCheckAccountStateSuccess(
          credentials: state.credentials,
          account: account,
        ),
      );
    } on FetchAccountFailure catch (error, stackTrace) {
      emit(
        LoginCheckAccountStateFailure(
          credentials: state.credentials,
        ),
      );

      addError(error.error, stackTrace);
    }
  }
}
