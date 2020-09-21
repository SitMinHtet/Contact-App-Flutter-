import 'package:flutter/material.dart';

class ContactDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Contact"),
      content: Text("Are you sure to delete?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("Cancel"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text("Yes "),
        )
      ],
    );
  }
}
