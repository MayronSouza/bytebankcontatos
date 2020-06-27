import 'package:bytebankcontatos/database/app_database.dart';
import 'package:bytebankcontatos/models/contact.dart';
import 'package:bytebankcontatos/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankContactsApp());
  save(Contact(0, 'Mayron Souza', 1000));
  findAll().then((contacts) => debugPrint(contacts.toString()));
}

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
      home: Dashboard(),
    );
  }
}
