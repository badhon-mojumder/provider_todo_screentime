import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/todo_task/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
  }

  void showAddTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextFormField(
              controller: descController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                context.read<TodoModel>().addTask(
                  titleController.text,
                  descController.text,
                );
              }
              titleController.clear();
              descController.clear();
              Navigator.pop(context);
            },
            child: Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Consumer<TodoModel>(
        builder: (context, taskModel, _) {
          if (taskModel.task.isEmpty) {
            return Center(child: Text('No Task Yet.. Please Add New...'));
          }
          return ListView.builder(
            itemCount: taskModel.task.length,
            itemBuilder: (context, index) {
              final task = taskModel.task[index];
              return Card(
                child: ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      taskModel.toggleTask(index);
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    task.description,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      taskModel.deleteTask(index);
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
