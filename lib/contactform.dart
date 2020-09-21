import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactForm extends StatefulWidget {
  final Function addConatct;
  ContactForm(this.addConatct);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  DateTime selectedDate;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final formkey = GlobalKey<FormState>();
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
            key: formkey,
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
        controller: nameController,
        validator: (value) {
          if (value.length < 5) {
            return "Name must be more than 5";
          }
          return null;
        },
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
        controller: emailController,
        validator: (value) {
          if (!value.contains("@")) {
            return "Invalid Email";
          }
          return null;
        },
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
        controller: phoneController,
        validator: (value) {
          if (value.length < 10) {
            return "Phone must be more than 10";
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Enter Phone Number",
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
        .then((value) {
      setState(() {
        selectedDate = value;
      });
    });
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
          Text(selectedDate == null
              ? "DOB"
              : "${DateFormat.yMMMMd().format(selectedDate)}")
        ],
      ),
    );
  }

  void submitData(context) {
    final enterName = nameController.text;
    final enterEmail = emailController.text;
    final enterPhone = phoneController.text;

    widget.addConatct(enterName, enterEmail, enterPhone, selectedDate);
  }

  Widget savebutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          onPressed: () {
            if (formkey.currentState.validate()) {
              submitData(context);
              Navigator.of(context).pop();
            }
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
