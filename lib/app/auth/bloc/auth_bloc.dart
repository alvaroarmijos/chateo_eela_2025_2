import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository_firebase_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateLoading()) {
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  final authRepository = AuthRepositoryFirebaseImpl();

  FutureOr<void> _onCheckUserEvent(
    CheckUserEvent event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      authRepository.currentUser,
      onData: (user) {
        if (user == null) {
          return AuthStateLoggedOut();
        }
        return AuthStateLoggedIn();
      },
    );
  }
}
