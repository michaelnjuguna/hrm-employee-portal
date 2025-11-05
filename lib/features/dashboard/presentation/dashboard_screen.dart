import 'package:employee_portal/features/dashboard/presentation/calendar_widget.dart';
import 'package:employee_portal/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _selectedDay;

  void _handleDaySelected(DateTime day) {
    setState(() {
      _selectedDay = Jiffy.parse(
        day.toString(),
      ).format(pattern: 'EEEE, MMMM d');
    });

    // debugPrint('Selected day: $_selectedDay');
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calendar(onDaySelected: _handleDaySelected),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('$_selectedDay', style: textScheme.titleMedium),
            ),
        ],
      ),
    );
  }
}
