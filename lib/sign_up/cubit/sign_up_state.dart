part of 'sign_up_cubit.dart';

enum Status {
  initial,
  loading,
  passwordTooWeek,
  emailAlreadyRegistered,
  failed,
  success,
}

class SignUpState {
  SignUpState({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.status = Status.initial,
    this.message,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final Status status;
  final String? message;

  bool get showErrorMessage =>
      status == Status.emailAlreadyRegistered ||
      status == Status.passwordTooWeek ||
      status == Status.failed;

  // methodo copyWith para crear copias del estado
  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    Status? status,
    String? message,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
