import 'package:contacts_flutter/domain/entity/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
}