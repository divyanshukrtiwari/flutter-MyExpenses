import 'package:flutter/material.dart';

//import './homePage.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = num.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addNewTx(
        enteredTitle,
        enteredAmount,
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color:Theme.of(context).primaryColor),
              ),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
