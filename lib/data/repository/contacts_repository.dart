import 'package:contacts_flutter/data/mapper/contact_mapper.dart';
import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:contacts_flutter/data/service/contacts_service.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:flutter/cupertino.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsService service;
  final ContactMapper mapper;

  ContactsRepositoryImpl({@required this.service, @required this.mapper})
      : assert(service != null),
        assert(mapper != null);

  @override
  Future<List<Contact>> fetchContacts() async {
    final List<List<ContactModel>> contacts = await Future.wait([
      service.fetchContacts('01'),
      service.fetchContacts('02'),
      service.fetchContacts('03')
    ]);
    return contacts
        .reduce((value, element) => value + element)
        .map((ContactModel item) => mapper.map(item))
        .toList();
  }
}
