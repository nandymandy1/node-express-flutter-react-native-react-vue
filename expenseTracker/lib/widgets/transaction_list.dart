import 'package:expenseTracker/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTxn;

  TransactionList({
    this.deleteTxn,
    this.transactions,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 450,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/norecord.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteTxn(transactions[index].id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      );
}
