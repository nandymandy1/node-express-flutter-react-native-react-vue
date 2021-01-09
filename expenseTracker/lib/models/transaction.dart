import 'package:flutter/foundation.dart';

// Transaction Model
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  // Constructor
  Transaction({
    @required this.id,
    @required this.date,
    @required this.title,
    @required this.amount,
  });
}
