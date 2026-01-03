import 'package:employee_portal/features/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      appBarTitle: 'Notifications',
      child: Text('Notifications'),
    );
  }
}
