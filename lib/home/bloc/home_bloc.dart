import 'dart:async';

import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository.dart';
import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.contactsRepository, required this.authRepository})
    : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
  }

  final ContactsRepository contactsRepository;
  final AuthRepository authRepository;

  FutureOr<void> _onGetContactsEvent(
    GetContactsEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      contactsRepository.getContacts(),
      onData: (contacts) {
        return state.copyWith(contacts: contacts);
      },
    );
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await authRepository.user;
    if (user == null) return;
    contactsRepository.updateUserStatus(user, event.status);
  }
}
