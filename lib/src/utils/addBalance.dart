// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'myButtons.dart';

class AddF extends StatelessWidget {
  final addCont;
  final index;
  final List data;
  VoidCallback onSave;
  VoidCallback onCancel;
  AddF(
      {super.key,
      required this.addCont,
      required this.index,
      required this.data,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
   int paid = (data[index][2]-data[index][1]);
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      content: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text("ADD",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          TextField(
            controller: addCont,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Deposit Amount"),
          ),
          Row(
            children: [
              Expanded(child: Text("BALANCE ")),
              Expanded(child: Text("E ${data[index][1]}"))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("PAID")),
              Expanded(child: Text("E $paid"))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("TOTAL COST")),
              Expanded(child: Text("E ${data[index][2]}"))
            ],
          ),
          Row(
            children: [
              //save
              Expanded(
                  flex: 3, child: Mybutton(text: "Save", onPressed: onSave)),
              Expanded(flex: 1, child: SizedBox()),
              //cancel
              Expanded(
                  flex: 3, child: Mybutton(text: "Cancel", onPressed: onCancel))
            ],
          ),
          Text(data[index][0],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ]),
      ),
    );
  }
}
