import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
          child: Text(
            '\$ 12.66',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
