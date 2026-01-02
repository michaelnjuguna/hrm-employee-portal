import 'package:employee_portal/features/dashboard/presentation/widgets/edit_event/edit_event_form.dart';
import 'package:flutter/material.dart';

class EditEventBottomSheet extends StatefulWidget {
  const EditEventBottomSheet({super.key});

  @override
  State<EditEventBottomSheet> createState() => _EditEventBottomSheetState();
}

class _EditEventBottomSheetState extends State<EditEventBottomSheet> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            // width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Edit Event',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  iconSize: 25,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          EditEventForm(
            onSubmit: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
