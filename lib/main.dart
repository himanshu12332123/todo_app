import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is ready
  await Firebase.initializeApp(); // Initializes Firebase

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel()..fetchTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskListScreen(),
      ),
    ),
  );
}
