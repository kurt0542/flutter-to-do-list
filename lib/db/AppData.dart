import 'package:hive_flutter/hive_flutter.dart';

class AppData {
  List toDoList = [];

  final _appDatabase = Hive.box('AppDatabase');

  void loadData() {
    if (_appDatabase.get("TODOLIST") == null) {
    toDoList = [];
    _appDatabase.put("TODOLIST", toDoList);
  } else {
    toDoList = _appDatabase.get("TODOLIST");
  }
  }

  void updateData() {
    _appDatabase.put("TODOLIST",toDoList);
  }

}
