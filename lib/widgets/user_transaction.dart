import 'dart:math';

import 'package:expenses_flutter/widgets/transaction_list.dart';
import 'package:expenses_flutter/widgets/new_transaction.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'A123', title: 'New book', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 'A124', title: 'New Note', amount: 19.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: new Random().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
