import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Future<Transaction> save(Transaction transaction) async {
    // Transforma o Map em uma String JSON
    final String transactionJson = jsonEncode(transaction.toJson());

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
      transactions.add(Transaction.fromJson(transactionJson));
    }

    return transactions;
  }

  Transaction _toTransaction(http.Response response) {
    // Retorna um Object JSON
    Map<String, dynamic> newTransactionJson = jsonDecode(response.body);

    return Transaction.fromJson(newTransactionJson);
  }
}
