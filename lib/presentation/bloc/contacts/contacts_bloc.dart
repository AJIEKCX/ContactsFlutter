import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contacts_flutter/data/repository/data_fetch_strategy.dart';
import 'package:contacts_flutter/domain/interactor/contacts_interactor.dart';
import 'package:flutter/foundation.dart';

import 'bloc.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc({@required this.interactor}) : assert(interactor != null);

  final ContactsInteractor interactor;

  @override
  ContactsState get initialState => ContactsState.empty();

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is FetchContacts) {
      yield* _mapFetchContactsToState();
    }
    if (event is RefreshContacts) {
      yield* _mapRefreshContactsToState();
    }
  }

  Stream<ContactsState> _mapFetchContactsToState() async* {
    yield ContactsState.loading();
    try {
      final contacts = await interactor.fetchContacts(DataFetchStrategy.cache);
      yield ContactsState.success(contacts);
    } on Exception catch (e) {
      log(e.toString());
      yield ContactsState.failure();
    }
  }

  Stream<ContactsState> _mapRefreshContactsToState() async* {
    yield state.copyWith(isRefreshing: true);
    try {
      final contacts = await interactor.fetchContacts(DataFetchStrategy.remote);
      yield ContactsState.success(contacts);
    } on Exception catch (e) {
      log(e.toString());
      yield state.copyWith(isFailure: true, isRefreshing: false);
    }
  }
}
