import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskTile({required this.task, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: task.completed ? TextDecoration.lineThrough : null)),
      subtitle: Text(task.description),
      trailing: Checkbox(value: task.completed, onChanged: (value) => onToggle()),
      onLongPress: onDelete,
    );
  }
}
