import 'package:contactApp/contactdelete.dart';
import 'package:contactApp/model/contactmodel.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contact;
  final Function deleteContact;
  ContactList(this.contact, this.deleteContact);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: contact.length,
        itemBuilder: (context, index) {
          var contactlist = contact[index];

          return Dismissible(
            key: ValueKey(contactlist.id),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.delete),
                ),
              ),
            ),
            confirmDismiss: (value) async {
              final result = await showDialog(
                  context: context, builder: (context) => ContactDelete());

              var message;
              if (result) {
                final isDeleted = deleteContact(contactlist.id);

                if (isDeleted != null) {
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text("Successfully Deleted"),
                        content: Text("Contact was Deleted"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      ));
                } else {
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text("Warning!!!"),
                        content: Text("Cannot be Deleted"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      ));
                }
              }
              print(message);
              return result;
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(contactlist.name.substring(0, 1).toUpperCase()),
              ),
              title: Text(contactlist.name),
              subtitle: Text(contactlist.email),
              trailing: Text(contactlist.phone),
            ),
          );
        },
      ),
    );
  }
}
