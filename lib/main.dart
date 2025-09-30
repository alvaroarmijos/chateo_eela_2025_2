import 'package:chateo_eela_2025_2/onboarding/onboarding_page.dart';
import 'package:chateo_eela_2025_2/ui/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      home: OnboardingPage(),
    );
  }
}
