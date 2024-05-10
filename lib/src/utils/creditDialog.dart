import 'package:flutter/material.dart';
import 'package:valery/src/utils/myButtons.dart';

class CDialog extends StatelessWidget {
  final nameCont;
  final costCont;
  final amountCont;
  VoidCallback onSave;
  VoidCallback onCancel;
  CDialog({super.key, required this.onCancel, required this.onSave, this.nameCont, this.costCont, this.amountCont});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
    
      content: SizedBox(
        height: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "SHOP NAME",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: nameCont,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Shop Name"),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "TOTAL COST",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: costCont,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Total Amount"),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "DEPOSIT",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: amountCont,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Amount Deposited"),
            ),
            Row(
              children: [
                //save
                Expanded(
                    flex: 3, child: Mybutton(text: "Save", onPressed: onSave)),
                const Expanded(flex: 1, child: SizedBox()),
                //cancel
                Expanded(
                    flex: 3,
                    child: Mybutton(text: "Cancel", onPressed: onCancel))
              ],
            )
          ],
        ),
      ),
    );
  }
}
