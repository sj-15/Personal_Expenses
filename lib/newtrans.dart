// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTransactions extends StatefulWidget {
  // const NewTransactions({Key? key}) : super(key: key);
  final Function addtx;
  NewTransactions(this.addtx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState(addtx);
}

class _NewTransactionsState extends State<NewTransactions> {
  final Function newtrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _NewTransactionsState(this.newtrans);

  void submitdata() {
    final enteredtitle = titleController.text;
    if (enteredtitle.isEmpty || amountController.text.isEmpty) return;
    final enteredamount = double.parse(amountController.text);

    if (enteredamount <= 0) return;
    widget.addtx(
      enteredtitle,
      enteredamount,
    );
    Navigator.of(context).pop();
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
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
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
              controller: titleController,
              onSubmitted: (_) => submitdata(),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              elevation: 10,
              onPressed: submitdata,
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
