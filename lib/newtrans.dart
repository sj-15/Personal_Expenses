// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  // const NewTransactions({Key? key}) : super(key: key);
  final Function addtx;
  NewTransactions(this.addtx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState(addtx);
}

class _NewTransactionsState extends State<NewTransactions> {
  final Function newtrans;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var _selecteDate;

  _NewTransactionsState(this.newtrans);

  void _submitdata() {
    final enteredtitle = _titleController.text;
    if (enteredtitle.isEmpty || _amountController.text.isEmpty) return;
    final enteredamount = double.parse(_amountController.text);

    if (enteredamount <= 0) return;
    widget.addtx(
      enteredtitle,
      enteredamount,
      _selecteDate,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) return;
      setState(() {
        _selecteDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromARGB(255, 139, 19, 213),
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Amount *',
                labelStyle: GoogleFonts.acme(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                ),
              ),
              // onChanged: (val) => amountInput = val,
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitdata(),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Remark *',
                labelStyle: GoogleFonts.acme(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                ),
              ),
              // onChanged: (val) => remarkInput = val,
              controller: _titleController,
              onSubmitted: (_) => _submitdata(),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selecteDate == null
                          ? DateFormat.yMd().format(DateTime.now())
                          : DateFormat.yMd().format(_selecteDate),
                    ),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _datePicker),
                ],
              ),
            ),
            FloatingActionButton(
              elevation: 10,
              onPressed: _submitdata,
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
