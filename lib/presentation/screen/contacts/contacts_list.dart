import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:contacts_flutter/global/screens.dart';
import 'package:contacts_flutter/presentation/screen/contact_details/contact_details_arguments.dart';
import 'package:flutter/material.dart';

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
