import 'package:contacts_flutter/data/db/database.dart';
import 'package:contacts_flutter/data/mapper/api_contact_mapper.dart';
import 'package:contacts_flutter/data/mapper/contact_mapper.dart';
import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:contacts_flutter/data/service/contacts_service.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsService service;
  final AppDatabase database;
  final ApiContactMapper apiMapper;
  final ContactMapper mapper;

  ContactsRepositoryImpl(
      this.service, this.database, this.apiMapper, this.mapper)
      : assert(service != null),
        assert(database != null),
        assert(apiMapper != null),
        assert(mapper != null);

  @override
  Future<List<Contact>> fetchContacts() async {
    final contactsLocal = await _getContactsLocal();
    if (contactsLocal.isEmpty) {
      final contacts = await _getContactsRemote();
      await _saveContacts(contacts);
      return contacts;
    } else {
      return contactsLocal;
    }
  }

  Future<List<Contact>> _getContactsRemote() async {
    final List<List<ContactModel>> contacts = await Future.wait([
      service.fetchContacts('01'),
      service.fetchContacts('02'),
      service.fetchContacts('03')
    ]);
    return contacts
        .reduce((value, element) => value + element)
        .map((ContactModel item) => apiMapper.map(item))
        .toList();
  }

  Future<List<Contact>> _getContactsLocal() async {
    final contacts = await database.contactDao.getContacts();
    return contacts.map<Contact>((e) => mapper.mapToDomain(e)).toList();
  }

  Future<void> _saveContacts(List<Contact> list) {
    final entities =
        list.map<ContactEntity>((e) => mapper.mapToEntity(e)).toList();
    return database.contactDao.insertContacts(entities);
  }
}
