import 'package:do_it_app/ui/widget/my_calendar/my_calendar.dart';
import 'package:do_it_app/ui/widget/my_calendar/nav_plan_button.dart';
import 'package:flutter/material.dart';

class MyCalendarView extends StatefulWidget {
  const MyCalendarView({Key? key}) : super(key: key);

  @override
  _MyCalendarViewState createState() => _MyCalendarViewState();
}

class _MyCalendarViewState extends State<MyCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyCalendar(),
          NavPlanButton(),
        ],
      ),
    );
  }
}
