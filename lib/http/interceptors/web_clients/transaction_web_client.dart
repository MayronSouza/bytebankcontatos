import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bytebankcontatos/models/contact.dart';
import 'package:bytebankcontatos/models/transaction.dart';
import 'package:bytebankcontatos/http/web_cliente.dart';

class TransactionWebClient {
  // Retorna todas as transações
  Future<List<Transaction>> findAll() async {
    final http.Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    List<Transaction> transactions = _toTransactions(response);

    return transactions;
  }

<<<<<<< HEAD
  // Cria uma nova transação
=======
// Cria uma nova transação
>>>>>>> 4555351c4df59b685d9079e16907134b7dec6e02
  Future<Transaction> save(Transaction transaction) async {
    // Transforma a transação em um Map
    final Map<String, dynamic> transactionMap = _toMap(transaction);

    // Transforma o Map em uma String JSON
    final String transactionJson = jsonEncode(transactionMap);

    // POST para criação de uma transação
    final http.Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return _toTransaction(response);
  }

  List<Transaction> _toTransactions(http.Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();

    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }

    return transactions;
  }

  Transaction _toTransaction(http.Response response) {
    // Retorna um Object JSON
    Map<String, dynamic> newTransactionJson = jsonDecode(response.body);
    final Map<String, dynamic> contactJson = newTransactionJson['contact'];
    return Transaction(
      newTransactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.fullName,
        'accountNumber': transaction.contact.accountNumber,
      }
    };

    return transactionMap;
  }
}
