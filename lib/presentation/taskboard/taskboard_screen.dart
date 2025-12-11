import 'package:employee_portal/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class TaskboardScreen extends StatefulWidget {
  const TaskboardScreen({super.key});

  @override
  State<TaskboardScreen> createState() => _TaskboardScreenState();
}

class _TaskboardScreenState extends State<TaskboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(appBarTitle: 'Task board', child: Text('Taskboard'));
  }
}
