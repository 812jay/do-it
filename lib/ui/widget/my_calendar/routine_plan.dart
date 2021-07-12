import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RoutinePlan extends StatefulWidget {
  const RoutinePlan({Key? key, required this.selectedDay}) : super(key: key);

  final DateTime selectedDay;

  @override
  _RoutinePlanState createState() => _RoutinePlanState();
}

class _RoutinePlanState extends State<RoutinePlan> {
  final double width = Get.width;
  final double height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
        height: height * 0.95,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                ),
              ),
              title: Container(
                child: Text(
                  "루틴 불러오기 | ${DateFormat('yyyy.MM.dd').format(widget.selectedDay)}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ), //고정 헤더
          ],
        ),
      ),
    );
  }
}
