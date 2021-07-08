import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class WorkoutPlanTest extends StatefulWidget {
  const WorkoutPlanTest({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WorkoutPlanTestState createState() => _WorkoutPlanTestState();
}

final double width = Get.width;
final double height = Get.height;

class _WorkoutPlanTestState extends State<WorkoutPlanTest> {
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
  List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height * 0.95,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverStickyHeader(
              sticky: true,
              header: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  isSelected: isSelected,
                  selectedColor: Colors.white, //선택된 요소 child color
                  color: Colors.black, //선택안된 요소 child color
                  fillColor: Colors.lightBlue.shade900, //선택된 요소 background
                  children:
                      categories.map((category) => Text(category)).toList(),
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (index == newIndex) {
                          isSelected[index] = !isSelected[index];
                        } else {
                          isSelected[index] = false;
                        }
                      }
                    });
                  },
                ),
              ),
            )
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
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        category,
        style: TextStyle(fontSize: 17),
      ),
    ),
  );
}
