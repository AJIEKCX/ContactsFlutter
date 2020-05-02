import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:flutter/cupertino.dart';

class ContactsInteractor {
  final ContactsRepository repository;

  ContactsInteractor({@required this.repository}) : assert(repository != null);

  Future<List<Contact>> fetchContacts(DataFetchStrategy strategy) async {
    return repository.fetchContacts(strategy);
  }
}
