import 'dart:async';

import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/generated/l10n.dart';
import 'package:contacts_flutter/global/screens.dart';
import 'package:contacts_flutter/presentation/bloc/contacts/bloc.dart';
import 'package:contacts_flutter/presentation/screen/contact_details/contact_details_arguments.dart';
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
        titleSpacing: 0,
        title: SearchBar(),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () {
          _contactsBloc.add(RefreshContacts());
          _refreshCompleter = Completer();
          return _refreshCompleter.future;
        },
        child: BlocConsumer<ContactsBloc, ContactsState>(
          listenWhen: (prev, next) {
            return !next.isRefreshing && !next.isLoading;
          },
          listener: (context, state) {
            if (state.isSuccess || state.isFailure) {
              if (_refreshCompleter?.isCompleted == false) {
                _refreshCompleter?.complete();
              }
            }
            if (state.isFailure) {
              _scaffoldKey.currentState.hideCurrentSnackBar();
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text(S.of(context).error_loading_data_title)),
              );
            }
          },
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
                isEnabled: !state.isRefreshing,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  ContactsBloc _contactsBloc;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contactsBloc = BlocProvider.of<ContactsBloc>(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      color: Colors.white,
      child: TextField(
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              _controller.clear();
              _contactsBloc.add(SearchContacts(''));
            },
          ),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          _contactsBloc.add(SearchContacts(value));
        },
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
        final contact = contacts[index];
        return ContactTile(
          name: contact.name,
          phone: contact.phone,
          height: contact.height,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Screens.Details,
              arguments: ContactDetailsArguments(contact),
            );
          },
        );
      },
    );
  }
}

class ContactTile extends StatelessWidget {
  final String name;
  final String phone;
  final double height;
  final VoidCallback onPressed;

  const ContactTile({
    @required this.name,
    @required this.phone,
    @required this.height,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(name, style: const TextStyle(fontSize: 16)),
                ),
                Text(height.toString(), style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 4),
            Text(phone, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
