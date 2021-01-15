import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "hello",
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                // DateFormat.yMMMd().format(
                //   transactions[index].date,
                // ),
                "Hello",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
