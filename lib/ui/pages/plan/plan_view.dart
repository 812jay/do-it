import 'package:do_it_app/utils/define.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanView extends StatefulWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  _PlanViewState createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '날짜',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Text('plan'),
        ),
      ),
    );
  }
}
