import 'package:flutter/material.dart';
import '../transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) onRemove;
  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text("Nenhuma Transação cadastrada!"),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets\\images\\waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(tr.title),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
