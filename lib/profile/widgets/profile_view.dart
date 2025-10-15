import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:chateo_eela_2025_2/app/core/widgets/widgets.dart';
import 'package:chateo_eela_2025_2/profile/cubit/profile_cubit.dart';
import 'package:chateo_eela_2025_2/profile/widgets/profile_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.sizeOf(context).height * 0.7;

    return Column(
      children: [
        ChatAvatar(
          name: user.displayName ?? '',
          photoUrl: user.photoURL,
          radius: 40,
        ),
        const SizedBox(height: 20),
        Text(
          user.displayName ?? '',
          style: textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          user.email ?? '',
          style: textTheme.bodySmall?.copyWith(color: AppColors.darkGrey),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileTile(title: 'Display Name', subtitle: user.displayName),
              ProfileTile(title: 'Email Address', subtitle: user.email),
              ProfileTile(title: 'Phone Number', subtitle: user.phoneNumber),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ProfileCubit>().logOut();
                  },
                  child: const Text('Log out'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
