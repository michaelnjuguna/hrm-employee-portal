import 'package:employee_portal/features/dashboard/presentation/widgets/calendar_widget.dart';
import 'package:employee_portal/features/dashboard/presentation/widgets/create_event/create_event_widget.dart';
import 'package:employee_portal/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MainLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            // useRootNavigator: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: const CreateEventWidget(),
              );
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Calendar()],
      ),
    );
  }
}
