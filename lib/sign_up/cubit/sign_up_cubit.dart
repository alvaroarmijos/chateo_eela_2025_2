import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final authRepository = AuthRepositoryFirebaseImpl();

  void onNameChanged(String? name) {
    emit(state.copyWith(name: name));
  }

  void onEmailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void createAccount() {
    final (name, email, password) = (state.name, state.email, state.password);
    if (name == null || email == null || password == null) return;
    authRepository.signUp(name, email, password);
  }
}
