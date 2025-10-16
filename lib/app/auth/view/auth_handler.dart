import 'package:chateo_eela_2025_2/app/auth/bloc/auth_bloc.dart';
import 'package:chateo_eela_2025_2/app/core/ui/app_navigator.dart';
import 'package:chateo_eela_2025_2/app/di/di.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.navigatorKey,
    required this.child,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: getIt<AuthRepository>())
            ..add(CheckUserEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthStateLoggedIn():
              // Navigator.pushNamed(context, AppNavigator.home);
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppNavigator.home,
                (route) => false,
              );
              break;
            case AuthStateLoggedOut():
              // Navigator.pushNamed(context, AppNavigator.main);
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppNavigator.onboarding,
                (route) => false,
              );
              break;
            default:
          }
        },
        child: child,
      ),
    );
  }
}
