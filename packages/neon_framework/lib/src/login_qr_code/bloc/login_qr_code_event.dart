part of 'login_qr_code_bloc.dart';

/// Base event for the [LoginQrCodeBloc].
sealed class LoginQrCodeEvent extends Equatable {
  const LoginQrCodeEvent();

  @override
  List<Object?> get props => [];
}

/// {@template login_qr_code_scanned}
/// Event when a QR-Code has been detected and scanned.
/// {@endtemplate}
final class LoginQrCodeScanned extends LoginQrCodeEvent {
  /// {@macro login_qr_code_scanned}
  const LoginQrCodeScanned(this.code);

  /// The scanned qr code.
  final String? code;

  @override
  List<Object?> get props => [
        code,
      ];
}
