import 'package:chateo_eela_2025_2/domain/models/message.dart';

abstract class MessagesRepository {
  // funcion para enviar mensajes y guardar en la base de datos
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
    String sentTo,
  );

  // Obtener la lista de mensajes del chat
  Stream<List<Message>> getMessages(String chatId);
}
