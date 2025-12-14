import 'package:employee_portal/presentation/dashboard/widgets/create/create_event_form.dart';
import 'package:flutter/material.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  State<CreateEventWidget> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEventWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 16, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Create Event', style: textTheme.titleMedium),
                  IconButton(
                    iconSize: 25,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            CreateEventForm(
              onSubmit: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
