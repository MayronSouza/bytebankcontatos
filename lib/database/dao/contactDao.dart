import 'package:bytebankcontatos/database/app_database.dart';
import 'package:bytebankcontatos/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_fullName TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _fullName = 'full_name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = handleMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return handleList(result);
  }

  List<Contact> handleList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_fullName],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  Map<String, dynamic> handleMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_fullName] = contact.fullName;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }
}
