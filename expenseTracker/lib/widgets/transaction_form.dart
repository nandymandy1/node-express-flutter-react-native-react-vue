import 'package:flutter/material.dart';

class TransactionFrom extends StatelessWidget {
  final Function addUserTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionFrom({this.addUserTransaction});

  @override
  Widget build(BuildContext context) => Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Expense Name'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount Expensed'),
              ),
              FlatButton(
                onPressed: () => addUserTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                ),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      );
}
