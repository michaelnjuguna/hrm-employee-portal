import 'package:flutter/material.dart';

class ViewEventBottomSheet extends StatefulWidget {
  const ViewEventBottomSheet({super.key});
  @override
  State<ViewEventBottomSheet> createState() => _ViewEventBottomSheet();
}

class _ViewEventBottomSheet extends State<ViewEventBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
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
                    'View Event',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          ],
        );
      },
    );
  }
}
