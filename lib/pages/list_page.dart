import 'package:flutter/material.dart';
import 'package:half_task/providers/task_provider.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: ListView.builder(
          itemCount: context.watch<TaskProvider>().tasks.length,
          itemBuilder: (context, index) =>
              Text(context.watch<TaskProvider>().tasks[index])),
    );
  }
}
