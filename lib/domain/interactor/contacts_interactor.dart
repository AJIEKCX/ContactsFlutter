import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:contacts_flutter/global/extension/string.dart';

class ContactsInteractor {
  final RegExp _onlyNumbersRegex = RegExp(r'[^\d]');
  final ContactsRepository _repository;

  ContactsInteractor(this._repository) : assert(_repository != null);

  Future<List<Contact>> fetchContacts(DataFetchStrategy strategy) async {
    return _repository.fetchContacts(strategy);
  }

  Future<List<Contact>> searchContacts(String query) async {
    final contacts = await _repository.fetchContacts(DataFetchStrategy.local);
    return contacts.where((e) => _searchPredicate(e, query)).toList();
  }

  bool _searchPredicate(Contact contact, String query) {
    if (contact.name.startsWithIgnoreCase(query)) {
      return true;
    }
    final cleanQuery = _cleanPhoneNumber(query);
    if (cleanQuery.isEmpty) {
      return contact.phone.startsWith(query);
    } else {
      final cleanPhoneNumber = _cleanPhoneNumber(contact.phone);
      return cleanPhoneNumber.contains(cleanQuery);
    }
  }

  String _cleanPhoneNumber(String value) {
    return value.replaceAll(_onlyNumbersRegex, '');
  }
}
