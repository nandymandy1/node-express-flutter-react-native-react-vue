import 'package:flutter/material.dart';

class TransactionFrom extends StatefulWidget {
  final Function addUserTransaction;

  TransactionFrom({
    this.addUserTransaction,
  });

  @override
  _TransactionFromState createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addUserTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
    // Close the Modal Sheet
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(labelText: 'Expense Name'),
              ),
              TextField(
                controller: amountController,
                onSubmitted: (_) => submitData(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount Expensed'),
              ),
              FlatButton(
                onPressed: submitData,
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
