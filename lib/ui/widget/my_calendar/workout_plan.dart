import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key? key, required this.selectedDay}) : super(key: key);

  final DateTime selectedDay;

  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  final double width = Get.width;
  final double height = Get.height;

  List<String> categories = [
    '전체',
    '하체',
    '가슴',
    '어깨',
    '등',
    '팔',
    '역도',
    '복근',
    '전신',
    '기타'
  ]; // 카테고리 리스트

  List<String> filterOptions = [];

  bool isContainedCategory(String category) {
    return filterOptions.contains(category);
  }

  Color getCategoryBoxColor(String category) {
    final result = isContainedCategory(category);
    if (result) {
      return ColorDI.clearChill;
    } else {
      return Colors.white;
    }
  }

  Color getCategoryBorderColor(String category) {
    final result = isContainedCategory(category);
    if (result) {
      return ColorDI.clearChill;
    } else {
      return ColorDI.shootingBreeze;
    }
  }

  Color getCategoryTextColor(String category) {
    final result = isContainedCategory(category);
    if (result) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    filterOptions.add('전체');
  }

  @override
  Widget build(BuildContext context) {
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
                  DateFormat('yy.MM.dd').format(widget.selectedDay),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ), //고정 헤더
            SliverStickyHeader(
              sticky: true,
              header: Container(
                padding: EdgeInsets.only(
                  left: width * 0.02,
                  bottom: height * 0.02,
                ),
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories
                        .map(
                            (category) => getCategoryButton(category: category))
                        .toList(),
                  ),
                ),
              ), //서브헤더
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return getWorkouts();
                }, childCount: 50), //운동목록
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryButton({required String category}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          filterOptions.clear();
          filterOptions.add(category);
        });
      },
      child: Container(
        padding: EdgeInsets.only(
          top: height * 0.005,
          left: height * 0.018,
          bottom: height * 0.005,
          right: height * 0.018,
        ),
        margin: EdgeInsets.only(right: height * 0.02, top: height * 0.02),
        decoration: BoxDecoration(
          color: getCategoryBoxColor(category),
          border: Border.all(width: 1, color: getCategoryBorderColor(category)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: getCategoryTextColor(category),
            fontSize: 17,
          ),
        ),
      ),
    );
  } //카테고리 버튼

  Widget getWorkouts() {
    return Container(
      height: height * 0.1,
      child: Text('data'),
    );
  }
}
