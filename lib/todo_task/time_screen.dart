import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/todo_task/time_model.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Timer'), backgroundColor: Colors.blue),
        body: Consumer<TimeModel>(
          builder: (context, timeModel, _) {
            return Center(child: Text('Watch Time: ${timeModel.second}'));
          },
        ),
      ),
    );
  }
}
