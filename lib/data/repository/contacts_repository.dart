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

  final ContactsService _service;
  final AppDatabase _database;
  final SyncRepository _syncRepository;
  final ApiContactMapper _apiMapper;
  final ContactMapper _mapper;

  ContactsRepositoryImpl(this._service, this._database, this._syncRepository,
      this._apiMapper, this._mapper)
      : assert(_service != null),
        assert(_database != null),
        assert(_syncRepository != null),
        assert(_apiMapper != null),
        assert(_mapper != null);

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
    final syncTime = _syncRepository.getContactsSync();
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
      _service.fetchContacts('01'),
      _service.fetchContacts('02')
    ]);
    final contacts = source
        .reduce((value, element) => value + element)
        .map((ContactModel item) => _apiMapper.map(item))
        .toList();
    await _saveContacts(contacts);
    return contacts;
  }

  Future<List<Contact>> _getContactsLocal() async {
    final contacts = await _database.contactDao.getContacts();
    return contacts.map<Contact>((e) => _mapper.mapToDomain(e)).toList();
  }

  Future<void> _saveContacts(List<Contact> list) {
    _syncRepository.setContactsSync(DateTime.now().millisecondsSinceEpoch);
    final entities =
        list.map<ContactEntity>((e) => _mapper.mapToEntity(e)).toList();
    return _database.contactDao.replaceContacts(entities);
  }
}
