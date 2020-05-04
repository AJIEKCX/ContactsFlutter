import 'package:contacts_flutter/generated/l10n.dart';
import 'package:contacts_flutter/presentation/bloc/contacts/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  ContactsBloc _contactsBloc;
  bool _isRemoveVisible = false;

  @override
  void initState() {
    super.initState();
    _contactsBloc = BlocProvider.of<ContactsBloc>(context);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      color: Colors.white,
      child: TextField(
        style: theme.textTheme.bodyText1,
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: theme.accentColor,
        decoration: InputDecoration(
          hintText: S.of(context).search_title,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Visibility(
            visible: _isRemoveVisible,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.grey),
              onPressed: () {
                _controller.clear();
              },
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _onTextChanged() {
    _contactsBloc.add(SearchContacts(_controller.text));
    setState(() {
      _isRemoveVisible = _controller.text.isNotEmpty;
    });
  }
}
