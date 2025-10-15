import 'package:chateo_eela_2025_2/chat/bloc/chat_bloc.dart';
import 'package:chateo_eela_2025_2/chat/widgets/widgets.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messages extends StatelessWidget {
  const Messages({super.key, required this.contact});

  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final messages = state.messages;

        if (messages.isEmpty) {
          return Center(child: Text('No tienes mensajes todavía'));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageTile(
              mySelf: message.sentBy != contact.id,
              userName: contact.name,
              msg: message.message,
              date: message.messageDate,
              photoUrl: contact.photoUrl,
            );
          },
        );
      },
    );
  }
}
