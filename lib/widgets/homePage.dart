import 'package:flutter/material.dart';

import './createTransaction.dart';
import './transactionList.dart';

import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 100,
      date: DateTime.now(),
    ),
  ];

  void _addNewTx(String title, num amount){
    final newTx = Transaction(
      title : title,
      amount : amount,
      date : DateTime.now(),
      id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTx),
        TransactionList(_userTransactions),
      ],
    );
  }
}
