import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFrom extends StatefulWidget {
  final Function addUserTransaction;

  TransactionFrom({
    this.addUserTransaction,
  });

  @override
  _TransactionFromState createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addUserTransaction(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
    // Close the Modal Sheet
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2021),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() => _selectedDate = pickedDate);
    });
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
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                decoration: InputDecoration(labelText: 'Expense Name'),
              ),
              TextField(
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount Expensed'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Chose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ],
          ),
        ),
      );
}
