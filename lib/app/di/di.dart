import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/data/repositories/messages_repository/messages_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/messages_repository/messages_repository_firebase_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryFirebaseImpl());
  getIt.registerSingleton<ContactsRepository>(ContactsRepositoryFirebaseImpl());
  getIt.registerSingleton<MessagesRepository>(MessagesRepositoryFirebaseImpl());
}
