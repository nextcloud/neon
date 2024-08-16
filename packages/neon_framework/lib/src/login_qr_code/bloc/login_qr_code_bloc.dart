import 'package:account_repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_qr_code_event.dart';
part 'login_qr_code_state.dart';

@internal
class LoginQrCodeBloc extends Bloc<LoginQrCodeEvent, LoginQrCodeState> {
  LoginQrCodeBloc() : super(const LoginQrCodeState()) {
    on<LoginQrCodeScanned>(_onLoginQrCodeScanned);
  }

  Future<void> _onLoginQrCodeScanned(LoginQrCodeScanned event, Emitter<LoginQrCodeState> emit) async {
    emit(
      state.copyWith(
        invalid: false,
      ),
    );

    final url = event.code;
    if (url == null) {
      return;
    }

    final credentials = LoginQRcode.tryParse(url)?.credentials;
    if (credentials == null) {
      emit(
        state.copyWith(
          invalid: true,
        ),
      );
    }

    emit(
      state.copyWith(
        credentials: credentials,
      ),
    );
  }
}
