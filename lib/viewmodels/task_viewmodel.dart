import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';

class TaskViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Fetch tasks from Firestore
  void fetchTasks() {
    _firestoreService.getTasks().listen((taskList) {
      _tasks = taskList;
      notifyListeners();
    });
  }

  // Add a task
  void addTask(Task task) async {
    await _firestoreService.addTask(task);
  }

  // Update a task
  void updateTask(Task task) async {
    await _firestoreService.updateTask(task);
  }

  // Delete a task
  void deleteTask(String taskId) async {
    await _firestoreService.deleteTask(taskId);
  }
}
