import 'package:flutter/material.dart';

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
    final textScheme = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.events.length,
      itemBuilder: (context, index) {
        final event = widget.events[index];
        return ListTile(
          isThreeLine: true,
          contentPadding: EdgeInsets.zero,
          title: Text(event.title, style: textScheme.titleMedium),
          subtitle: Text(
            event.description ?? '',
            style: textScheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 2),
            width: 4,
            height: double.infinity,
          ),

          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        );
      },
    );
  }
}
