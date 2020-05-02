import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ContactsState extends Equatable {
  final bool isLoading;
  final bool isRefreshing;
  final bool isFailure;
  final bool isSuccess;
  final List<Contact> contacts;

  ContactsState({
    @required this.isLoading,
    @required this.isRefreshing,
    @required this.isFailure,
    @required this.isSuccess,
    @required this.contacts,
  });

  factory ContactsState.empty() {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isFailure: false,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.loading() {
    return ContactsState(
        isLoading: true,
        isRefreshing: false,
        isFailure: false,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.failure() {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isFailure: true,
        isSuccess: false,
        contacts: const []);
  }

  factory ContactsState.success(List<Contact> contacts) {
    return ContactsState(
        isLoading: false,
        isRefreshing: false,
        isFailure: false,
        isSuccess: true,
        contacts: contacts);
  }

  ContactsState copyWith({
    bool isLoading,
    bool isRefreshing,
    bool isFailure,
    bool isSuccess,
    List<Contact> contacts,
  }) {
    return ContactsState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  String toString() {
    return '''ContactsState{
      isLoading: $isLoading, 
      isRefreshing: $isRefreshing, 
      isFailure: $isFailure, 
      isSuccess: $isSuccess, 
      contactsLength: ${contacts.length}
    }''';
  }

  @override
  List<Object> get props =>
      [isLoading, isRefreshing, isFailure, isSuccess, contacts];
}
