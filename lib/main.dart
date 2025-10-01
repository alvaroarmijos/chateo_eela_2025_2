import 'package:chateo_eela_2025_2/app/core/ui/app_navigator.dart';
import 'package:chateo_eela_2025_2/app/core/ui/theme.dart';
import 'package:chateo_eela_2025_2/login/view/login_page.dart';
import 'package:chateo_eela_2025_2/onboarding/onboarding_page.dart';
import 'package:chateo_eela_2025_2/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
