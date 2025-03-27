import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';
import '../widgets/task_tile.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('TODO List')),
      body: ListView.builder(
        itemCount: taskViewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = taskViewModel.tasks[index];
          return TaskTile(
            task: task,
            onToggle: () {
              task.completed = !task.completed;
              taskViewModel.updateTask(task);
            },
            onDelete: () => taskViewModel.deleteTask(task.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => TaskDetailScreen())),
      ),
    );
  }
}
