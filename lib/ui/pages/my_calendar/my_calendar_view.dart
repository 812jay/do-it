import 'package:do_it_app/ui/widget/my_calendar/routine_plan.dart';
import 'package:do_it_app/ui/widget/my_calendar/workout_plan.dart';
import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendarView extends StatefulWidget {
  const MyCalendarView({Key? key}) : super(key: key);

  @override
  _MyCalendarViewState createState() => _MyCalendarViewState();
}

class _MyCalendarViewState extends State<MyCalendarView> {
  final double width = Get.width;
  final double height = Get.height;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TableCalendar(
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
                focusedDate = focusDay;
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
              todayDecoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: ColorDI.clearChill),
            ),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
          ), //캘린더
          Container(
            margin: EdgeInsets.only(
              top: height * 0.02,
              left: height * 0.02,
              right: height * 0.02,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   builder: (context) =>
                      //       WorkoutPlan(selectedDay: selectedDay),
                      // );
                      Get.to(() => WorkoutPlan(selectedDay: selectedDay));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.03),
                      width: width * 0.45,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: ColorDI.bruschettaTomato,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '운동 계획하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ), //운동 계획하기 버튼
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => RoutinePlan(selectedDay: selectedDay),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.03),
                      width: width * 0.45,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: ColorDI.bruschettaTomato,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '루틴 불러오기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ), //루틴 불러오기 버튼
                ]),
          ),
        ],
      ),
    );
  }
}
