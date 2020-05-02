import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts(DataFetchStrategy strategy);
}