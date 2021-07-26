import 'package:do_it_app/ui/widget/workouts/workout_form.dart';
import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkoutsView extends StatefulWidget {
  const WorkoutsView({Key? key}) : super(key: key);

  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  final double width = Get.width;
  final double height = Get.height;

  List<String> categories = [
    '전체',
    '즐겨찾기',
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
              title: Container(
                child: Text(
                  "나의 운동",
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
                      bool bookmarked = workouts[i]['bookmarked'];
                      String workoutsCategory = workouts[i]['category'];
                      if (selectedCategory == workoutsCategory ||
                          selectedCategory == '전체') {
                        containWorkouts.add(getWorkouts(workout: workouts[i]));
                      }
                      if (selectedCategory == '즐겨찾기' && bookmarked == true) {
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
    int workoutIndex = workouts.indexOf(workout);
    return GestureDetector(
      onTap: () {
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
          color: Colors.white,
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.5,
              child: Text(
                '${workout['category']} | ${workout['title']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => WorkoutForm());
                  },
                  child:
                      Icon(Icons.brush_outlined, color: Colors.black, size: 36),
                ), // 삭제
                SizedBox(
                  width: width * 0.03,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.delete, color: Colors.black, size: 36),
                ), // 수정
                SizedBox(
                  width: width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
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
          ],
        ),
      ),
    );
  }

  Widget getBottomNav() {
    return Container(
      height: height * 0.1,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => WorkoutForm());
            },
            child: Container(
              height: height * 0.06,
              width: width * 0.9,
              margin: EdgeInsets.only(
                top: height * 0.02,
                bottom: height * 0.02,
              ),
              decoration: BoxDecoration(
                  color: ColorDI.clearChill,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
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
