import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:chateo_eela_2025_2/app/core/widgets/widgets.dart';
import 'package:chateo_eela_2025_2/app/di/di.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:chateo_eela_2025_2/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OnboardingCubit(authRepository: getIt<AuthRepository>()),
      child: OnboardingPageView(),
    );
  }
}

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppDrawables.background,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppDrawables.appIcon),
                  Text(
                    'Connect friends easily & quickly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 68,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Our chat app is the perfect way to stay connected with friends and family.',
                    style: TextStyle(color: Color(0xffB9C1BE), fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      // SocialMediaButton.facebook(),
                      // SocialMediaButton.google(),
                      // SocialMediaButton.apple(),
                      SocialMediaButton(
                        socialMediaType: SocialMediaType.facebook,
                      ),
                      SocialMediaButton(
                        socialMediaType: SocialMediaType.google,
                        onTap: () {
                          context.read<OnboardingCubit>().signInWithGoogle();
                        },
                      ),
                      SocialMediaButton(socialMediaType: SocialMediaType.apple),
                    ],
                  ),
                  OnboardingDivider(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignUpPage()),
                        // );
                        Navigator.pushNamed(context, AppNavigator.signUp);
                      },
                      child: Text('Sign up withn mail'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginPage()),
                      // );
                      Navigator.pushNamed(context, AppNavigator.login);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
