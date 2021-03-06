import 'package:bytebankcontatos/components/centered_message.dart';
import 'package:bytebankcontatos/components/progress.dart';
import 'package:bytebankcontatos/http/interceptors/web_clients/transaction_web_client.dart';
import 'package:bytebankcontatos/http/web_cliente.dart';
import 'package:bytebankcontatos/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
          future: _webClient.findAll(),
          builder: (context, snapshot) {
            // Observa o estado da conexão
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transaction> transactions = snapshot.data;
                // Observa se o snapshot tem conteúdo
                if (snapshot.hasData) {
                  // Observa se a transação está vazia
                  if (transactions.isNotEmpty) {
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              transaction.value.toString(),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction.contact.accountNumber.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
                return CenteredMessage(
                  'No transaction found',
                  icon: Icons.warning,
                );
                break;
            }
            return CenteredMessage('Unknown error');
          },
        ));
  }
}
