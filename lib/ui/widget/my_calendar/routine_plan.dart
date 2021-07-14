import 'package:do_it_app/utils/define.dart';
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

  List<Map<String, dynamic>> routines = [
    {
      'routineTitle': '월요루틴',
      'workouts': [
        {'title': '스내치', 'category': '역도', 'bookmarked': true},
        {'title': '프론트 스쿼트', 'category': '하체', 'bookmarked': true},
        {'title': '인클라인 덤벨프레스', 'category': '가슴', 'bookmarked': false},
      ],
    },
    {
      'routineTitle': '수요루틴',
      'workouts': [
        {'title': '클린 앤 저크', 'category': '역도', 'bookmarked': true},
        {'title': '오버헤드 프레스', 'category': '어깨', 'bookmarked': true},
        {'title': '친업', 'category': '등', 'bookmarked': false},
      ],
    },
  ];

  List<Map<String, dynamic>> selectedRoutines = [];

  List isVisibleRoutines = [];

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
          child: CustomScrollView(
        slivers: [
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
          ), // 고정헤더
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                  children: routines
                      .map((routine) => getRoutineBox(routine: routine))
                      .toList());
            }, childCount: 1),
          )
        ],
      )),
    );
  }

  Widget getRoutineBox({required routine}) {
    int index = routines.indexOf(routine);
    return GestureDetector(
      onTap: () {
        if (selectedRoutines.contains(routine)) {
          setState(() {
            selectedRoutines.removeWhere((element) => element == routine);
          });
        } else {
          setState(() {
            selectedRoutines.add(routine);
          });
        }
      },
      child: Container(
        width: width * 0.85,
        margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.02),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedRoutines.contains(routine)
              ? ColorDI.clearChill
              : ColorDI.shootingBreeze,
          // color: ColorDI.shootingBreeze,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    String routineTitle = routine['routineTitle'];
                    if (isVisibleRoutines.contains(routineTitle)) {
                      setState(() {
                        isVisibleRoutines
                            .removeWhere((element) => element == routineTitle);
                      });
                    } else {
                      setState(() {
                        isVisibleRoutines.add(routineTitle);
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.3,
                        child: Text(
                          routine['routineTitle'],
                          overflow: TextOverflow.visible,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ), //루틴명
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          routines.removeWhere((element) =>
                              element['routineTitle'] ==
                              routine['routineTitle']);
                        });
                      },
                      child: Icon(Icons.delete, color: Colors.white, size: 30),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.brush, color: Colors.white, size: 30),
                    ),
                  ],
                ) // 삭제, 수정
              ],
            ),
            getRoutineWorkouts(routine: routines[index]),
          ],
        ), // 루틴박스
      ),
    );
  }

  Widget getRoutineWorkouts({required routine}) {
    List<String> routineNames = [];
    String routineTitle = routine['routineTitle'];

    if (isVisibleRoutines.contains(routineTitle)) {
      for (var r in routine['workouts']) {
        routineNames.add("${r['category']} | ${r['title']}");
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: routineNames
          .map((workout) => Text(
                workout,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
    );
  }

  Widget getBottomNav() {
    return Container(
      height: selectedRoutines.length != 0 ? height * 0.18 : height * 0.1,
      child: Column(
        children: [
          selectedRoutines.length != 0
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
                      itemCount: selectedRoutines.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: width * 0.025),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedRoutines.removeWhere((routine) =>
                                        routine ==
                                        selectedRoutines.elementAt(index));
                                  });
                                },
                                child: Icon(Icons.cancel),
                              ),
                              Text(
                                selectedRoutines
                                    .elementAt(index)['routineTitle'],
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
                color: selectedRoutines.length == 0
                    ? ColorDI.shootingBreeze
                    : ColorDI.clearChill,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (selectedRoutines.length != 0) Get.back();
                },
                child: Text(
                  '루틴 추가하기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: height * 0.1,
    // );
  }
}
