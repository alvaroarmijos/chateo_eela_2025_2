import 'package:chateo_eela_2025_2/app/auth/bloc/auth_bloc.dart';
import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:chateo_eela_2025_2/app/core/widgets/chat_avatar.dart';
import 'package:chateo_eela_2025_2/app/di/di.dart';
import 'package:chateo_eela_2025_2/app/notifications/notifications_service.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chateo_eela_2025_2/home/bloc/home_bloc.dart';
import 'package:chateo_eela_2025_2/home/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        contactsRepository: getIt<ContactsRepository>(),
        authRepository: getIt<AuthRepository>(),
      )..add(GetContactsEvent()),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(UpdateUserStatusEvent(status: true));

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      // Aqui realizar la navegacion a la pantalla de detalle del chat
      // Navigator.pushNamed(context, routeName)
    });

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      getIt<NotificationsService>().showNotification(remoteMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authState = context.read<AuthBloc>().state;
    final user = switch (authState) {
      AuthStateLoggedIn() => authState.user,
      _ => null,
    };

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
                Text(
                  'Home',
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppNavigator.profile),
                  child: ChatAvatar(
                    name: user?.displayName ?? '',
                    photoUrl: user?.photoURL,
                  ),
                ),
              ],
            ),
          ),
          const Chats(),
        ],
      ),
    );
  }
}
