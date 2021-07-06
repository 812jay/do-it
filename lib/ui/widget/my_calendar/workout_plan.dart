import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

final double width = Get.width;
final double height = Get.height;

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    List _categories = [
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
                  DateFormat('yy.MM.dd').format(widget.selectedDate),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ), //고정 헤더
            SliverStickyHeader(
              sticky: true,
              header: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(
                  left: width * 0.045,
                  right: width * 0.005,
                  bottom: height * 0.02,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((category) {
                      return getCategoryButton(category: category);
                    }).toList(),
                  ),
                ),
              ), //서브 헤더
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(color: ColorDI.clearChill),
                      margin: EdgeInsets.only(
                        bottom: height * 0.025,
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '전신 | 스내치',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                            )
                          ]),
                    );
                  },
                  childCount: 15,
                ),
              ),
            ), //서브 헤더
            SliverPadding(padding: EdgeInsets.only(top: height * 0.02)),
          ],
        ),
      ),
    );
  }
}

Widget getCategoryButton({required String category}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(
        top: height * 0.005,
        left: height * 0.018,
        bottom: height * 0.005,
        right: height * 0.018,
      ),
      margin: EdgeInsets.only(right: height * 0.02, top: height * 0.02),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorDI.shootingBreeze),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        category,
        style: TextStyle(fontSize: 17),
      ),
    ),
  );
}
