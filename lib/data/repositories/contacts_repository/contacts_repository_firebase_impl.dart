import 'package:chateo_eela_2025_2/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactsRepositoryFirebaseImpl extends ContactsRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Stream<List<Contact>> getContacts() {
    return _firebaseDatabase.ref('status').onValue.map((event) {
      final value = event.snapshot.value as Map?;
      return value?.values.map((element) {
            return Contact(
              name: element['name'],
              status: element['status'],
              photoUrl: element['photoUrl'],
              id: element['id'],
            );
          }).toList() ??
          [];
    });
  }

  @override
  Future<void> updateUserStatus(User user, bool status) {
    return _firebaseDatabase.ref('status').child(user.uid).update({
      'name': user.displayName,
      'status': status,
      'photoUrl': user.photoURL,
      'userId': user.uid,
    });
  }
}
