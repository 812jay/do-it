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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('운동 추가하기'),
        ),
        body: getBody());
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
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
          )),
    );
  }
}
