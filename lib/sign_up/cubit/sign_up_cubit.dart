import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepository}) : super(SignUpState());

  final AuthRepository authRepository;

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

  void createAccount() async {
    final (name, email, password) = (state.name, state.email, state.password);
    if (name == null || email == null || password == null) return;
    try {
      emit(state.copyWith(status: Status.loading));
      await authRepository.signUp(name, email, password);
      emit(state.copyWith(status: Status.success));
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          emit(
            state.copyWith(
              status: Status.emailAlreadyRegistered,
              message: error.message,
            ),
          );
          break;
        case 'weak-password':
          emit(
            state.copyWith(
              status: Status.passwordTooWeek,
              message: error.message,
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              status: Status.failed,
              message: 'Firebase exception. Try again',
            ),
          );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.failed,
          message: 'Network exception. Try again',
        ),
      );
    } finally {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
