import 'package:chateo_eela_2025_2/data/repositories/messages_repository/messages_repository.dart';
import 'package:chateo_eela_2025_2/domain/models/message.dart';
import 'package:firebase_database/firebase_database.dart';

class MessagesRepositoryFirebaseImpl extends MessagesRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
  ) {
    return _firebaseDatabase.ref('chats').child(chatId).push().set({
      'message': message,
      'messageDate': date,
      'sentBy': sentBy,
    });
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return _firebaseDatabase.ref('chats').child(chatId).onValue.map((event) {
      final value = event.snapshot.value as Map?;
      return value?.values.map((element) {
            return Message(
              message: element['message'],
              messageDate: DateTime.parse(element["messageDate"]),
              sentBy: element['sentBy'],
            );
          }).toList() ??
          [];
    });
  }
}
