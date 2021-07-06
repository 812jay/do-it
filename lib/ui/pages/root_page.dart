import 'package:do_it_app/ui/pages/my_calendar/my_calendar_view.dart';
import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final double height = Get.height;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyCalendarView(),
    Text('루틴'),
    Text('나의운동'),
    Text('설정')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '달력',
            icon: Icon(Icons.calendar_today_outlined),
          ),
          BottomNavigationBarItem(
            label: '루틴',
            icon: Image.asset(
              'assets/icons/routine.png',
              color: _selectedIndex == 1 ? ColorDI.clearChill : null,
              height: height * 0.032,
            ),
          ),
          BottomNavigationBarItem(
            label: '나의운동',
            icon: Image.asset(
              'assets/icons/dumbbell.png',
              color: _selectedIndex == 2 ? ColorDI.clearChill : null,
              height: height * 0.032,
            ),
          ),
          BottomNavigationBarItem(
            label: '설정',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
