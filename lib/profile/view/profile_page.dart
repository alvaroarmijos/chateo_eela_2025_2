import 'package:chateo_eela_2025_2/app/di/di.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chateo_eela_2025_2/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        authRepository: getIt<AuthRepository>(),
        contactsRepository: getIt<ContactsRepository>(),
      ),
      child: const ProfilePageView(),
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return switch (state) {
            ProfileStateLoading() => const SizedBox(),
            ProfileStateLoggedIn(user: final user) => ProfileView(user: user),
          };
        },
      ),
    );
  }
}
