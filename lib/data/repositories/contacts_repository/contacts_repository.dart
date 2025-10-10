import 'package:chateo_eela_2025_2/domain/models/contact.dart';

abstract class ContactsRepository {
  // Obtener la lista de contactos
  Stream<List<Contact>> getContacts();
}
