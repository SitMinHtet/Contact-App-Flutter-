import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add New Contact"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
            child: ListView(
          children: <Widget>[
            namefield(),
            emailfield(),
            phonefield(),
            dobfield(),
            savebutton()
          ],
        )),
      ),
    );
  }

  Widget namefield() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Enter Name",
          prefixIcon: Icon(Icons.people),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }

  Widget emailfield() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Enter Email",
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }

  Widget phonefield() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Enter Name",
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }

  void openDatePacker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime(1990),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((value) => print(value));
  }

  Widget dobfield() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(top: 6, bottom: 6),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              openDatePacker(context);
            },
            icon: Icon(Icons.calendar_today),
          ),
          Text("DOB")
        ],
      ),
    );
  }

  Widget savebutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("Save"),
        ),
      ],
    );
  }
}
