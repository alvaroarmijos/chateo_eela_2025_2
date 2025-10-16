import 'package:bloc/bloc.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit({required this.authRepository}) : super(());

  final AuthRepository authRepository;

  void signInWithGoogle() async {
    try {
      await authRepository.sigInWithGoogle();
    } on GoogleSignInException catch (error) {
      print(error.details);
      print(error.description);
    } catch (e) {
      print(e);
    }
  }
}
