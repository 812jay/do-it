import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RoutinePlan extends StatefulWidget {
  const RoutinePlan({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;
  @override
  _RoutinePlanState createState() => _RoutinePlanState();
}

class _RoutinePlanState extends State<RoutinePlan> {
  @override
  Widget build(BuildContext context) {
    return getBody(widget.selectedDate);
  }
}

Widget getBody(DateTime selectedDate) {
  final double height = Get.height;
  return SafeArea(
    child: Container(
      height: height * 0.95,
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.cancel_outlined,
              color: Colors.black,
            ),
          ), //뒤로가기
          title: Container(
            child: Text(
              DateFormat('yy.MM.dd').format(selectedDate),
              style: TextStyle(color: Colors.black),
            ),
          ), // 선택한 날짜표시
        )
      ]),
    ),
  );
}
