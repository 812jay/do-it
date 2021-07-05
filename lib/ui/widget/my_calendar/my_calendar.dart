import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

// final DateTime _selectedDay;
// final DateTime _focusedDay;

void onDaySelected() {
  print('object');
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: selectedDay,
      firstDay: DateTime(1990),
      lastDay: DateTime(2060),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      onDaySelected: (selectDay, focusDay) {
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
      },
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          format = _format;
        });
      },
      calendarStyle: CalendarStyle(
        // isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
            color: ColorDI.bruschettaTomato, shape: BoxShape.circle),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration:
            BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
        todayTextStyle: TextStyle(color: ColorDI.clearChill),
      ),
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDay, date);
      },
    );
  }
}
