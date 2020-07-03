import 'package:bytebankcontatos/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(
    this.value,
    this.contact,
  );

  @override
  String toString() => 'Transaction(value: $value, contact: $contact)';
}
