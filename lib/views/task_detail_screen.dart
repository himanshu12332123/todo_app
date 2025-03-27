import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskDetailScreen extends StatefulWidget {
  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Center(
        child: Container(
          width: isTablet ? 500 : double.infinity, // Limit width on tablets
          padding: EdgeInsets.all(isTablet ? 40.0 : 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
              SizedBox(height: 10),
              TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Save Task'),
                onPressed: () {
                  final newTask = Task(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                  );
                  taskViewModel.addTask(newTask);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
