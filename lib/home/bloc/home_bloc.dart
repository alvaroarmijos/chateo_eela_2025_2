import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
  }

  final _contactsRepository = ContactsRepositoryFirebaseImpl();
  final _authRepository = AuthRepositoryFirebaseImpl();

  FutureOr<void> _onGetContactsEvent(
    GetContactsEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      _contactsRepository.getContacts(),
      onData: (contacts) {
        return state.copyWith(contacts: contacts);
      },
    );
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authRepository.user;
    if (user == null) return;
    _contactsRepository.updateUserStatus(user, event.status);
  }
}
