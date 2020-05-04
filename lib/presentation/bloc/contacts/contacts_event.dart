import 'package:equatable/equatable.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class FetchContacts extends ContactsEvent {}

class RefreshContacts extends ContactsEvent {}

class SearchContacts extends ContactsEvent {
  final String query;

  SearchContacts(this.query);

  @override
  List<Object> get props => [query];
}