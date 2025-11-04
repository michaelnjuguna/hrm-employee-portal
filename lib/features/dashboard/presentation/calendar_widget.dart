import 'package:employee_portal/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final ValueChanged<DateTime> onDaySelected;
  const Calendar({super.key, required this.onDaySelected});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onDaySelected(_selectedDay!);
    });
  }

  void _goToToday() {
    final today = DateTime.now();
    setState(() {
      _focusedDay = today;
      _selectedDay = today;
    });
    widget.onDaySelected(today);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
            leftChevronPadding: EdgeInsets.only(left: 0, right: AppSpacing.p2),
            rightChevronPadding: EdgeInsets.only(right: 0, left: AppSpacing.p2),
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
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.lg,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, date) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Jiffy.parse((date.toString())).format(pattern: 'MMMM')} ${date.year}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSizes.lg,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _goToToday,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      minimumSize: Size(0, 30),
                    ),
                    child: Text(
                      'Today',
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
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
            widget.onDaySelected(selectedDay);
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },

          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
