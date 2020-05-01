import 'dart:async';

import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/generated/l10n.dart';
import 'package:contacts_flutter/global/screens.dart';
import 'package:contacts_flutter/presentation/bloc/contacts/bloc.dart';
import 'package:contacts_flutter/presentation/widget/empty_stub.dart';
import 'package:contacts_flutter/presentation/widget/error_stub.dart';
import 'package:contacts_flutter/presentation/widget/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ContactsBloc _contactsBloc;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    _contactsBloc = BlocProvider.of<ContactsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(S.of(context).contacts_title),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () {
          _contactsBloc.add(RefreshContacts());
          _refreshCompleter = Completer();
          return _refreshCompleter.future;
        },
        child: BlocListener<ContactsBloc, ContactsState>(
          listener: (context, state) {
            if (state.isSuccess || state.isFailure) {
              _refreshCompleter?.complete();
            }
            if (state.isFailure) {
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text(S.of(context).error_loading_data_title)),
              );
            }
          },
          child: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return LoadingIndicator();
              }
              if (state.isSuccess) {
                return Stack(children: [
                  EmptyStub(
                    text: S.of(context).empty_contacts,
                    isVisible: state.contacts.isEmpty,
                  ),
                  ContactsList(contacts: state.contacts),
                ]);
              }
              if (state.isFailure) {
                return ErrorStub(
                  errorText: S.of(context).error_loading_data_title,
                  onPressed: () {
                    _refreshIndicatorKey.currentState.show();
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class ContactsList extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsList({Key key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const Divider(height: 1, thickness: 1),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contacts[index].name),
          subtitle: Text(contacts[index].phone),
          onTap: () {
            Navigator.pushNamed(context, Screens.Details);
          },
        );
      },
    );
  }
}
