import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transactions Added Yet!',
                  ),
                  SizedBox(height: 20,),
                  Container(
                      height: 300,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 6,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\u20B9${userTransactions[index].amount.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userTransactions[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              formatDate(userTransactions[index].date,
                                  [d, '-', M, '-', yyyy]),
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}
