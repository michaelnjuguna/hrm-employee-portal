import 'package:employee_portal/app/constants.dart';
import 'package:employee_portal/features/dashboard/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:employee_portal/features/dashboard/models/event.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<Event>> _events = {
    DateTime.utc(2025, 11, 5): [
      Event(
        title: 'Meeting',
        description:
            'Lorem ipsum dolor sit amet consectetur adipiscing elit. Consectetur adipiscing elit quisque faucibus ex sapien vitae. Ex sapien vitae pellentesque sem placerat in id. Placerat in id cursus mi pretium tellus duis. Pretium tellus duis convallis tempus leo eu aenean.',
      ),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
      Event(title: 'Call', description: 'Lorem ipsum '),
    ],
    DateTime.utc(2025, 11, 6): [Event(title: 'Deadline', description: 'data')],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  void _goToToday() {
    final today = DateTime.now();
    setState(() {
      _focusedDay = today;
      _selectedDay = today;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;
    final events = _selectedDay != null
        ? _getEventsForDay(_selectedDay!)
        : <Event>[];
    return Column(
      // height: MediaQuery.of(context).size.height * 50,
      children: [
        TableCalendar(
          rangeSelectionMode: RangeSelectionMode.enforced,
          focusedDay: _focusedDay,
          firstDay: DateTime(2000),
          lastDay: DateTime(2100),
          calendarFormat: CalendarFormat.month,
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          pageJumpingEnabled: false,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: HeaderStyle(
            titleCentered: true,
            leftChevronMargin: EdgeInsets.symmetric(horizontal: 0),
            leftChevronPadding: EdgeInsets.only(left: 0, right: 4),
            rightChevronPadding: EdgeInsets.only(right: 0, left: 4),
            leftChevronIcon: Icon(
              Icons.keyboard_arrow_left,
              color: colorScheme.primary,
            ),
            rightChevronMargin: EdgeInsets.symmetric(horizontal: 0),
            rightChevronIcon: Icon(
              Icons.keyboard_arrow_right,
              color: colorScheme.primary,
            ),
            titleTextStyle: TextStyle(
              fontWeight: textScheme.titleMedium?.fontWeight,
              fontSize: textScheme.titleMedium?.fontSize,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              if (events.isNotEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: events.take(3).map((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.secondary,
                      ),
                    );
                  }).toList(),
                );
              }
              return null;
            },
            headerTitleBuilder: (context, date) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Jiffy.parse((date.toString())).format(pattern: 'MMMM')} ${date.year}',
                    style: textScheme.titleMedium,
                  ),
                  OutlinedButton(
                    onPressed: _goToToday,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      minimumSize: Size(0, 30),
                    ),
                    child: Text('Today', style: textScheme.labelSmall),
                  ),
                ],
              );
            },
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            // widget.onDaySelected(selectedDay);
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          eventLoader: _getEventsForDay,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              Jiffy.parse(
                _selectedDay.toString(),
              ).format(pattern: 'EEEE, MMMM d'),
              style: textScheme.titleMedium,
            ),
          ),
        ),
        if (events.isNotEmpty)
          EventCard(events: events)
        else
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('No events', style: textScheme.bodyMedium),
          ),
      ],
    );
  }
}
