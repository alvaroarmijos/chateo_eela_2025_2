import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ContactsRepository {
  // Obtener la lista de contactos
  Stream<List<Contact>> getContacts();

  // Actualizar la info del usuario en los contactos
  Future<void> updateUserStatus(User user, bool status);
}
