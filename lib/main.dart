import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/todo_task/time_model.dart';
import 'package:provider_todo/todo_task/todo_model.dart';
import 'package:provider_todo/todo_task/todo_screen.dart';

import 'todo_task/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
