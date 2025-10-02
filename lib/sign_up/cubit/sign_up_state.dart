part of 'sign_up_cubit.dart';

class SignUpState {
  SignUpState({this.name, this.email, this.password, this.confirmPassword});

  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;

  // methodo copyWith para crear copias del estado
  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
