import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:contacts_flutter/global/extension/string.dart';
import 'package:flutter/cupertino.dart';

class ContactsInteractor {
  final RegExp _onlyNumbersRegex = RegExp(r'[^\d]');
  final ContactsRepository repository;

  ContactsInteractor({@required this.repository}) : assert(repository != null);

  Future<List<Contact>> fetchContacts(DataFetchStrategy strategy) async {
    return repository.fetchContacts(strategy);
  }

  Future<List<Contact>> searchContacts(String query) async {
    final contacts = await repository.fetchContacts(DataFetchStrategy.local);
    return contacts.where((e) => _searchPredicate(e, query)).toList();
  }

  bool _searchPredicate(Contact contact, String query) {
    final bool firstPredicate = contact.name.startsWithIgnoreCase(query);
    if (firstPredicate) {
      return true;
    }
    final cleanPhoneNumber = _cleanPhoneNumber(contact.phone);
    final cleanQuery = _cleanPhoneNumber(query);

    return cleanQuery.isNotEmpty && cleanPhoneNumber.startsWith(cleanQuery);
  }

  String _cleanPhoneNumber(String value) {
    return value.replaceAll(_onlyNumbersRegex, '');
  }
}
