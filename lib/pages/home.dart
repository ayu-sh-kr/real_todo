import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:real_todo/components/todo_tile.dart';
import 'package:real_todo/components/utility_components.dart';

import '../components/database/datastore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
    // if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  TextEditingController controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value;
    });
    db.updateDataBase();
  }

  void saveNewTask() async {
    if (controller.text != '') {
      setState(() {
        db.toDoList.add([controller.text, false]);
        controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    } else {
      await Fluttertoast.showToast(
          msg: "Task can't be empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          backgroundColor: Colors.red,
      );
    }
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('TO DO'),
        backgroundColor: Colors.yellow[200],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          shape: const CircleBorder(),
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) => TodoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                )));
  }
}
