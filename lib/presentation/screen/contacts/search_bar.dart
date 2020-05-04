import 'package:contacts_flutter/presentation/bloc/contacts/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
