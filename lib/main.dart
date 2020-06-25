import 'package:flutter/material.dart';

void main() => runApp(BytebankContactsApp());

class BytebankContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          // centerTitle: true,
        ),
      ),
    );
  }
}
