part of 'login_qr_code_bloc.dart';

/// State of the [LoginQrCodeBloc].
class LoginQrCodeState extends Equatable {
  /// Creates a new state for managing the QR-Code login.
  const LoginQrCodeState({
    this.credentials,
    this.invalid = false,
  });

  /// The credentials decoded from the QR code.
  final Credentials? credentials;

  /// Whether the scanned QR-Code is not valid.
  final bool invalid;

  /// Creates a copy of this with changed attributes.
  LoginQrCodeState copyWith({
    Credentials? credentials,
    bool? invalid,
  }) {
    return LoginQrCodeState(
      credentials: credentials ?? this.credentials,
      invalid: invalid ?? this.invalid,
    );
  }

  @override
  List<Object?> get props => [
        credentials,
        invalid,
      ];
}
