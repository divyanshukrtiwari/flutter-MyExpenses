import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import './homePage.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate;

  void _submitData() {
    if(_amountController.text.isEmpty){
      return;
    }
    
    final enteredTitle = _titleController.text;
    final enteredAmount = num.parse(_amountController.text);


    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    } else {
      widget.addNewTx(
        enteredTitle,
        enteredAmount,
      );
    }

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
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
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'No Date Chosen!'
                            : 'Date : ${DateFormat.yMd().format(_selectDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        //  style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add Transaction',
                // style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
