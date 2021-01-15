import './models/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_form.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Personal Exprenses',
        theme: ThemeData(
          fontFamily: 'QuickSand',
          errorColor: Colors.red,
          accentColor: Colors.amber,
          primarySwatch: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((txn) {
      return txn.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTxn = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() => _userTransactions.add(newTxn));
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((txn) => txn.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) => showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TransactionFrom(
              addUserTransaction: _addNewTransaction,
            ),
            behavior: HitTestBehavior.opaque,
          );
        },
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal Expenses',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(
                recentTxns: _recentTransactions,
              ),
              TransactionList(
                deleteTxn: _deleteTransaction,
                transactions: _userTransactions,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => _startAddNewTransaction(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
}
