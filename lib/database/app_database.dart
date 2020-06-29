import 'package:bytebankcontatos/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'full_name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['full_name'] = contact.fullName;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = List();
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row['id'],
      row['full_name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}
