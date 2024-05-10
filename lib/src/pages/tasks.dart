import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:valery/src/data/db.dart';
import 'package:valery/src/utils/dialogBox.dart';
import 'package:valery/src/utils/drawerF.dart';
import 'package:valery/src/utils/todoTile.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  //hive box reference
  final _mybox = Hive.box("mybox");
  //db initialisation
  Database db = Database();

  //text controller
  final myController = TextEditingController();
  //list of to do tasks

  //methods
  @override
  void initState() {
    //first time opening app init db
    if (_mybox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      //not first time
      db.loadData();
    }

    super.initState();
  }

  void checkboxChanged(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDb();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([myController.text, false]);
      Navigator.of(context).pop();
      myController.clear();
    });
    db.updateDb();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            mController: myController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    db.updateDb();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          title: const Center(child: Text("TO DO")),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          
        ),
        
        drawer: const DrawerF(),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskComplete: db.toDoList[index][1],
                onChanged: (value) => checkboxChanged(index),
                deleteFunction: (context) => deleteTask(index),
              );
            },
          ),
        ));
  }
}
