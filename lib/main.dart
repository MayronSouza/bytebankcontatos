import 'package:bytebankcontatos/http/web_cliente.dart';
import 'package:bytebankcontatos/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankContactsApp());
  findAll();
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
