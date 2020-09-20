import 'package:contactApp/model/contactmodel.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contact;
  ContactList(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: contact.length,
        itemBuilder: (context, index) {
          var contactlist = contact[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text(contactlist.name.substring(0, 1).toUpperCase()),
            ),
            title: Text(contactlist.name),
            subtitle: Text(contactlist.email),
            trailing: Text(contactlist.phone),
          );
        },
      ),
    );
  }
}
