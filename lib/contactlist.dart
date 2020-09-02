import 'package:contactApp/model/contactmodel.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contactlist;
  ContactList(this.contactlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: contactlist.length,
        itemBuilder: (context, index) {
          var contact = contactlist[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text(contact.name.substring(0, 1).toUpperCase()),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.email),
          );
        },
      ),
    );
  }
}
