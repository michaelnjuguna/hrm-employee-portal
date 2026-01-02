import 'package:employee_portal/features/dashboard/presentation/widgets/edit_event/edit_event_bottom_sheet.dart';
import 'package:employee_portal/features/dashboard/presentation/widgets/view_event/view_event_bottom_sheet.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    builder: (context) => const ViewEventBottomSheet(),
                  );
                },
                leading: const Icon(Icons.visibility_outlined),
                title: const Text('View'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),

                        child: const EditEventBottomSheet(),
                      );
                    },
                  );
                },
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Edit'),
              ),
              ListTile(
                leading: Icon(Icons.delete_outline, color: colorScheme.error),
                title: Text(
                  'Delete',
                  style: TextStyle(color: colorScheme.error),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: colorScheme.error,
                            ),
                            Text(
                              'Delete event',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        content: Text(
                          'Are you sure you would like to do this?',
                          style: textTheme.bodyMedium,
                        ),
                        actions: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.infinity,

                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: colorScheme.surface,
                                    foregroundColor: colorScheme.onSurface,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,

                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: colorScheme.error,
                                    foregroundColor: colorScheme.onError,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Delete'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
