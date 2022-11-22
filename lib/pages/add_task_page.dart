import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(controller: controller),
        ElevatedButton(
          onPressed: () {
            context.read<TaskProvider>().addTask(controller.text);
            context.pop();
          },
          child: Text("Add"),
        ),
      ]),
    );
  }
}
