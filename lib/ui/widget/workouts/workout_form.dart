import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({Key? key, workouts}) : super(key: key);

  @override
  _WorkoutFormState createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  double width = Get.width;
  double height = Get.height;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('운동 추가하기'),
        ),
        body: getBody());
  }

  Widget getBody() {
    return Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '루틴이름',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            TextField(),
          ],
        ));
  }
}
