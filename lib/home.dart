import 'package:contactApp/contactform.dart';
import 'package:contactApp/contactlist.dart';
import 'package:contactApp/model/contactmodel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Contact> _contact = [
    Contact(
        id: "1",
        name: "SMH",
        email: "smh@gmail.com",
        phone: "09673338880",
        dob: DateTime(1990, 02, 10)),
    Contact(
        id: "2",
        name: "James",
        email: "james@gmail.com",
        phone: "2137912391",
        dob: DateTime(1990, 02, 10)),
    Contact(
        id: "3",
        name: "Micheal",
        email: "micheal@gmail.com",
        phone: "09673338880",
        dob: DateTime(1990, 02, 10)),
    Contact(
        id: "4",
        name: "Rose",
        email: "rose@gmail.com",
        phone: "09673338880",
        dob: DateTime(1990, 02, 10)),
    Contact(
        id: "5",
        name: "Pancy",
        email: "pancy@gmail.com",
        phone: "09673338880",
        dob: DateTime(1990, 02, 10)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ContactList(_contact, deleteContact),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactForm(addContact),
          ));
        },
        label: Row(
          children: <Widget>[
            Icon(Icons.add),
            Text("Add New"),
          ],
        ),
      ),
    );
  }

  void addContact(String name, String email, String phone, DateTime dob) {
    final newContact = Contact(
        id: DateTime.now().toIso8601String(),
        name: name,
        email: email,
        phone: phone,
        dob: dob);
    _contact.add(newContact);
  }

  String deleteContact(String id) {
    setState(() {
      _contact.removeWhere((contact) => contact.id == id);
    });

    return "Deleted";
  }
}
