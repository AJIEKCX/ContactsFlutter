import 'dart:developer';

import 'package:contacts_flutter/data/db/database.dart';
import 'package:contacts_flutter/data/mapper/api_contact_mapper.dart';
import 'package:contacts_flutter/data/mapper/contact_mapper.dart';
import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/data/service/contacts_service.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:contacts_flutter/domain/repository/sync_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  static const _cachePeriod = Duration(minutes: 1);

  final ContactsService service;
  final AppDatabase database;
  final SyncRepository syncRepository;
  final ApiContactMapper apiMapper;
  final ContactMapper mapper;

  ContactsRepositoryImpl(this.service, this.database, this.syncRepository,
      this.apiMapper, this.mapper)
      : assert(service != null),
        assert(database != null),
        assert(syncRepository != null),
        assert(apiMapper != null),
        assert(mapper != null);

  @override
  Future<List<Contact>> fetchContacts(DataFetchStrategy strategy) async {
    if (strategy == DataFetchStrategy.cache) {
      return _getContactsCache();
    } else if (strategy == DataFetchStrategy.remote) {
      return _getContactsRemote();
    } else if (strategy == DataFetchStrategy.local) {
      return _getContactsLocal();
    }
    throw ArgumentError('Unexpected DataFetchStrategy type');
  }

  Future<List<Contact>> _getContactsCache() async {
    final syncTime = syncRepository.getContactsSync();
    if (syncTime == 0) {
      return _getContactsRemote();
    }
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((currentTime - syncTime).abs() > _cachePeriod.inMilliseconds) {
      try {
        final contacts = await _getContactsRemote();
        return contacts;
      } on Exception catch (e) {
        log(e.toString());
        return _getContactsLocal();
      }
    }
    return _getContactsLocal();
  }

  Future<List<Contact>> _getContactsRemote() async {
    final List<List<ContactModel>> source = await Future.wait([
      service.fetchContacts('01'),
      service.fetchContacts('02')
    ]);
    final contacts = source
        .reduce((value, element) => value + element)
        .map((ContactModel item) => apiMapper.map(item))
        .toList();
    await _saveContacts(contacts);
    return contacts;
  }

  Future<List<Contact>> _getContactsLocal() async {
    final contacts = await database.contactDao.getContacts();
    return contacts.map<Contact>((e) => mapper.mapToDomain(e)).toList();
  }

  Future<void> _saveContacts(List<Contact> list) {
    syncRepository.setContactsSync(DateTime.now().millisecondsSinceEpoch);
    final entities =
        list.map<ContactEntity>((e) => mapper.mapToEntity(e)).toList();
    return database.contactDao.insertContacts(entities);
  }
}
