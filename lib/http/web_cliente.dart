import 'dart:convert';
import 'package:bytebankcontatos/models/contact.dart';
import 'package:bytebankcontatos/models/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('Status: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

final http.Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

final String baseUrl = 'http://192.168.122.1:8080/transactions';

// Retorna todas as transações
Future<List<Transaction>> findAll() async {
  final http.Response response =
      await client.get(baseUrl).timeout(Duration(seconds: 5));
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

// Cria uma nova transação
Future<Transaction> save(Transaction transaction) async {
  // Transforma a transação em um Map
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.fullName,
      'accountNumber': transaction.contact.accountNumber,
    }
  };

  // Transforma o Map em uma String JSON
  final String transactionJson = jsonEncode(transactionMap);

  // POST para criação de uma transação
  final http.Response response = await client.post(baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson);

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
