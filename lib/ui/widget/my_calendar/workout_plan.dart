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
    '유산소',
    '기타'
  ]; // 카테고리 리스트

  List<Map> workouts = [
    {'title': '스내치', 'category': '역도', 'bookmarked': true},
    {'title': '풀업', 'category': '등', 'bookmarked': false},
    {'title': '프론트 스쿼트', 'category': '하체', 'bookmarked': true},
    {'title': '벤치프레스', 'category': '가슴', 'bookmarked': true},
    {'title': '인클라인 덤벨프레스', 'category': '가슴', 'bookmarked': false},
    {'title': '친업', 'category': '등', 'bookmarked': false},
    {'title': '오버헤드 프레스', 'category': '어깨', 'bookmarked': true},
    {'title': '클린 앤 저크', 'category': '역도', 'bookmarked': true},
    {'title': '버피', 'category': '전신', 'bookmarked': false},
  ];

  List<String> filterOptions = [];

  List<String> selectedWorkouts = [];
  // List<Map> selectedWorkouts = [];

  bool isContainedCategory(String category) {
    return filterOptions.contains(category);
  }

  void isContainedWorkout(String category, String title) {
    bool result = false;
    for (int i = 0; i < workouts.length; i++) {
      if (workouts[i]['title'] == title &&
          workouts[i]['category'] == category) {
        result = true;
      } else {
        result = false;
      }
    }
    // return result;
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

  void getWorkoutsBoxColor(String category, String title) {
    isContainedWorkout(category, title);
  }

  @override
  void initState() {
    super.initState();
    filterOptions.add('전체');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNav(),
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
                  "운동 계획하기 | ${DateFormat('yyyy.MM.dd').format(widget.selectedDay)}",
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
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    String selectedCategory = filterOptions[0];
                    List<Widget> containWorkouts = [];
                    for (int i = 0; i < workouts.length; i++) {
                      String workoutsCategory = workouts[i]['category'];
                      if (selectedCategory == workoutsCategory ||
                          selectedCategory == '전체') {
                        containWorkouts.add(getWorkouts(workout: workouts[i]));
                      }
                    }
                    return Column(
                      children:
                          containWorkouts.map((workout) => workout).toList(),
                    );
                  },
                  childCount: 1,
                ),
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

  Widget getWorkouts({required workout}) {
    return GestureDetector(
      onTap: () {
        int workoutIndex = workouts.indexOf(workout);
        if (!selectedWorkouts.contains(workout['title'])) {
          setState(() {
            selectedWorkouts.add(workout['title']);
          });
        } else {
          setState(() {
            selectedWorkouts
                .removeWhere((element) => element == workout['title']);
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: height * 0.01,
          bottom: height * 0.01,
          left: width * 0.05,
          right: width * 0.05,
        ),
        margin: EdgeInsets.only(
          bottom: height * 0.02,
          left: width * 0.05,
          right: width * 0.05,
        ),
        decoration: BoxDecoration(
          color: selectedWorkouts.contains(workout['title'])
              ? ColorDI.clearChill
              : Colors.white,
          border: Border.all(
              width: 3,
              color: selectedWorkouts.contains(workout['title'])
                  ? ColorDI.shootingBreeze
                  : Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${workout['category']} | ${workout['title']}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: selectedWorkouts.contains(workout['title'])
                      ? Colors.white
                      : Colors.black),
            ),
            GestureDetector(
              onTap: () {
                int workoutIndex = workouts.indexOf(workout);
                setState(() => workouts[workoutIndex]
                    .update('bookmarked', (value) => value = !value));
              },
              child: Icon(
                workout['bookmarked']
                    ? (Icons.bookmark)
                    : Icons.bookmark_border,
                size: 36,
                color: ColorDI.riseNShine,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomNav() {
    return Container(
      height: selectedWorkouts.length != 0 ? height * 0.18 : height * 0.1,
      child: Column(
        children: [
          selectedWorkouts.length != 0
              ? Expanded(
                  child: Container(
                  margin: EdgeInsets.only(
                    left: width * 0.035,
                    top: height * 0.015,
                    bottom: height * 0.02,
                  ),
                  height: height * 0.05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedWorkouts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: width * 0.025),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  String workout =
                                      selectedWorkouts.elementAt(index);
                                  setState(() {
                                    selectedWorkouts.removeWhere(
                                        (element) => element == workout);
                                  });
                                },
                                child: Icon(Icons.cancel),
                              ),
                              Text(
                                selectedWorkouts.elementAt(index),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                ))
              : Container(),
          Container(
            height: height * 0.06,
            width: width * 0.9,
            margin: EdgeInsets.only(
              top: height * 0.02,
              bottom: height * 0.02,
            ),
            decoration: BoxDecoration(
                color: selectedWorkouts.length == 0
                    ? ColorDI.shootingBreeze
                    : ColorDI.clearChill,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  print(selectedWorkouts);
                  if (selectedWorkouts.length != 0) Get.back();
                },
                child: Text(
                  '운동 추가하기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
