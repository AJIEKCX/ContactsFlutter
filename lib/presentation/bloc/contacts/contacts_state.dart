import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:flutter/foundation.dart';

@immutable
class ContactsState {
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final List<Contact> contacts;

  ContactsState({
    @required this.isLoading,
    @required this.isFailure,
    @required this.isSuccess,
    @required this.contacts,
  });

  factory ContactsState.empty() {
    return ContactsState(
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.loading() {
    return ContactsState(
        isLoading: true,
        isFailure: false,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.failure() {
    return ContactsState(
        isLoading: false,
        isFailure: true,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.success(List<Contact> contacts) {
    return ContactsState(
        isLoading: false,
        isFailure: false,
        isSuccess: true,
        contacts: contacts);
  }

  ContactsState copyWith({
    bool isLoading,
    bool isFailure,
    bool isSuccess,
    List<Contact> contacts,
  }) {
    return ContactsState(
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  String toString() {
    return '''ContactsState{
      isLoading: $isLoading, 
      isFailure: $isFailure, 
      isSuccess: $isSuccess, 
      contactsLength: ${contacts.length}
    }''';
  }
}
