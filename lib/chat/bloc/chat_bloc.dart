import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo_eela_2025_2/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/data/repositories/messages_repository/messages_repository_firebase_impl.dart';
import 'package:chateo_eela_2025_2/domain/models/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetMessagesEvent>(_onGetMessagesEvent);
  }

  final _messagesRepository = MessagesRepositoryFirebaseImpl();
  final _authRepository = AuthRepositoryFirebaseImpl();

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    final user = await _authRepository.user;
    final date = DateTime.now().toIso8601String();
    if (user == null) return;

    _messagesRepository.sendMessage(
      _getChatId(user.uid, event.contactId),
      event.message,
      date,
      user.uid,
    );
  }

  String _getChatId(String currentUserId, String contactId) {
    final chatIds = [currentUserId, contactId]..sort();
    return '${chatIds[0]}_${chatIds[1]}';
  }

  FutureOr<void> _onGetMessagesEvent(
    GetMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    final user = await _authRepository.user;
    if (user == null) return;
    return emit.forEach(
      _messagesRepository.getMessages(_getChatId(user.uid, event.contactId)),
      onData: (messages) {
        return state.copyWith(messages: messages);
      },
    );
  }
}
