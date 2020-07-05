import 'package:bytebankcontatos/http/web_cliente.dart';
import 'package:bytebankcontatos/models/contact.dart';
import 'package:bytebankcontatos/models/transaction.dart';
import 'package:bytebankcontatos/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankContactsApp());
  save(Transaction(200.0, Contact(0, 'João Vitor', 3006)))
      .then((transaction) => print(transaction));
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
