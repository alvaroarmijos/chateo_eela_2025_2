import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);

  // metodo para el login
  Future<void> logIn(String email, String password);

  // metodo para login con Google
  Future<void> sigInWithGoogle();

  // metodo para login con Facebook
  /// ....
  ///

  // Stream para obtener el usuario logueado actualmente
  Stream<User?> get currentUser;
}
