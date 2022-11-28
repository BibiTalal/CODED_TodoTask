import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:half_task/providers/todo_provider.dart';

class AddToDoPage extends StatelessWidget {
  AddToDoPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
        "Add",
        style: TextStyle(color: Colors.white),
      ))),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(controller: controller),
        ElevatedButton(
          onPressed: () {
            context.read<ToDoProvider>().addToDo(controller.text);
            context.pop();
          },
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
