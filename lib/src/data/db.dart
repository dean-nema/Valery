import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List shops = [];

  int total = 0;

  List toDoList = [];
  //ref the box
  final _mybox = Hive.box("mybox");

  //methods

  //first time opeining app
  void createInitData() {
    toDoList = [
      ["Make a Huge Smile", false],
      ["Have Fun on your Birthday", false]
    ];
  }

  //load Data from db
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
    shops = _mybox.get("SHOPS");
  }

  //update

  void updateDb() {
    _mybox.put("TODOLIST", toDoList);
    _mybox.put("SHOPS", shops);
  }

  int getTotal() {
    num sum = 0;
    for (int i = 0; i < shops.length; i++) {
      sum += shops[i][1];
    }
    total = sum.toInt();
    return total;
  }
}
