import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryFirebaseImpl extends AuthRepository {
  @override
  Future<void> signUp(String name, String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
