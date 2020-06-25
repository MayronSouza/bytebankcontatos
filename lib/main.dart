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
        body: Column(
          children: <Widget>[
            Image.asset('assets/images/bytebank_logo.png'),
            Container(
              color: Colors.green,
              height: 120.0,
              width: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.people,
                  ),
                  Text('Contacts')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
