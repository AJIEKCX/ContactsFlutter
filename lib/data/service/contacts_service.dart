import 'dart:convert';

import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ContactsService {
  final Dio _dio;

  ContactsService(this._dio) : assert(_dio != null);

  Future<List<ContactModel>> fetchContacts(String sourceNumber) async {
    final Response<String> response =
        await _dio.get<String>('/generated-$sourceNumber.json');
    return compute(_parseContacts, response.data);
  }
}

List<ContactModel> _parseContacts(String responseBody) {
  final parsed = json.decode(responseBody) as List;
  return List<Map<String, dynamic>>.from(parsed)
      .map((json) => ContactModel.fromJson(json))
      .toList();
}
