import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShopTile extends StatelessWidget {
  final String shopName;
  final int amount;
  final int count;
  Function(BuildContext)? deleteF;
  Function()? addF;
  ShopTile(
      {super.key,
      required this.shopName,
      required this.amount,
      required this.count,
      required this.deleteF,
      required this.addF
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addF,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              padding: const EdgeInsets.all(25),
              onPressed: deleteF,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
          child: Container(
            //margin: EdgeInsets.all(30),
            //padding: EdgeInsets.all(30) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          shopName,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
                  const Expanded(child: SizedBox()),
                  Expanded(
                      child: Text(
                    "E $amount",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
