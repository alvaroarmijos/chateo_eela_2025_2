import 'package:chateo_eela_2025_2/app/core/ui/app_navigator.dart';
import 'package:chateo_eela_2025_2/app/core/ui/theme.dart';
import 'package:chateo_eela_2025_2/firebase_options.dart';
import 'package:chateo_eela_2025_2/login/view/login_page.dart';
import 'package:chateo_eela_2025_2/onboarding/onboarding_page.dart';
import 'package:chateo_eela_2025_2/sign_up/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      routes: {
        AppNavigator.main: (context) => OnboardingPage(),
        AppNavigator.login: (context) => LoginPage(),
        AppNavigator.signUp: (context) => SignUpPage(),
      },
    );
  }
}
