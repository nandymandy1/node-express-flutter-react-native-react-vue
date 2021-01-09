import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_form.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    final newTxn = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() => _userTransactions.add(newTxn));
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TransactionFrom(addUserTransaction: _addNewTransaction),
          TransactionList(transactions: _userTransactions),
        ],
      );
}
