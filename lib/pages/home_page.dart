import 'package:flutter/material.dart';
import 'package:to_do_list/db/AppData.dart';
import 'package:to_do_list/util/dialog_box.dart';
import '../util/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _AppDatabase = Hive.box('AppDatabase');
  final _taskNameController = TextEditingController();

  AppData db = AppData();

  @override
  void initState() {
      db.loadData();
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_taskNameController.text, false]);
      db.updateData();
    });
    Navigator.of(context).pop();
  }

  void createTasks() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(taskName: _taskNameController, onSave: saveNewTask);
        db.updateData();
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('To Do List'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTasks();
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
