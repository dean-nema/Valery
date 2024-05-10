import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:valery/src/data/db.dart';
import 'package:valery/src/utils/addBalance.dart';
import 'package:valery/src/utils/creditDialog.dart';
import 'package:valery/src/utils/drawerF.dart';

import '../utils/shopTile.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  //variables
  Database db1 = Database();
  final _mybox = Hive.box("mybox");

  //was running out of time
  int total = 0;

  final nameCont = TextEditingController();
  final costCont = TextEditingController();
  final amountCont = TextEditingController();
  final addCont = TextEditingController();

  //methods
  @override
  void initState() {
    //first time opening app init db
    if (_mybox.get("SHOPS") == null) {
      db1.createInitData();
    } else {
      //not first time
      db1.loadData();
    }

    super.initState();
  }

  void newCredit() {
    int amount = int.parse(amountCont.text);
    int cost = int.parse(costCont.text);
    setState(() {
      db1.shops.add([nameCont.text,(cost-amount), cost]);
    });
    amountCont.clear();
    costCont.clear();
    nameCont.clear();
    db1.updateDb();
    Navigator.of(context).pop();
  }

  void createCredit() {
    showDialog(
        context: context,
        builder: (context) {
          return CDialog(
            nameCont: nameCont,
            costCont: costCont,
            amountCont: amountCont,
            onCancel: () => Navigator.of(context).pop(),
            onSave: newCredit,
          );
        });
    db1.updateDb();
  }

  void deleteCredit(index) {
    setState(() {
      db1.shops.removeAt(index);
    });
    db1.updateDb();
  }

  void addF(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AddF(
          index: index,
          addCont: addCont,
          data: db1.shops,
          onSave: () => updateAmounts(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db1.updateDb();
  }

  void updateAmounts(index) {
    int topUp = int.parse(addCont.text);
    setState(() {
      if (db1.shops[index][1] < topUp) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Valery you may have overpaid or entered the wrong amount"),
          duration: Duration(seconds: 5),
        ));
        db1.shops[index][1] -= topUp;
      } else {
        db1.shops[index][1] -= topUp;
        if (db1.shops[index][1] == 0) {
          String name = db1.shops[index][0];
          db1.shops.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: [
              const Icon(Icons.thumb_up),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Valery Congrats on finishing your $name credit from your brother hehehe LMAO",
                overflow: TextOverflow.visible,
              ))
            ]),
            duration: const Duration(seconds: 5),
          ));
        }
      }
      addCont.clear();
      Navigator.of(context).pop();
    });
    db1.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Center(child: Text("CREDITS")),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const DrawerF(),
      floatingActionButton: FloatingActionButton(
        onPressed: createCredit,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Text(
                    "E${db1.getTotal()}",
                    style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const Text("Total Credit")
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: db1.shops.length,
                itemBuilder: (context, index) {
                  return ShopTile(
                    shopName: db1.shops[index][0],
                    amount: db1.shops[index][1],
                    count: index,
                    deleteF: (context) => deleteCredit(index),
                    addF: () => addF(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
