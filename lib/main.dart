import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/pages/add_task_page.dart';
import 'package:half_task/pages/home_page.dart';
import 'package:half_task/providers/task_provider.dart';
import 'package:half_task/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ToDoProvider(), child: MyApp()));
}

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => ToDoPage(),
  ),
  GoRoute(
    path: "/add",
    builder: (context, state) => AddToDoPage(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var todoprovider = ToDoProvider();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => todoprovider,
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          routerConfig: router,
        ));
  }
}
