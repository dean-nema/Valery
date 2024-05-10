import 'package:flutter/material.dart';
import 'package:valery/src/utils/myButtons.dart';

class DialogBox extends StatelessWidget {
  final mController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.mController, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
           TextField(
                controller: mController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter New Task"),
            ),
            //buttons
            Row(
              children: [
                //save
                Expanded(
                    flex: 3, child: Mybutton(text: "Save", onPressed: onSave)),
                const Expanded(flex: 1, child: SizedBox()),
                //cancel
                Expanded(
                    flex: 3, child: Mybutton(text: "Cancel", onPressed: onCancel))
              ],
            )
          ],
        ),
      ),
    );
  }
}
