import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

// DateTime selectedDate = Get.arguments;

class WorkoutsView extends StatefulWidget {
  const WorkoutsView({Key? key}) : super(key: key);

  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  final double width = Get.width;
  final double height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                title: Container(
                  child: Text(
                    // DateFormat('yy.MM.dd').format(selectedDate),
                    '',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ), //헤더
              SliverStickyHeader(
                header: Container(
                  margin: EdgeInsets.only(
                    top: height * 0.02,
                    left: height * 0.02,
                    right: height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.43,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorDI.bruschettaTomato,
                          ),
                          child: Center(
                            child: Text(
                              '루틴추가',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ), //루틴추가
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.43,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorDI.bruschettaTomato,
                          ),
                          child: Center(
                            child: Text(
                              '운동추가',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ), //운동추가
                    ],
                  ),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      child: Column(
                        children: [],
                      ),
                    );
                  }),
                ),
              ), //서브 헤더
            ],
          ),
        ),
      ),
    );
  }
}
