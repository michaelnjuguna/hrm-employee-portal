import 'package:employee_portal/app/constants.dart';
import 'package:flutter/material.dart';

class MoreBottomSheet extends StatefulWidget {
  const MoreBottomSheet({super.key});

  @override
  State<MoreBottomSheet> createState() => _MoreBottomSheetState();
}

class _MoreBottomSheetState extends State<MoreBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.p4),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: Icon(Icons.visibility), title: Text('View')),
              ListTile(leading: Icon(Icons.edit), title: Text('Edit')),
              ListTile(
                leading: Icon(Icons.delete, color: colorScheme.error),
                title: Text(
                  'Delete',
                  style: TextStyle(color: colorScheme.error),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
