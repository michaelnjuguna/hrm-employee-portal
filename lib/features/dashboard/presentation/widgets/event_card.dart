import 'package:employee_portal/features/dashboard/presentation/widgets/more_widget.dart';
import 'package:flutter/material.dart';
import 'package:employee_portal/app/constants.dart';
import 'package:employee_portal/features/dashboard/models/event.dart';

class EventCard extends StatefulWidget {
  final List<Event> events;
  const EventCard({super.key, required this.events});
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.events.length,
      itemBuilder: (context, index) {
        final event = widget.events[index];
        return Card(
          child: ListTile(
            title: Text(event.title, style: textTheme.titleMedium),
            subtitle: Text(
              event.description ?? '',
              style: textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6),
                  width: 4,
                  height: constraints.maxHeight * 0.6,
                );
              },
            ),

            trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSpacing.p4),
                    ),
                  ),
                  builder: (context) => const MoreBottomSheet(),
                );
              },
              icon: Icon(Icons.more_vert),
            ),
          ),
        );
      },
    );
  }
}
