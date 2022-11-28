import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:half_task/providers/todo_provider.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Todo",
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.push("/add");
            },
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: context.watch<ToDoProvider>().ToDos.length,
          itemBuilder: (context, index) {
            var provider = context.watch<ToDoProvider>();
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: context
                              .watch<ToDoProvider>()
                              .ToDos[index]
                              .isComplete,
                          onChanged: ((value) {
                            context
                                .read<ToDoProvider>()
                                .changeTaskStatusByIndex(index);
                          }),
                        ),
                        Text(context.watch<ToDoProvider>().ToDos[index].text),
                        Spacer(),
                        if (!context
                            .read<ToDoProvider>()
                            .ToDos[index]
                            .isComplete)
                          IconButton(
                              onPressed: null, icon: Icon(Icons.delete_forever))
                        else
                          IconButton(
                              onPressed: () {
                                var delete = context.read<ToDoProvider>();
                                delete.deleteToDo(index);
                              },
                              icon: Icon(Icons.delete)),
                      ],
                    )));
          }),
    );
  }
}
