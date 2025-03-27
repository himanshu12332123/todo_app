import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskTile({required this.task, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 40.0 : 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: isTablet ? 24.0 : 16.0),
          title: Text(task.title, style: TextStyle(fontSize: isTablet ? 22.0 : 18.0, fontWeight: FontWeight.bold)),
          subtitle: Text(task.description, style: TextStyle(fontSize: isTablet ? 18.0 : 14.0)),
          trailing: Checkbox(value: task.completed, onChanged: (value) => onToggle()),
          onLongPress: onDelete,
        ),
      ),
    );
  }
}
