
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,{String title,String message}) {

// set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { Navigator.of(context).pop(); FocusScope.of(context).requestFocus(new FocusNode());
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}