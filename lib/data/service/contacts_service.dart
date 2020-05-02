import 'dart:convert';

import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ContactsService {
  final Dio dio;

  ContactsService({@required this.dio}) : assert(dio != null);

  Future<List<ContactModel>> fetchContacts(String sourceNumber) async {
    final Response response = await dio.get('/generated-$sourceNumber.json');
    return compute(_parseContacts, response.data.toString());
  }
}

List<ContactModel> _parseContacts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ContactModel>((json) => ContactModel.fromJson(json))
      .toList();
}
