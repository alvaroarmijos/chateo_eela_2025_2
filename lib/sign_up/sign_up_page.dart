import 'package:chateo_eela_2025_2/app/utils/validators.dart';
import 'package:chateo_eela_2025_2/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpPageView(),
    );
  }
}

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _globalKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final signUpCubit = context.read<SignUpCubit>();
    final formKey = GlobalKey<FormState>();

    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.showErrorMessage) {
          Fluttertoast.showToast(
            msg: state.message ?? '',
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      child: Scaffold(
        key: _globalKey,
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Sign up with ',
                  style: textTheme.labelLarge,
                  children: [
                    TextSpan(
                      text: 'Email',
                      style: textTheme.labelLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 10,
                        decorationColor: theme.colorScheme.primary.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get chatting with friends and family today by signing up for our chat app!',
                style: TextStyle(color: Color(0xFF797C7B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                onChanged: signUpCubit.onNameChanged,
                decoration: const InputDecoration(label: Text('Your name')),
                validator: Validators.validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  signUpCubit.onEmailChanged(value);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(label: Text('Your email')),
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) => signUpCubit.onPasswordChanged(value),
                obscureText: true,
                decoration: const InputDecoration(label: Text('Password')),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return TextFormField(
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      signUpCubit.onConfirmPasswordChanged(value);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Confirm Password'),
                    ),
                    validator: (value) {
                      if (value == state.password) {
                        return null;
                      }

                      return 'Password no coincide';
                    },
                  );
                },
              ),
              const SizedBox(height: 92),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            // if (state.status == Status.loading) {
            //   return SizedBox(
            //     height: 50,
            //     child: Center(child: CircularProgressIndicator()),
            //   );
            // }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: 32 + keyboardHeight),
              child: ElevatedButton(
                onPressed: state.status == Status.loading
                    ? null
                    : () {
                        final isValid =
                            formKey.currentState?.validate() ?? false;

                        if (!isValid) return;
                        signUpCubit.createAccount();
                      },
                child: const Text('Create an account'),
              ),
            );
          },
        ),
      ),
    );
  }
}
