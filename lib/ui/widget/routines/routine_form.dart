import 'package:do_it_app/ui/pages/workouts/workouts_view.dart';
import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RoutineForm extends StatefulWidget {
  const RoutineForm({Key? key}) : super(key: key);

  @override
  _RoutineFormState createState() => _RoutineFormState();
}

class _RoutineFormState extends State<RoutineForm> {
  final double width = Get.width;
  final double height = Get.height;
  @override
  Widget build(BuildContext context) {
    // var arguments = Get.arguments;
    // print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('루틴 수정'),
        // title: Text(widget.title != '' ? widget.title : '새로운 루틴'),
      ),
      body: getBody(),
      bottomNavigationBar: getBottomNav(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Form(
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '루틴이름',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              TextField(
                decoration: InputDecoration(hintText: '루틴이름을 입력해주세요.'),
              ), //루틴 이름
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return WorkoutsView();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_box, size: 32),
                      Text(
                        '운동 추가',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ), //운동추가
            ],
          ),
        ),
      ),
    );
  }

  Widget getBottomNav() {
    return Container(
      height: height * 0.1,
      child: Column(
        children: [
          Container(
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
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '루틴 생성하기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  } // bottom nav
}
