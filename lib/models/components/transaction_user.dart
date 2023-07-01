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

final _transaction = [
  Transaction('t1', 'Tênis de Corrida', 200.99),
  Transaction('t2', 'Conta Faculdade', 350),
];

class _TransactionUserState extends State<TransactionUser> {
  /// Este método recebe um título e um valor, cria uma transaction,e retorna a mesma;
  _createTransaction(String title, double value) {
    return Transaction(Random().nextDouble().toString(), title, value);
  }

  /// Este método adiciona uma transaction à lista de transactions;
  void _addTransaction(Transaction t) {
    setState(() => _transaction.add(t));
  }

  void _creatAndAddTransaction(String title, double value) {
    setState(() => _transaction
        .add(Transaction(Random().nextDouble().toString(), title, value)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionFrom(_creatAndAddTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
