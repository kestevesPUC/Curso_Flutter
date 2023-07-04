import 'dart:math';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

final List<Transaction> _transaction = [];

class _TransactionUserState extends State<TransactionUser> {
  /// Este método recebe um título e um valor, cria uma transaction,e retorna a mesma;
  _createTransaction(String title, double value, DateTime date) {
    return Transaction(Random().nextDouble().toString(), title, value, date);
  }

  /// Este método adiciona uma transaction à lista de transactions;
  void _addTransaction(Transaction t) {
    setState(() => _transaction.add(t));
  }

  void _creatAndAddTransaction(String title, double value, DateTime? date) {
    setState(() => _transaction.add(
        Transaction(Random().nextDouble().toString(), title, value, date!)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // TransactionList(_transaction),
        TransactionFrom(_creatAndAddTransaction),
      ],
    );
  }
}
