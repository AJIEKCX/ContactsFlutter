import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ContactsState extends Equatable {
  final bool isLoading;
  final bool isRefreshing;
  final bool isSuccess;
  final bool isFailure;
  final String errorText;
  final List<Contact> contacts;

  ContactsState({
    @required this.isLoading,
    @required this.isRefreshing,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.errorText,
    @required this.contacts,
  });

  factory ContactsState.empty() {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isSuccess: false,
        isFailure: false,
        errorText: '',
        contacts: const []);
  }

  factory ContactsState.loading() {
    return ContactsState(
        isLoading: true,
        isRefreshing: false,
        isSuccess: false,
        isFailure: false,
        errorText: '',
        contacts: const []);
  }

  factory ContactsState.failure(String errorText) {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isSuccess: false,
        isFailure: true,
        errorText: errorText,
        contacts: const []);
  }

  factory ContactsState.success(List<Contact> contacts) {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isSuccess: true,
        isFailure: false,
        errorText: '',
        contacts: contacts);
  }

  ContactsState copyWith({
    bool isLoading,
    bool isRefreshing,
    bool isSuccess,
    bool isFailure,
    String errorText,
    List<Contact> contacts,
  }) {
    return ContactsState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorText: errorText ?? this.errorText,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  String toString() {
    return '''ContactsState{
      isLoading: $isLoading, 
      isRefreshing: $isRefreshing, 
      isSuccess: $isSuccess, 
      isFailure: $isFailure, 
      errorText: $errorText, 
      contactsLength: ${contacts.length}
    }''';
  }

  @override
  List<Object> get props =>
      [isLoading, isRefreshing, isSuccess, isFailure, errorText, contacts];
}
