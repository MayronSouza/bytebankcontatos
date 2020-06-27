import 'package:bytebankcontatos/screens/contact_form.dart';
import 'package:bytebankcontatos/screens/contacts_list.dart';
import 'package:bytebankcontatos/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankContactsApp());

class BytebankContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ContactForm(),
    );
  }
}
