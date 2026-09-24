import 'package:flutter/material.dart';
import 'package:provider_todo/todo_task/counter_screen.dart';
import 'package:provider_todo/todo_task/time_screen.dart';
import 'package:provider_todo/todo_task/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoScreen()),
                );
              },
              child: Text('Todo Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeScreen()),
                );
              },
              child: Text('Timer Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderCounterScreen(),
                  ),
                );
              },
              child: Text('Counter Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
