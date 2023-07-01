import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transaction = [
    Transaction('t1', 'Tênis de Corrida', 200.99, DateTime.now()),
    Transaction('t2', 'Conta Faculdade', 350, DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Gráfico"),
              elevation: 5,
            ),
          ),
          Column(
            children: _transaction.map((tr) {
              return Card(
                child: Text(tr.title),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
