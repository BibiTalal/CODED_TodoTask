import 'package:flutter/material.dart';
import 'package:half_task/models/todo_model.dart';

class ToDoProvider extends ChangeNotifier {
  List<ToDoModel> ToDos = [
    ToDoModel(text: "Define provider class", isComplete: false),
    ToDoModel(text: "Provide/Configure the provider", isComplete: false),
    ToDoModel(
        text: "watch/read provider variables/function", isComplete: false),
  ];

  void addToDo(String todo) {
    ToDoModel model = ToDoModel(text: todo, isComplete: false);
    ToDos.add(model);
    notifyListeners();
  }

  void deleteToDo(int index) {
    ToDos.removeAt(index);
    notifyListeners();
  }

  void changeTaskStatusByIndex(int index) {
    ToDos[index].isComplete = !ToDos[index].isComplete;
    notifyListeners();
  }
}
